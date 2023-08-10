/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT p.product_name, c.category_name
FROM products p
JOIN categories c ON p.category_id = c.category_id
WHERE c.category_name = 'Computers';


/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT p.product_name, p.product_price, r.product_rating
FROM products p
JOIN ratings r ON p.product_id = r.product_id
WHERE r.product_rating = 5;


/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT o.employee_id, e.employee_name, SUM(o.quantity) AS total_quantity_sold
FROM orders o
JOIN employees e ON o.employee_id = e.employee_id
GROUP BY o.employee_id, e.employee_name
ORDER BY total_quantity_sold DESC
LIMIT 1;


/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.department_name, c.category_name
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN departments d ON c.department_id = d.department_id
WHERE c.category_name IN ('Appliances', 'Games');

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.product_name,
       SUM(o.quantity) AS total_quantity_sold,
       SUM(o.quantity * p.product_price) AS total_price_sold
FROM products p
JOIN orders o ON p.product_id = o.product_id
WHERE p.product_name = 'Eagles: Hotel California';


/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.product_name, r.reviewer_name, rv.rating, rv.comment
FROM products p
JOIN reviews rv ON p.product_id = rv.product_id
JOIN reviewers r ON rv.reviewer_id = r.reviewer_id
WHERE p.product_name = 'Visio TV'
  AND rv.rating = (
    SELECT MIN(rating) FROM reviews WHERE product_id = p.product_id
  );

