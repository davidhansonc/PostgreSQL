/*
*  How many people were hired on any given hire date?
*  Database: Employees
*  Table: Employees
*/

SELECT e.hire_date, count(e.emp_no)
FROM employees as e
GROUP BY e.hire_date
ORDER BY e.hire_date ASC;

/*
*  Show me all the employees, hired after 1991 and count the number of 
   positions they've had
*  Database: Employees
*/

SELECT e.emp_no, concat(e.first_name, ' ', e.last_name) as Name, count(t.title)
FROM employees as e
INNER JOIN titles as t ON e.emp_no = t.emp_no
WHERE EXTRACT(YEAR FROM e.hire_date) > 1991
GROUP BY e.emp_no
ORDER BY e.hire_date ASC, e.emp_no ASC;


/*
*  Show me all the employees that work in the department development 
   and the from and to date.
*  Database: Employees
*/

SELECT e.emp_no, de.from_date, de.to_date
FROM employees as e
INNER JOIN dept_emp as de ON e.emp_no = de.emp_no
WHERE de.dept_no = 'd005'
ORDER BY e.emp_no;