
/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or 
            Oregon (OR) state
* ordered by orderid
*/
SELECT o.orderid, o.totalamount, CONCAT(c.firstname, ' ', c.lastname) AS "Name", c.state FROM orders AS o
INNER JOIN customers AS c ON o.customerid = c.customerid
    WHERE c.state IN ('OH', 'OH', 'NY')
ORDER BY orderid;


/*
* DB: Store
* Table: products
* Question: Show me the inventory for each product
*/
SELECT p.prod_id, i.quan_in_stock FROM products as p
INNER JOIN inventory AS i ON p.prod_id = i.prod_id
ORDER BY p.prod_id;


/*
* DB: Employees
* Table: employees
* Question: Show me for each employee which department they work in
*/
SELECT a.emp_no, CONCAT(first_name, ' ', last_name) as Name, c.dept_name FROM employees AS a
INNER JOIN dept_emp as b ON a.emp_no = b.emp_no
INNER JOIN departments as c ON b.dept_no = c.dept_no
ORDER BY a.emp_no;