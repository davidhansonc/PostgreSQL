
/*
*  Show me all the employees, hired after 1991, that have had more than 2 titles
*  Database: Employees
*/

SELECT e.emp_no, concat(e.first_name, ' ', e.last_name) 
      AS "Name", count(t.title) AS "No. of Titles", e.hire_date
FROM employees AS e
JOIN titles AS t
      ON e.emp_no = t.emp_no
WHERE extract(year FROM e.hire_date) > 1991
GROUP BY e.emp_no
      HAVING COUNT(t.title) > 2
ORDER BY e.emp_no ASC;


/*
*  Show me all the employees that have had more than 15 salary changes that work 
   in the department development
*  Database: Employees
*/

SELECT  e.emp_no
      ,CONCAT(e.first_name,' ',e.last_name) AS "Name"
      ,COUNT(s.salary)                      AS "salary changes"
FROM employees AS e
JOIN salaries AS s
      ON e.emp_no = s.emp_no
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS dp ON de.dept_no = dp.dept_no
WHERE de.dept_no = 'd005'
GROUP BY  e.emp_no
      HAVING COUNT(s.salary) > 15
ORDER BY e.emp_no ASC;


/*
*  Show me all the employees that have worked for multiple departments
*  Database: Employees
*/
SELECT  e.emp_no, COUNT(de.dept_no)
FROM employees AS e
JOIN dept_emp AS de USING(emp_no)
GROUP BY  e.emp_no
HAVING COUNT(de.dept_no) > 1
ORDER BY e.emp_no;