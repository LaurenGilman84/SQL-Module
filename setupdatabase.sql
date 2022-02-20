/*Drops the database if it does exist*/
DROP DATABASE IF EXISTS course_sales;

/*Create the database*/

CREATE DATABASE course_sales;
USE course_sales;

/*Create the organisation table*/

CREATE TABLE organisation (
    organisation_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    organisation_name VARCHAR(50) NOT NULL,
    key_contact_id INT NOT NULL,
    places_purchased INT,
    places_used INT
);

/*Create the member table*/

CREATE TABLE member (
    member_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    member_name VARCHAR(50) NOT NULL,
    member_email VARCHAR(100) NOT NULL,
    parent_organisation_id INT NOT NULL,
    admin_permissions BIT DEFAULT 0,
    courses_enrolled INT,
    enrollment_date DATE,
    line_manager_id INT,
    direct_reports INT,
    FOREIGN KEY (parent_organisation_id) REFERENCES organisation (organisation_id),
    FOREIGN KEY (line_manager_id) REFERENCES member (member_id),
    FOREIGN KEY (direct_reports) REFERENCES member (member_id)
);


/*Create the module table*/

CREATE TABLE IF NOT EXISTS module(
    module_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    module_name VARCHAR(100) NOT NULL,
    student_mod_id INT,
    student_module_score INT CHECK (student_module_score >=0 AND student_module_score <= 100),
    FOREIGN KEY (student_mod_id) REFERENCES member (member_id)
);

/*Create the Course Table*/

CREATE TABLE IF NOT EXISTS course(
    course_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    module_id INT,
    student_id INT,
    student_passed BIT DEFAULT 0,
    FOREIGN KEY (module_id) REFERENCES module (module_id),
    FOREIGN KEY (student_id) REFERENCES member (member_id)
);
