USE course_sales;

/*insert organisations*/

INSERT INTO organisation (organisation_name, places_purchased, places_used)
VALUES ("Trilateral", 10, 8);
INSERT INTO organisation (organisation_name, places_purchased, places_used)
VALUES ("Bot Platform", 1540, 360);
INSERT INTO organisation (organisation_name, places_purchased, places_used)
VALUES ("Macdonals", 88, 22);
INSERT INTO organisation (organisation_name, places_purchased, places_used)
VALUES ("Money Matters", 15, 4);
INSERT INTO organisation (organisation_name, places_purchased, places_used)
VALUES ("Air Travel UK", 10, 0);
INSERT INTO organisation (organisation_name, places_purchased, places_used)
VALUES ("SCDC", 8, 8);

/*insert a member*/

INSERT INTO member (member_name, member_email, parent_organisation_id)
VALUES ("Bob Smith", "bob@trilateral.com", 1);
INSERT INTO member (member_name, member_email, parent_organisation_id)
VALUES ("Angela Bobs", "Angela@trilateral.com", 1);
INSERT INTO member (member_name, member_email, parent_organisation_id)
VALUES ("Robert Adams", "robert@trilateral.com", 1);
INSERT INTO member (member_name, member_email, parent_organisation_id)
VALUES ("Jeremy Hunt", "jeremy@trilateral.com", 1);
INSERT INTO member (member_name, member_email, parent_organisation_id, admin_permissions)
VALUES ("Lorraine Hall", "Lorraine@trilateral.com", 1, 1);
INSERT INTO member (member_name, member_email, parent_organisation_id)
VALUES ("Chris Borough", "Chris@trilateral.com", 1);
INSERT INTO member (member_name, member_email, parent_organisation_id)
VALUES ("Ryan Reynolds", "ryan@TB.com", 2);
INSERT INTO member (member_name, member_email, parent_organisation_id)
VALUES ("Andres Boyd", "Andes@TB.com", 2);
INSERT INTO member (member_name, member_email, parent_organisation_id)
VALUES ("Chris Hampson", "chris@TB.com", 2);

/*inserting the company Trilateral relationships*/

INSERT INTO relationships (member_rel_id, line_manager_id, direct_reports_id)
VALUES (1, 6, 2);
INSERT INTO relationships (member_rel_id, line_manager_id)
VALUES (2, 1);
INSERT INTO relationships (member_rel_id, line_manager_id)
VALUES (3, 6);
INSERT INTO relationships (member_rel_id, direct_reports_id)
VALUES (1, 4);
INSERT INTO relationships (member_rel_id, line_manager_id)
VALUES (5, 6);


/*Inserting data into the module table*/

INSERT INTO module (module_name)
VALUES ("Health and Safety Basics");
INSERT INTO module (module_name)
VALUES ("Fire Safety");
INSERT INTO module (module_name)
VALUES ("Phishing Attacks");
INSERT INTO module (module_name)
VALUES ("Internet Safety");
INSERT INTO module (module_name)
VALUES ("Using the VPN");
INSERT INTO module (module_name)
VALUES ("Enabling 2FA");
INSERT INTO module (module_name)
VALUES ("Welcome to the company");
INSERT INTO module (module_name)
VALUES ("How to book leave");
INSERT INTO module (module_name)
VALUES ("Your induction process");
INSERT INTO module (module_name)
VALUES ("Your probation review");


/* Inserting data into the course table*/

INSERT INTO course (course_name)
VALUES ("Health and Safety");
INSERT INTO course (course_name)
VALUES ("Cybersecurity");
INSERT INTO course (course_name)
VALUES ("New Starter");

/* Inserting data into the content table*/

INSERT INTO content (course_id, module_id)
VALUES (1,1);
INSERT INTO content (course_id, module_id)
VALUES (1,2);
INSERT INTO content (course_id, module_id)
VALUES (2,3);
INSERT INTO content (course_id, module_id)
VALUES (2,4);
INSERT INTO content (course_id, module_id)
VALUES (2,5);
INSERT INTO content (course_id, module_id)
VALUES (2,6);
INSERT INTO content (course_id, module_id)
VALUES (3,7);
INSERT INTO content (course_id, module_id)
VALUES (3,8);
INSERT INTO content (course_id, module_id)
VALUES (3,9);
INSERT INTO content (course_id, module_id)
VALUES (3,10);

/*Inserting data into the scores table*/

INSERT INTO results (student_id, module_id, student_module_score)
VALUES (1,1,95);
INSERT INTO results (student_id, module_id, student_module_score)
VALUES (1,2,90);
INSERT INTO results (student_id, course_id, student_passed)
VALUES (1,1,1);
INSERT INTO results (student_id, module_id, student_module_score)
VALUES (3,1,95);
INSERT INTO results (student_id, module_id, student_module_score)
VALUES (3,2,10);
INSERT INTO results (student_id, course_id, student_passed)
VALUES (3,1,0);
INSERT INTO results (student_id, module_id, student_module_score)
VALUES (2,5,75);
INSERT INTO results (student_id, module_id, student_module_score)
VALUES (5,5,95);
INSERT INTO results (student_id, module_id, student_module_score)
VALUES (5,6,95);
INSERT INTO results (student_id, module_id, student_module_score)
VALUES (5,7,95);
INSERT INTO results (student_id, module_id, student_module_score)
VALUES (5,8,95);
INSERT INTO results (student_id, module_id, student_module_score)
VALUES (5,9,95);