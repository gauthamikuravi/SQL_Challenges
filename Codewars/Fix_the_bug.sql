/*
Oh no! Timmys been moved into the database divison of his software company but as we know Timmy loves making mistakes. Help Timmy keep his job by fixing his query...

Timmy works for a statistical analysis company and has been given a task of calculating the highest average salary for a given job, the sample is compiled of 100 applicants each with a job and a salary. Timmy must display each unique job, the total average salary, the total people and the total salary and order by highest average salary. Timmy has some bugs in his query, help Timmy fix his query so he can keep his job!

people table schema
id
name
job table schema
id
people_id
job_title
salary
resultant table schema
job_title (unique)
average_salary (float, 2 dp)
total_people (int)
total_salary (float, 2 dp)
NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.
*/


/* specifying output table columns but with casting to ensure decimals are properly formatted */ 
SELECT DISTINCT j.job_title as job_title,  
CAST(ROUND((SUM(j.salary) / COUNT(p)), 2) AS FLOAT)  as average_salary,  
COUNT(p.id) as total_people, 
CAST(ROUND(SUM(j.salary), 2) as FLOAT) as total_salary 
FROM people p 
/* using INNER JOIN to get info from job table using the id from the people table and the people_id from the job table where they correspond */ 
INNER JOIN job AS j ON j.people_id = p.id 
GROUP BY job_title 
