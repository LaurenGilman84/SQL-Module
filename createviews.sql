USE course_sales;

/*Creating a view for the course admin that shows the name of a course and all the modules contained
within that course*/

CREATE VIEW CourseContent (course_id, course_name, module_id, module_name) AS
SELECT content.course_id, content.module_id, course.course_name, module.module_name
FROM content, course, module
WHERE content.course_id = course.course_id AND content.module_id = module.module_id;


/*Creating a view for the sales team where they can see all the organisations signed up and the names of the users enrolled
for that organisation*/

CREATE VIEW OrganisationList (organisation_id, organisation_name, member_name) AS
SELECT organisation.organisation_id, organisation.organisation_name, member.member_name
FROM organisation, member
WHERE organisation.organisation_id = parent_organisation_id;

/*Creating a view for the Trilateral HR Manager to see which staff members are enrolled on which courses and which modules*/ 


CREATE VIEW TrilateralStaff (organisation_id, member_id, member_name, course_id, course_name, module_id, module_name) AS
SELECT organisation.organisation_id, member.member_id, member.member_name, course.course_id, course.course_name, module.module_id, module.module_name
FROM organisation, member, content, course, module
WHERE organisation.organisation_id = 1 AND organisation.organisation_id = member.parent_organisation_id AND content.course_id = course.course_id AND content.module_id = module.module_id;


/*Creating a view for the Trilateral HR Manager to see staff scores for all modules taken*/ 


CREATE VIEW TrilateralScores (organisation_id, member_id, member_name, course_id, course_name, module_id, module_name, student_module_score) AS
SELECT organisation.organisation_id, member.member_id, member.member_name, course.course_id, course.course_name, module.module_id, module.module_name, results.student_module_score
FROM organisation, member, content, course, module, results
WHERE organisation.organisation_id = 1 AND organisation.organisation_id = member.parent_organisation_id AND content.course_id = course.course_id AND content.module_id = module.module_id AND results.module_id = module.module_id AND results.student_module_score IS NOT NULL;