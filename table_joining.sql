-- Selects all salary listings for each employee.
SELECT a.emp_no, concat(a.first_name, ' ', a.last_name) AS "name", b.salary
FROM employees as a
INNER JOIN salaries as b ON b.emp_no = a.emp_no;