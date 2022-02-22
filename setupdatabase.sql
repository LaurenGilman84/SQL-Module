/*Drops the database if it does exist*/
DROP DATABASE IF EXISTS course_sales;

/*Create the database*/

CREATE DATABASE course_sales;
USE course_sales;

/*Create the organisation table*/

CREATE TABLE IF NOT EXISTS organisation (
    organisation_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    organisation_name VARCHAR(50) NOT NULL,
    places_purchased INT,
    places_used INT
);

/*Create the member table*/

CREATE TABLE IF NOT EXISTS member (
    member_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    member_name VARCHAR(50) NOT NULL,
    member_email VARCHAR(100) NOT NULL,
    parent_organisation_id INT NOT NULL,
    admin_permissions BIT DEFAULT 0,
    enrollment_date DATE,
    FOREIGN KEY (parent_organisation_id) REFERENCES organisation (organisation_id)
);

/*Create the relationships table*/

CREATE TABLE IF NOT EXISTS relationships(
    relationship_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    member_rel_id INT,
    line_manager_id INT,
    direct_reports_id INT,
    FOREIGN KEY (member_rel_id) REFERENCES member (member_id),
    FOREIGN KEY (line_manager_id) REFERENCES member (member_id),
    FOREIGN KEY (direct_reports_id) REFERENCES member (member_id)
);


/*Create the module table*/

CREATE TABLE IF NOT EXISTS module(
    module_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    module_name VARCHAR(100) NOT NULL
);

/*Create the course Table*/

CREATE TABLE IF NOT EXISTS course(
    course_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL
);

/*Create the content Table*/

CREATE TABLE IF NOT EXISTS content(
    content_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    module_id INT,
    FOREIGN KEY (module_id) REFERENCES module (module_id),
    FOREIGN KEY (course_id) REFERENCES course (course_id)
);

/*Create the results table*/

CREATE TABLE IF NOT EXISTS results(
    result_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    module_id INT,
    student_module_score INT CHECK (student_module_score >=0 AND student_module_score <= 100),
    course_id INT,
    student_passed BIT,
    FOREIGN KEY (student_id) REFERENCES member (member_id),
    FOREIGN KEY (module_id) REFERENCES module (module_id),
    FOREIGN KEY (course_id) REFERENCES course (course_id)
);
