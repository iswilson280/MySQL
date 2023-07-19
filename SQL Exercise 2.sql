/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT p.productname, c.categoryname
FROM products p
JOIN categories c ON p.category_id = c.category_id
WHERE c.categoryname = 'Computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT product_name, productprice, productrating
FROM products
WHERE productrating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employee_id, SUM(quantity_sold) AS total_quantity_sold
FROM sales
GROUP BY employee_id
ORDER BY total_quantity_sold DESC
LIMIT 1;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.department_name, c.category_name
FROM departments d
JOIN categories c ON d.category_id = c.category_id
WHERE c.category_name IN ('Appliances', 'Games');

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.productname, SUM(s.quantitysold) AS totalquantitysold, SUM(s.total_price) AS total_price_sold
FROM products p
JOIN sales s ON p.product_id = s.product_id
WHERE p.product_name = 'Eagles: Hotel California'
GROUP BY p.productname;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.product_name, r.reviewername, r.rating, r.comment
FROM products p
JOIN reviews r ON p.product_id = r.product_id
WHERE p.product_name = 'Visio TV'
ORDER BY r.rating ASC
LIMIT 1;
