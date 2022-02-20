USE course_sales;

/*insert organisations*/

INSERT INTO organisation (organisation_name, places_purchased, places_used)
VALUES ("Trilateral", 6, 1);
INSERT INTO organisation (organisation_name, places_purchased, places_used)
VALUES ("Bot Platform", 1540, 360);

/*insert a member*/

INSERT INTO member (member_name, member_email, parent_organisation_id)
VALUES ("Bob Smith", "bob@trilateral.com", 1);
INSERT INTO member (member_name, member_email, parent_organisation_id)
VALUES ("Angela Bobs", "Angela@trilateral.com", 1);
INSERT INTO member (member_name, member_email, parent_organisation_id)
VALUES ("Ryan Reynolds", "ryan@TB.com", 2);
INSERT INTO member (member_name, member_email, parent_organisation_id, line_manager_id)
VALUES ("Andres Boyd", "Andes@TB.com", 2, 3);
INSERT INTO member (member_name, member_email, parent_organisation_id)
VALUES ("Chris Hampson", "chris@TB.com", 2);
