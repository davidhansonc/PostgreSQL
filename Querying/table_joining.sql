-- Selects all salary listings for each employee.
/*
SELECT a.emp_no, concat(a.first_name, ' ', a.last_name) AS "name", b.salary
FROM employees AS a
INNER JOIN salaries as b ON b.emp_no = a.emp_no
ORDER BY a.emp_no;
*/

-- Select salaries that lead to a new title
SELECT a.emp_no, b.salary, COALESCE(c.title, '-'), b.from_date
FROM employees AS a
INNER JOIN salaries as b ON b.emp_no = a.emp_no
LEFT JOIN titles as c 
    ON c.emp_no = a.emp_no AND c.from_date = (b.from_date + INTERVAL '2 days')
ORDER BY a.emp_no ASC;