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


/*Viewing all the rows contained in the TrilateralScores view*/

SELECT * FROM TrilateralScores;


/*Querying a view to find everyone in Trilateral who has scored under the pass mark of 20 in a module*/

SELECT member_name, module_name, student_module_score
FROM TrilateralScores
WHERE student_module_score < 20;


/*Dropping a view*/

DROP VIEW TrilateralList;

/*Creating a joint table of all the course modules and their names*/

SELECT content.course_id, course.course_name, module.module_id, module.module_name
FROM content, course, module
WHERE content.course_id = course.course_id AND content.module_id = module.module_id;

/*creating a view of scores over 40 ordered by highest first*/

SELECT organisation.organisation_name, module.module_name, member.member_name, results.student_module_score
FROM organisation, results, member, module
WHERE results.student_module_score >40 AND results.student_id = member.member_id AND organisation.organisation_id = member.parent_organisation_id AND results.module_id = module.module_id
ORDER BY results.student_module_score DESC;

/* creating a list of a managers direct reports and their module scores*/

SELECT  member.member_name, results.module_id, module.module_name, results.student_module_score
FROM relationships, results, module, member
WHERE relationships.line_manager_id = 6 AND relationships.member_rel_id = results.student_id AND results.student_module_score IS NOT NULL AND module.module_id = results.module_id AND member.member_id = results.student_id;

/*Using Transaction and rollback*/

Select * FROM organisation;
START TRANSACTION;
DELETE FROM organisation WHERE organisation_id = 3;
SELECT * FROM organisation;
ROLLBACK;
Select * FROM organisation;