USE course_sales;

/*insert organisations*/

INSERT INTO organisation (organisation_name, places_purchased, places_used)
VALUES ("Trilateral", 6, 1);
INSERT INTO organisation (organisation_name, places_purchased, places_used)
VALUES ("Bot Platform", 1540, 360);

/*insert a member*/

INSERT INTO member (member_name, member_email, parent_organisation_id)
VALUES ("Bob Smith", "bob@trilateral.com", 1);


