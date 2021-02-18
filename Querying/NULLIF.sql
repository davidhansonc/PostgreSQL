/*
* DB: Store
* Table: products
* Question: Show NULL when the product is not on special (0)
*/

SELECT *, NULLIF(special, 0) AS "special"
FROM products;