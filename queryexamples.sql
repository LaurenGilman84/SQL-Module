/*Viewing the data in all the tables*/

SELECT * FROM organisation;
SELECT * FROM member;
SELECT * FROM relationships;
SELECT * FROM module;
SELECT * FROM course;
SELECT * FROM results;

/*Viewing the student ID of everyone who has passed a course*/ 

SELECT * FROM results WHERE student_passed = 1;

/*Viewing all the module ids for course id 3*/

SELECT * FROM content WHERE course_id = 3;


