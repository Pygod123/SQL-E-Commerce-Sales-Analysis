CREATE TABLE customers ( 
		customer_id INT PRIMARY KEY ,
		customer_name VARCHAR(100),
		gender VARCHAR(10),
		age INT CHECK(age >=18) ,
		city VARCHAR(50),
		state VARCHAR (50),
		signup_date DATE);

CREATE TABLE products(
		product_id INT PRIMARY KEY,
		product_name VARCHAR(100),
		category VARCHAR(50),
		sub_category VARCHAR(50),
		brand VARCHAR(50),
		unit_price DECIMAL(10,2) CHECK(unit_price > 0) );

CREATE TABLE orders(
		order_id INT PRIMARY KEY,
		customer_id INT REFERENCES customers(customer_id),
		order_date DATE,
		payment_method VARCHAR (30),
		order_status VARCHAR (30) 
		CHECK(order_status IN('Pending','Completed','Cancelled','Returned')) ,
		shipping_city VARCHAR (50) );

CREATE TABLE orders_item(
		order_item_id INT PRIMARY KEY,
		order_id INT REFERENCES orders(order_id),
		product_id INT REFERENCES products(product_id),
		quantity INT CHECK(quantity > 0),
		discount DECIMAL(10,2)DEFAULT 0
CHECK(discount >= 0) );

		
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM orders_item;

-- Database Relationship
-- Customers --> Orders --> Orders_Item <-- Products

/*
====================================================
          SQL E-COMMERCE PROJECT
====================================================
Project: E-Commerce Sales Analysis
Database: PostgreSQL
Author: Punit Godiyal
Purpose: SQL Practice for Data Analyst Portfolio

Topic:  SQL Queries
====================================================
*/

-- Question 1:
-- Display all customer details.
SELECT * FROM customers;

-- Question 2:
-- Display only the customer names and their cities.
SELECT customer_name , city
FROM customers;

-- Question 3:
--Display all customers who are older than 30 years.
SELECT customer_name , age
FROM customers
WHERE age>30;

-- Question 4:
--Display all female customers.
SELECT customer_name , gender
FROM customers
WHERE gender='Female';

-- Question 5:
-- Display all customers who live in Delhi
SELECT customer_name , city
FROM customers
WHERE city='Delhi';

-- Question 6:
-- Display all products whose unit price is greater than ₹2,000.
SELECT product_name , unit_price 
FROM  products
WHERE unit_price>2000;

-- Question 7:
-- Display all products that belong to the Electronics category.
SELECT product_name , category
FROM products
WHERE Category='Electronics';

--Question 8:
-- Display all orders whose status is Completed.
SELECT order_id , order_status
FROM orders
WHERE order_status='Completed';

--Question 9:
--Display all customers who signed up after 1 January 2024
SELECT customer_name , signup_date
FROM customers
WHERE signup_date>'2024-01-01';

--Question 10:
--Display the first 10 products, ordered by unit price from highest to lowest.
SELECT product_name , unit_price 
FROM products
ORDER BY unit_price DESC
LIMIT 10;

--Question 11:
--Display all unique cities where customers live.
SELECT DISTINCT city 
FROM customers;

--Question 12:
--Display all products sorted by unit price from lowest to highest.
SELECT product_name , unit_price 
FROM products
ORDER BY unit_price ASC;

--Question 13:
--Display all customers whose names start with the letter 'A'.
SELECT customer_name 
FROM customers
WHERE customer_name
LIKE 'A%';

--Question 14:
--Display all customers whose names end with the letter 'n'.
SELECT customer_name
FROM customers
WHERE customer_name
LIKE '%n';

--Question 15:
--Display all customers whose age is between 25 and 35 years (inclusive).
SELECT customer_name , age 
FROM customers
WHERE age 
BETWEEN 25 AND 35;

--Question 16:
--Display all customers who live in Delhi, Mumbai, or Pune.
SELECT customer_name , city
FROM customers
WHERE city 
IN ( 'Delhi','Mumbai','Pune');

--Question 17:
--Display all female customers who are older than 30 years.
SELECT customer_name , age , gender
FROM customers
WHERE gender='Female' AND age>30;

--Question 18:
--Display all products that belong to the Electronics category OR have a unit price greater than ₹5,000.
SELECT product_name , category , unit_price
FROM products
WHERE category='Electronics' OR unit_price>5000;

--Question 19:
--Display all completed orders placed after 1 March 2024
SELECT order_id, order_date, order_status
FROM orders
WHERE order_date > '2024-03-01'
AND order_status = 'Completed';

--Question 20:
--Display the top 5 most expensive products in the Electronics category.
SELECT product_name , unit_price , category
FROM products
WHERE category='Electronics'
ORDER BY unit_price DESC 
LIMIT 5 ;

--Question 21:
--Display all customers except those who live in Delhi.
SELECT customer_name , city
FROM customers
WHERE NOT city='Delhi';

--Question 22:
--Display all products except those in the Electronics category.
SELECT product_name , category
FROM products
WHERE NOT category='Electronics';

--Question 23:
--Display all orders whose status is not 'Cancelled'.
SELECT order_id , order_status
FROM orders
WHERE order_status<>'Cancelled';

--Question 24:
--Display all customers whose age is not between 25 and 35.
SELECT customer_name , age
FROM customers
WHERE NOT age BETWEEN 25 AND 35;

--Question 25:
--Display all products whose unit price is between ₹1,000 and ₹5,000, sorted from lowest to highest price.
SELECT product_name , unit_price 
FROM products
WHERE unit_price 
BETWEEN 1000 AND 5000
ORDER BY unit_price;

--Question 26:
--Display the 5 cheapest products.
SELECT product_name , unit_price
FROM products
ORDER BY unit_price
LIMIT 5;

--Question 27:
--Display all customers whose names contain the letter 'a'.
SELECT customer_name , age
FROM customers
WHERE customer_name 
LIKE '%a%';

--Question 28:
--Display all customers whose names have exactly five characters.
SELECT customer_name , age
FROM customers
WHERE customer_name 
LIKE '_____';

--Question 29:
--Display all orders placed in the year 2024, sorted by the most recent order first.
SELECT order_id , order_date
FROM orders
WHERE order_date
BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY order_date DESC;

--Question 30:
--Display all products whose category is either Electronics or Furniture ,and whose unit price is greater than ₹2,000.
SELECT product_name, category, unit_price
FROM products
WHERE category IN ('Electronics', 'Furniture')
AND unit_price > 2000;

--Question 31:
--Count the total number of customers.
SELECT COUNT(customer_name) AS total_customers
FROM customers;

--Question 32:
--Count the total number of products.
SELECT COUNT(product_name) AS total_products
FROM products;

--Question 33:
--Find the average age of all customers.
SELECT AVG(age) 
FROM customers;

--Question 34:
--Find the minimum and maximum unit price of products.
SELECT MAX(unit_price) AS highest_price , 
MIN(unit_price) AS lowest_price
FROM products;

--Question 35:
--Find the total value of all product prices.
SELECT SUM(unit_price)
FROM products;

--Question 36:
--Find the average unit price of products in the Electronics category.
SELECT AVG (unit_price)
FROM products
WHERE category='Electronics';

--Question 37:
--Count how many orders have the status 'Completed'.
SELECT COUNT(order_id)
FROM orders
WHERE order_status='Completed';

--Question 38:
--Find the highest-priced product.
SELECT product_name , unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 1;

--Question 39:
--Find the lowest-priced product.
SELECT product_name , unit_price
FROM products
ORDER BY unit_price 
LIMIT 1;

--Question 40:
--Find the total number of customers from Delhi.
SELECT COUNT(customer_name)
FROM customers
WHERE city = 'Delhi';

--Question 41:
--Count the number of customers in each city.
SELECT city , COUNT (customer_name)
FROM customers
GROUP BY city;

--Question 42:
--Find the average age of customers in each city.
SELECT city , AVG(age)
FROM customers
GROUP BY city;

--Question 43:
--Count the number of products in each category.
SELECT category , COUNT(product_name)
FROM products
GROUP BY category;

--Question 44:
--Find the average unit price for each product category.
SELECT category , AVG(unit_price)
FROM products
GROUP BY category;

--Question 45:
--Find the highest unit price in each product category.
SELECT category , MAX(unit_price)
FROM products
GROUP BY category;

--Question 46:
--Count the number of orders for each order status.
SELECT order_status , COUNT(order_id)
FROM orders
GROUP BY order_status;

--Question 47:
--Find the total value of products in each category.
SELECT category , SUM(unit_price) 
AS total_category_value
FROM products
GROUP BY category;

--Question 48:
--Find the minimum and maximum unit price for each category.
SELECT category , MAX(unit_price) , MIN(unit_price)
FROM products
GROUP BY category;

--Question 49:
--Count the number of male and female customers.
SELECT gender, COUNT(customer_name)
AS total_customers
FROM customers
GROUP BY gender;

--Question 50:
--Find the average age of customers based on gender.
SELECT gender, 
AVG(age) AS average_age
FROM customers
GROUP BY gender;

--Question 51:
--Find the cities that have more than 5 customers.
SELECT city, 
COUNT(*) AS total_customers
FROM customers
GROUP BY city
HAVING COUNT(*) > 5;

--Question 52:
--Find the product categories that have more than 10 products.
SELECT category , 
COUNT(*) AS total_products
FROM products
GROUP BY category
HAVING COUNT(*) > 10;

--Question 53:
--Find the order statuses that have more than 20 orders.
SELECT order_status , 
COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
HAVING COUNT(*) > 20;

--Question 54:
--Find the cities where the average customer age is greater than 30.
SELECT city ,
AVG(age) AS average_age
FROM customers
GROUP BY city
HAVING AVG(age) > 30;

--Question 55:
--Find the product categories where the average unit price is greater than 5000.
SELECT category ,
AVG(unit_price) AS average_price
FROM products
GROUP BY category
HAVING AVG(unit_price) >5000;

--Question 56:
--Find the product categories where the highest unit price is greater than 10000.
SELECT category ,
MAX(unit_price) AS maximum_price
FROM products
GROUP BY category
HAVING MAX(unit_price)>10000; 

--Question 57:
--Find the product categories where the total value of products is greater than 10000.
SELECT category , 
SUM(unit_price) AS total_price
FROM products
GROUP BY category
HAVING SUM(unit_price) > 10000;

--Question 58:
--Find the genders that have more than 10 customers.
SELECT gender,
COUNT(*) AS total_customers
FROM customers
GROUP BY gender
HAVING COUNT(*) > 10;

--Question 59:
--Find the product categories where the minimum unit price is less than 1000.
SELECT category,
MIN(unit_price) AS minimum_price
FROM products
GROUP BY category
HAVING MIN(unit_price) < 1000;

--Question 60:
--Find the cities where the total number of customers is between 5 and 15.
SELECT city , 
COUNT(*) AS total_customerS
FROM customers
GROUP BY city
HAVING COUNT(*) BETWEEN 5 AND 15;

--Question 61:
--Display the order_id, customer_name, and order_date for all orders.
SELECT customer_name, order_id, order_date
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

--Question 62:
--Display the customer_name, city, and order_status for all orders.
SELECT customer_name , city , order_status
FROM customers 
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

--Question 63:
--Display the order_id, customer_name, product_name, and quantity for all orders.
SELECT o.order_id , c.customer_name , p.product_name ,oi.quantity
FROM orders AS o
INNER JOIN customers AS c
ON o.customer_id = c.customer_id
INNER JOIN orders_item AS oi
ON o.order_id = oi.order_id
INNER JOIN products AS p
ON oi.product_id = p.product_id;

--Question 64:
--Display the product_name, category, quantity, and total_amount for each order.
SELECT p.product_name, p.category , oi.quantity ,
(oi.quantity * p.unit_price) AS total_amount
FROM products AS p
INNER JOIN orders_item AS oi
ON p.product_id = oi.product_id;

--Question 65:
--Display the customer_name, product_name, order_date, and total_amount for completed orders only.
SELECT c.customer_name, p.product_name, o.order_date,
(oi.quantity * p.unit_price) - oi.discount AS total_amount
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id
INNER JOIN orders_item AS oi
ON o.order_id = oi.order_id
INNER JOIN products AS p
ON oi.product_id = p.product_id
WHERE o.order_status = 'Completed';

--Question 66:
--Display the customer_name and total number of orders placed by each customer.
SELECT c.customer_name,
COUNT(o.order_id) AS total_orders
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

--Question 67:
--Display the product_name and total quantity sold for each product.
SELECT p.product_name,
SUM(oi.quantity) AS total_quantity_sold
FROM products AS p
INNER JOIN orders_item AS oi
ON p.product_id = oi.product_id
GROUP BY p.product_name;

--Question 68:
--Display the customer_name and total amount spent by each customer.
SELECT c.customer_name , SUM(oi.quantity * p.unit_price) AS total_amount_spent
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id
INNER JOIN orders_item AS oi
ON o.order_id = oi.order_id
INNER JOIN products AS p
ON p.product_id = oi.product_id
GROUP BY c.customer_name;

--Question 69:
--Display the product_name and the number of times each product was ordered.
SELECT p.product_name , COUNT(oi.product_id) 
AS total_orders
FROM products AS p
INNER JOIN orders_item AS oi
ON p.product_id = oi.product_id 
GROUP BY product_name;

--Question 70:
--Display the customer_name, city, total number of orders, and total amount spent by each customer.
SELECT c.customer_name, c.city,
COUNT(DISTINCT o.order_id) AS total_orders,
SUM((oi.quantity * p.unit_price) - oi.discount) AS total_amount_spent
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id
INNER JOIN orders_item AS oi
ON o.order_id = oi.order_id
INNER JOIN products AS p
ON oi.product_id = p.product_id
GROUP BY c.customer_name, c.city;

--Question 71
--Display the customer_name and the total number of orders placed by each customer.
SELECT c.customer_name , COUNT(o.order_id)
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name ; 

--Question 72
---Display the city and the total amount spent by customers from each city.
SELECT c.city , SUM(oi.quantity * p.unit_price)
AS total_amount
FROM customers AS c 
INNER JOIN orders AS o
ON c.customer_id = o.customer_id
INNER JOIN orders_item as oi
ON o.order_id = oi.order_id
INNER JOIN products AS p
ON p.product_id = oi.product_id
GROUP BY c.city ; 

--Question 73
--Display the product_name and the total quantity sold for each product.
SELECT p.product_name,
SUM(oi.quantity) AS total_quantity_sold
FROM products AS p
INNER JOIN orders_item AS oi
ON p.product_id = oi.product_id
GROUP BY p.product_name;

--Question 74
--Display the customer_name and the number of different products purchased by each customer.
SELECT c.customer_name , COUNT(DISTINCT p.product_id) 
AS total_products
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id
INNER JOIN orders_item AS oi
ON o.order_id = oi.order_id
INNER JOIN products AS p
ON oi.product_id = p.product_id
GROUP BY c.customer_name ; 

--Question 75
--Display the category and the average quantity ordered for products in each category.
SELECT p.category , AVG(oi.quantity)
AS average_quantity
FROM products AS p
INNER JOIN orders_item AS oi
ON p.product_id = oi.product_id
GROUP BY p.category;

--Question 76
--Display the customer_name and the date of their latest order.
SELECT c.customer_name , MAX(o.order_date)
AS latest_order
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id 
GROUP BY c.customer_name;

--Question 77
--Display the product_name and the total revenue generated by each product.
SELECT p.product_name , SUM(oi.quantity * p.unit_price - oi.discount * oi.quantity)
AS total_revenue
FROM products AS p
INNER JOIN orders_item AS oi
ON p.product_id = oi.product_id 
GROUP BY p.product_name ;

--Question 78
--Display the city and the number of customers who have placed at least one order.
SELECT c.city,COUNT(DISTINCT c.customer_id) 
AS total_customers
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id
GROUP BY c.city;

--Question 79
--Display the order_status and the total revenue generated from each order status.
SELECT o.order_status , SUM(p.unit_price*oi.quantity - oi.discount)
AS total_revenue
FROM orders AS o
INNER JOIN orders_item AS oi
ON o.order_id = oi.order_id
INNER JOIN products AS p
ON p.product_id = oi.product_id
GROUP BY o.order_status;

--Question 80
--Display the top 3 customers who have spent the highest total amount.
SELECT c.customer_name , SUM(p.unit_price*oi.quantity)
AS total_amount
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id
INNER JOIN orders_item as oi
ON o.order_id = oi.order_id
INNER JOIN products AS p
ON p.product_id = oi.product_id
GROUP BY c.customer_name
ORDER BY total_amount DESC
LIMIT 3;

-- Question 81
--Display all customers along with their order_id. Include customers who have never placed an order.
SELECT c.customer_name , o.order_id
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id;

-- Question 82
--Display all customers and the total number of orders placed by each customer. Customers with no orders should also appear.
SELECT c.customer_name , COUNT(o.order_id) 
AS total_orders
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id 
GROUP BY c.customer_name ; 

-- Question 83
--Display all products and the quantity sold. Include products that have never been sold.
SELECT p.product_name,
COALESCE(SUM(oi.quantity), 0) AS total_quantity_sold
FROM products AS p
LEFT JOIN orders_item AS oi
ON p.product_id = oi.product_id
GROUP BY p.product_name;

-- Question 84
--Display all products along with the total revenue generated by each product. Products with no sales should also appear.
SELECT p.product_name,
COALESCE(SUM((oi.quantity * p.unit_price) - oi.discount), 0) AS total_revenue
FROM products AS p
LEFT JOIN orders_item AS oi
ON p.product_id = oi.product_id
GROUP BY p.product_name;

-- Question 85
--Display all customers along with their latest order date. Customers who have never placed an order should also appear.
SELECT c.customer_name , MAX(o.order_date)
AS latest_date
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id 
GROUP BY c.customer_name ; 

-- Question 86
--Display all cities and the total number of orders placed by customers from each city. Cities with customers who never ordered should also appear.
SELECT c.city , COUNT(o.order_id)
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
GROUP BY c.city ; 

-- Question 87
--Display all products along with the number of customers who purchased each product. Include products that have never been purchased.
SELECT p.product_name , COUNT(DISTINCT c.customer_id)
FROM products AS p
LEFT JOIN orders_item AS oi
ON p.product_id = oi.product_id
LEFT JOIN orders AS o
ON oi.order_id = o.order_id
LEFT JOIN customers AS c
ON o.customer_id = c.customer_id
GROUP BY p.product_name ; 

-- Question 88
--Display all customers along with the total amount spent by each customer. Customers who never placed an order should show a total amount of 0.
SELECT c.customer_name , COALESCE(SUM(p.unit_price * oi.quantity),0) 
AS total_amount
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
LEFT JOIN orders_item as oi
ON o.order_id = oi.order_id
LEFT JOIN products AS p
ON p.product_id = oi.product_id
GROUP BY c.customer_name ; 

-- Question 89
--Display all products along with their category and the total quantity sold. Products with no sales should display 0.
SELECT p.product_name , p.category , COALESCE(SUM(oi.quantity), 0)
AS total_quantity
FROM products AS p
LEFT JOIN orders_item AS oi
ON p.product_id = oi.product_id
GROUP BY  p.product_name , p.category ;  

-- Question 90
--Display the top 5 customers who spent the highest amount. Include customers with no orders (their total amount should be 0).
SELECT c.customer_name ,  COALESCE(SUM(p.unit_price * oi.quantity),0)
AS total_amount
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
LEFT JOIN orders_item as oi
ON o.order_id = oi.order_id
LEFT JOIN products AS p
ON p.product_id = oi.product_id
GROUP BY c.customer_name
ORDER BY total_amount DESC
LIMIT 5;

-- Question 91
-- Display all orders along with the customer_name. Include orders even if customer details are missing.
SELECT c.customer_name , o.order_id 
FROM customers AS c
RIGHT JOIN orders AS o
ON c.customer_id = o.customer_id;

-- Question 92
-- Display all orders and the city of the customer who placed them. Include orders that have no matching customer.
SELECT c.city , o.order_id 
FROM customers AS c
RIGHT JOIN orders AS o
ON  c.customer_id = o.customer_id;

-- Question 93
-- Display all order_items along with the product_name. Include order_items even if the product is missing from the products table.
SELECT oi.order_item_id,p.product_name
FROM products AS p
RIGHT JOIN orders_item AS oi
ON p.product_id = oi.product_id;

-- Question 94
-- Display all order_items along with the category of the product. Include order_items even if the product does not exist.
SELECT oi.order_item_id , p.category
FROM products AS p
RIGHT JOIN orders_item AS oi
ON p.product_id = oi.product_id;

-- Question 95
-- Display all orders along with the total quantity of products in each order. Include orders even if no products were added.
SELECT o.order_id , COALESCE(SUM(oi.quantity), 0)
AS total_quantity
FROM orders_item AS oi
RIGHT JOIN orders AS o
ON o.order_id = oi.order_id
GROUP BY o.order_id;

-- Question 96
-- Display all order_items along with the customer_name. Include order_items even if customer information is missing.
SELECT oi.order_item_id, c.customer_name
FROM orders_item AS oi
LEFT JOIN orders AS o
ON oi.order_id = o.order_id
LEFT JOIN customers AS c
ON o.customer_id = c.customer_id;

-- Question 97
-- Display all products and the order_id in which they were purchased. Include every order_item even if the product record is missing.
SELECT p.product_name, oi.order_id
FROM products AS p
RIGHT JOIN orders_item AS oi
ON p.product_id = oi.product_id;

-- Question 98
-- Display all orders along with the total revenue generated from each order. Include orders that have no order_items (show revenue as 0).
SELECT o.order_id,
COALESCE(SUM((p.unit_price * oi.quantity) - oi.discount), 0) AS total_revenue
FROM orders AS o
LEFT JOIN orders_item AS oi
ON o.order_id = oi.order_id
LEFT JOIN products AS p
ON oi.product_id = p.product_id
GROUP BY o.order_id;

-- Question 99
-- Display all order_items along with the order_status. Include order_items even if the order record is missing.
SELECT oi.order_item_id, o.order_status
FROM orders AS o
RIGHT JOIN orders_item AS oi
ON o.order_id = oi.order_id;

-- Question 100
-- Display all order_items along with the customer_name, product_name, quantity, and total amount for each item. Include every order_item even if related customer, order, or product information is missing.
SELECT oi.order_item_id, c.customer_name, p.product_name, oi.quantity,
COALESCE((p.unit_price * oi.quantity) - oi.discount, 0) AS total_amount
FROM orders_item AS oi
LEFT JOIN orders AS o
ON oi.order_id = o.order_id
LEFT JOIN customers AS c
ON o.customer_id = c.customer_id
LEFT JOIN products AS p
ON oi.product_id = p.product_id;

-- Question 101
-- Display the customer_name of customers whose age is greater than the average age of all customers.
SELECT customer_name , age
FROM customers
WHERE age > ( 
SELECT AVG(age)
FROM customers) ; 

-- Question 102
-- Display the product_name and unit_price of the most expensive product.
SELECT product_name,unit_price
FROM products
WHERE unit_price =
(SELECT MAX(unit_price)
FROM products);

-- Question 103
-- Display the customer_name of customers who have placed at least one order.
SELECT DISTINCT c.customer_name
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id;

-- Question 104
-- Display the product_name of products that have never been ordered.
SELECT product_name
FROM products
WHERE product_id NOT IN
(SELECT product_id
FROM orders_item); 

-- Question 105
-- Display the customer_name of customers who have spent more than the average amount spent by all customers.
WITH customer_spending AS
(SELECT c.customer_id,  c.customer_name,
 SUM((p.unit_price * oi.quantity) - oi.discount) AS total_spent
 FROM customers AS c
 INNER JOIN orders AS o
 ON c.customer_id = o.customer_id
 INNER JOIN orders_item AS oi
 ON o.order_id = oi.order_id
 INNER JOIN products AS p
 ON p.product_id = oi.product_id
 GROUP BY c.customer_id, c.customer_name
)
SELECT customer_name, total_spent
FROM customer_spending
WHERE total_spent > (
SELECT AVG(total_spent)
FROM customer_spending
);

-- Question 106
-- Display the order_id whose total revenue is the highest.
SELECT oi.order_id,
SUM(p.unit_price * oi.quantity - oi.discount)
AS total_revenue
FROM orders AS o
INNER JOIN orders_item AS oi
ON o.order_id = oi.order_id
INNER JOIN products AS p
ON oi.product_id = p.product_id
GROUP BY oi.order_id
ORDER BY total_revenue DESC
LIMIT 1;

-- Question 107
-- Display the product_name of products whose unit_price is greater than the average unit_price of their category.
SELECT product_name , unit_price
FROM products AS P
WHERE unit_price >
(SELECT AVG(unit_price)
FROM products
WHERE category = p.category) ;

-- Question 108
-- Display the customer_name of customers who purchased the most expensive product.
SELECT DISTINCT c.customer_name
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id
INNER JOIN orders_item AS oi
ON o.order_id = oi.order_id
INNER JOIN products AS p
ON oi.product_id = p.product_id
WHERE p.unit_price =
(SELECT MAX(unit_price)
FROM products);

-- Question 109
-- Display the city whose customers generated the highest total revenue.
SELECT c.city , SUM(p.unit_price * oi.quantity - oi.discount)
AS total_revenue
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id
INNER JOIN orders_item AS oi
ON o.order_id = oi.order_id
INNER JOIN products AS p
ON oi.product_id = p.product_id
GROUP BY city 
ORDER BY total_revenue DESC
LIMIT 1 ;

-- Question 110
-- Display the customer_name and total amount spent by the customer who spent the highest amount.
SELECT c.customer_name, SUM(p.unit_price * oi.quantity)
AS total_amount
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id
INNER JOIN orders_item AS oi
ON o.order_id = oi.order_id
INNER JOIN products AS p
ON oi.product_id = p.product_id
GROUP BY customer_name 
ORDER BY total_amount DESC
LIMIT 1 ;

-- Question 111
-- Display product_name, unit_price,
-- and create a column called price_category.
-- If unit_price >= 5000 → 'Expensive'
-- Otherwise → 'Affordable'
SELECT product_name , unit_price ,
CASE 
WHEN unit_price >= 5000 THEN 'Expensive'
ELSE 'Affordable'
END AS price_category
FROM products;

-- Question 112
-- Display customer_name and age.
-- Create a column called age_group.
-- If age >= 60 → 'Senior'
-- If age >= 30 → 'Adult'
-- Otherwise → 'Young'
SELECT customer_name , age ,
CASE
WHEN age >=60 THEN 'Senior'
WHEN age >=30 THEN 'Adult'
ELSE 'Young'
END AS age_group
FROM customers;

-- Question 113
-- Display order_id and total_amount
-- (unit_price × quantity − discount).
-- Create a column called order_type.
-- If total_amount >= 10000 → 'Premium'
-- Otherwise → 'Regular'
SELECT oi.order_id , p.unit_price * oi.quantity - oi.discount
AS total_amount ,
CASE 
WHEN  (p.unit_price * oi.quantity - oi.discount) >= 10000 THEN 'Premium'
ELSE 'Regular' 
END AS order_type
FROM products AS p
INNER JOIN orders_item as oi
ON p.product_id = oi.product_id ; 

-- Question 114
-- Display product_name and unit_price.
-- Create a column called discount_category.
-- If unit_price >= 10000 → 'Luxury'
-- If unit_price >= 5000 → 'Standard'
-- Otherwise → 'Budget'
SELECT product_name , unit_price ,
CASE 
WHEN unit_price >= 10000 THEN  'Luxury'
WHEN unit_price >= 5000 THEN 'Standard'
ELSE 'Budget'
END AS discount_category
FROM products;

-- Question 115
-- Display customer_name and city.
-- Create a column called metro_city.
-- If city is 'Delhi' or 'Mumbai' → 'Metro'
-- Otherwise → 'Non Metro'
SELECT customer_name , city ,
CASE
WHEN city = 'Delhi'
OR city = 'Mumbai' THEN 'Metro'
ELSE 'Non_metro'
END AS metro_city
FROM customers ; 

-- Question 116
-- Display order_id and quantity.
-- Create a column called quantity_level.
-- If quantity >= 5 → 'Bulk Order'
-- Otherwise → 'Normal Order'
SELECT order_id , quantity ,
CASE
WHEN quantity >= 5 THEN 'Bulk Order'
ELSE 'Normal Order'
END AS quantity_level
FROM orders_item;

-- Question 117
-- Display product_name and category.
-- Create a column called category_type.
-- If category = 'Electronics' → 'Electronic Product'
-- Otherwise → 'Other Product'
SELECT product_name , category ,
CASE 
WHEN category = 'Electronics' THEN 'Electronic Product'
ELSE  'Other Product'
END AS category_type
FROM products ; 

-- Question 118
-- Display customer_name and total amount spent.
-- Create a column called customer_segment.
-- If total amount spent >= 50000 → 'Gold'
-- If total amount spent >= 20000 → 'Silver'
-- Otherwise → 'Bronze'
SELECT c.customer_name , SUM(p.unit_price * oi.quantity - oi.discount)
AS total_amount_spent ,
CASE
WHEN SUM(p.unit_price * oi.quantity - oi.discount) >= 50000 THEN 'Gold'
WHEN SUM(p.unit_price * oi.quantity - oi.discount) >= 20000 THEN 'Silver'
ELSE  'Bronze'
END AS customer_segment
FROM customers as C
INNER JOIN orders AS o 
ON c.customer_id = o.customer_id
INNER JOIN orders_item AS oi
ON o.order_id = oi.order_id
INNER JOIN products AS p
ON oi.product_id = p.product_id 
GROUP BY c.customer_name; 

-- Question 119
-- Display city and total revenue generated.
-- Create a column called revenue_status.
-- If revenue >= 100000 → 'High Revenue'
-- Otherwise → 'Low Revenue'
SELECT c.city , SUM(oi.quantity * p.unit_price - oi.discount)
AS total_revenue_generated ,
CASE
WHEN SUM(oi.quantity * p.unit_price - oi.discount) >= 100000 THEN 'High Revenue'
ELSE 'Low Revenue'
END AS revenue_status
FROM customers as C
INNER JOIN orders AS o 
ON c.customer_id = o.customer_id
INNER JOIN orders_item AS oi
ON o.order_id = oi.order_id
INNER JOIN products AS p
ON oi.product_id = p.product_id 
GROUP BY c.city; 
-- Question 110
-- Display product_name and total quantity sold.
-- Create a column called demand_status.
-- If total quantity sold >= 20 → 'High Demand'
-- Otherwise → 'Low Demand'
SELECT p.product_name , SUM(oi.quantity)
AS total_quantity , 
CASE 
WHEN SUM(oi.quantity) >= 20 THEN 'High Demand' 
ELSE 'Low Demand'
END AS demand_status
FROM products AS p
INNER JOIN orders_item AS oi
ON p.product_id = oi.product_id
GROUP BY p.product_name;

-- Question 111
-- Display all customer_name values in UPPERCASE.
SELECT UPPER(customer_name)
FROM customers;

-- Question 112
-- Display all product_name values in lowercase.
SELECT LOWER(product_name)
FROM products;

-- Question 113
-- Display customer_name and the number of characters in each customer_name.
SELECT customer_name , LENGTH(customer_name)
AS name_length
FROM customers;

-- Question 114
-- Display product_name and the number of characters in each product_name.
SELECT product_name , LENGTH(product_name)
AS name_length
FROM products;

-- Question 115
-- Display customer_name and city together in one column
-- as 'customer_name - city'.
SELECT CONCAT(customer_name , '-', city)
AS customer_name_city
FROM customers;

-- Question 116
-- Display product_name and category together
-- as 'product_name (category)'.
SELECT CONCAT(product_name,' (',category,')')
AS product_name_category
FROM products;

-- Question 117
-- Display only the first 3 characters of every customer_name.
SELECT SUBSTRING(customer_name , 1, 3)
AS customer_name_substring
FROM Customers;

-- Question 118
-- Display only the first 5 characters of every product_name.
SELECT SUBSTRING(product_name,1,5)
AS product_name_substring
FROM products;

-- Question 119
-- Display the last 4 characters of every product_name.
SELECT product_name, RIGHT(product_name, 4) 
AS last_4_characters
FROM products;
 
-- Question 120
-- Replace the word 'Laptop' with 'Notebook'
-- in product_name wherever it appears.
SELECT product_name,REPLACE(product_name, 'Laptop', 'Notebook')
AS updated_product_name
FROM products;

-- Question 121
-- Replace all spaces in customer_name with underscores (_).
SELECT REPLACE(customer_name ,' ', '_' )
FROM customers;

-- Question 122
-- Display customer_name after removing leading and trailing spaces.
SELECT TRIM(customer_name)
FROM customers;

-- Question 123
-- Display city names in uppercase
-- and customer_name in lowercase.
SELECT UPPER(city) AS city ,
LOWER(customer_name) AS customer_name
FROM customers;

-- Question 124
-- Display the first character of every city.
SELECT SUBSTRING(city,1,1)
FROM customers;

-- Question 125
-- Display the first 2 characters of category
-- and name the column category_code.
SELECT SUBSTRING(category,1,2)
AS cateogry_code 
FROM products;

-- Question 126
-- Display product_name,
-- then create a new column called short_name
-- containing only the first 8 characters.
SELECT product_name , 
SUBSTRING(product_name,1,8) 
AS short_name
FROM products;

-- Question 127
-- Display customer_name,
-- and create a username by combining
-- the first 3 letters of customer_name
-- with customer_id.
SELECT customer_name,
CONCAT( SUBSTRING(customer_name, 1, 3),customer_id) 
AS username
FROM customers;

-- Question 128
-- Display product_name in uppercase
-- and category in lowercase.
SELECT UPPER(product_name) , LOWER(category)
FROM products;

-- Question 129
-- Display product_name
-- and replace every occurrence of the letter 'a'
-- with '*'.
SELECT product_name , REPLACE(product_name,'a','*')
FROM products;

-- Question 130
-- Display customer_name,
-- city,
-- and create a column called full_address
-- by concatenating customer_name, a comma,
-- and city.
SELECT customer_name , city ,
CONCAT(customer_name , ',',city)
AS full_address
FROM customers;

-- Question 131
-- Display today's current date.
SELECT CURRENT_DATE;

-- Question 132
-- Display today's current timestamp.
SELECT CURRENT_TIMESTAMP;

-- Question 133
-- Display order_id, order_date,
-- and extract the year from order_date.
SELECT order_id , order_date ,
EXTRACT(year FROM order_date)
AS added_year
FROM orders;

-- Question 134
-- Display order_id, order_date,
-- and extract the month from order_date.
SELECT order_id , order_date ,
EXTRACT(month FROM order_date)
AS added_month
FROM orders;

-- Question 135
-- Display order_id, order_date,
-- and extract the day from order_date.
SELECT order_id , order_date ,
EXTRACT(day FROM order_date)
AS added_day
FROM orders;

-- Question 136
-- Display order_id, order_date,
-- and calculate how many days have passed
-- since the order was placed.
SELECT order_id , order_date,
current_date - order_date
AS added_date
FROM orders;

-- Question 137
-- Display order_id and order_date
-- in the format 'DD-MM-YYYY'.
SELECT order_id , order_date ,
TO_CHAR( order_date ,'DD-MM-YYYY')
AS formated_date
FROM orders;

-- Question 138
-- Display order_id and order_date
-- in the format 'Month YYYY'.
SELECT order_id , order_date ,
TO_CHAR(order_date, 'Month YYYY')
AS formated_date
FROM orders;

-- Question 139
-- Display all orders placed in the year 2024.
SELECT *
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2024;

-- Question 140
-- Display all orders placed in the month of January.
SELECT *
FROM orders
WHERE EXTRACT(month FROM order_date) = 1;

-- Question 141
-- Display a single list containing all customer_name
-- and product_name.
SELECT customer_name
FROM customers
UNION
SELECT product_name
FROM products ; 

-- Question 142
-- Display a single list containing all city
-- and category.
SELECT city
FROM customers 
UNION
SELECT category
FROM products;

-- Question 143
-- Display customer_id from customers
-- and customer_id from orders.
SELECT customer_id
FROM customers
UNION
SELECT customer_id
FROM orders;

-- Question 144
-- Display product_id from products
-- and product_id from orders_item.
SELECT product_id
FROM products
UNION
SELECT product_id
FROM orders_item;

-- Question 145
-- Display all customer_name
-- and product_name using.
SELECT customer_name
FROM customers
UNION ALL
SELECT product_name
FROM products;

-- Question 146
-- Display all customer_id from customers
-- and customer_id from orders.
SELECT customer_id
FROM customers
UNION ALL
SELECT customer_id
FROM orders;

-- Question 147
-- Display all city names from customers
-- and state names from customers.
SELECT city
FROM customers
UNION
SELECT state
FROM customers;

-- Question 148
-- Display all city names from customers
-- and state names from customers.
SELECT city
FROM customers
UNION ALL
SELECT state
FROM customers;

-- Question 149
-- Display all product_name
-- and category in a single column.
SELECT product_name
FROM products
UNION
SELECT category
FROM products;

-- Question 150
-- Display all customer_name
-- and city in a single column.
SELECT customer_name
FROM customers
UNION ALL
SELECT city
FROM customers;

-- Question 151
-- Create a CTE named expensive_products.
-- Store all products whose unit_price >= 5000.
-- Display all columns from the CTE.
WITH expensive_products AS
( SELECT product_name , unit_price
	FROM products
	WHERE unit_price>=5000)
SELECT *
FROM expensive_products;

-- Question 152
-- Create a CTE named adult_customers.
-- Store customer_name, city and age
-- where age >= 30.
-- Display all records from the CTE.
WITH adult_customers AS 
( SELECT customer_name , city , age 
	FROM customers 
	WHERE age>=30)
SELECT *
FROM adult_customers;

-- Question 153
-- Create a CTE named electronics_products.
-- Store all products whose category is 'Electronics'.
-- Display product_name and unit_price.
WITH electronics_products AS
( SELECT product_name , unit_price
	FROM products
	WHERE category = 'Electronics')
SELECT *
FROM electronics_products;

-- Question 154
-- Create a CTE named bulk_orders.
-- Store all order_item records
-- where quantity >= 5.
-- Display all records.
WITH bulk_orders AS 
( SELECT *
	FROM orders_item
	WHERE quantity >= 5)
SELECT *
FROM bulk_orders;

-- Question 155
-- Create a CTE named customer_orders.
-- Join customers and orders.
-- Store customer_name, order_id and order_date.
-- Display all records.
WITH customer_orders AS
( SELECT c.customer_name , o.order_id , o.order_date
	FROM customers AS C 
	INNER JOIN orders AS o
	ON c.customer_id=o.customer_id)
SELECT *
FROM customer_orders;

-- Question 156
-- Create a CTE named order_details.
-- Join products and orders_item.
-- Store product_name, quantity,
-- unit_price and discount.
-- Display all records.
WITH order_details AS
( SELECT p.product_name , oi.quantity , p.unit_price , oi.discount
	FROM products AS p
	INNER JOIN orders_item AS oi
	ON p.product_id=oi.product_id)
SELECT *
FROM order_details;

-- Question 157
-- Create a CTE named order_amount.
-- Calculate total_amount as
-- (quantity × unit_price) - discount.
-- Display order_id, product_name
-- and total_amount.
WITH order_amount AS 
( SELECT o.order_id , p.product_name , (oi.quantity * p.unit_price) - oi.discount 
	AS total_amount 
	FROM products AS p
	INNER JOIN orders_item AS oi
	ON p.product_id=oi.product_id
	INNER JOIN orders AS o
	ON o.order_id=oi.order_id)
SELECT *
FROM order_amount ; 

-- Question 158
-- Create a CTE named high_value_orders.
-- Store only those records
-- where total_amount >= 10000.
-- Display all columns.
WITH high_value_orders AS 
( SELECT   o.order_id, p.product_name, (oi.quantity * p.unit_price) - oi.discount 
	AS total_amount 
	FROM products AS p
	INNER JOIN orders_item AS oi
	ON p.product_id = oi.product_id
	WHERE (oi.quantity * p.unit_price) - oi.discount >= 10000 )
SELECT *
FROM high_value_orders;

-- Question 159
-- Create a CTE named customer_revenue.
-- Calculate total revenue generated
-- by each customer.
-- Display customer_name
-- and total_revenue.
WITH customer_revenue AS
(SELECT c.customer_name, SUM((oi.quantity * p.unit_price) - oi.discount) AS total_revenue
    FROM customers AS c
    INNER JOIN orders AS o
        ON c.customer_id = o.customer_id
    INNER JOIN orders_item AS oi
        ON o.order_id = oi.order_id
    INNER JOIN products AS p
        ON oi.product_id = p.product_id
    GROUP BY c.customer_name
)
SELECT *
FROM customer_revenue;

-- Question 160
-- Create a CTE named product_sales.
-- Calculate total quantity sold
-- for each product.
-- Display product_name
-- and total_quantity_sold.
WITH product_sales AS
( SELECT p.product_name, SUM(oi.quantity) AS total_quantity_sold
    FROM products p
    INNER JOIN orders_item oi
        ON p.product_id = oi.product_id
    GROUP BY p.product_name
)
SELECT *
FROM product_sales;

-- Question 161
-- Display order_id and order_date.
-- Create a column called row_num.
-- Number all orders according to order_date.
SELECT order_id , order_date ,
ROW_NUMBER() OVER(ORDER BY order_date)
AS row_num
FROM orders;

-- Question 162
-- Display product_name and unit_price.
-- Create a column called price_rank.
-- Rank products from highest unit_price to lowest
-- using RANK().
SELECT product_name , unit_price ,
RANK() OVER(ORDER BY unit_price DESC) 
AS price_rank
FROM products;

-- Question 163
-- Display product_name and unit_price.
-- Create a column called price_rank.
-- Rank products from highest unit_price to lowest
-- using DENSE_RANK().
SELECT product_name , unit_price ,
DENSE_RANK() OVER(ORDER BY unit_price DESC) 
AS price_rank
FROM products;

-- Question 164
-- Display product_name and unit_price.
-- Create a column called row_num.
-- Number products from highest unit_price to lowest
-- using ROW_NUMBER().
SELECT product_name , unit_price ,
ROW_NUMBER() OVER(ORDER BY unit_price DESC) 
AS row_num
FROM products;

-- Question 165
-- Display customer_id, order_id and order_date.
-- Create a column called customer_order_number.
-- Number each customer's orders according to order_date.
-- Restart the numbering for every customer.
SELECT customer_id , order_id , order_date ,
ROW_NUMBER() OVER( PARTITION BY customer_id
					ORDER BY order_date) 
AS customer_order_number
FROM orders;

-- Question 166
-- Display product_name, category and unit_price.
-- Create a column called category_rank.
-- Rank products by unit_price within each category.
-- Highest price should receive rank 1.
SELECT product_name , category , unit_price ,
RANK() OVER( PARTITION BY category
			 ORDER BY unit_price DESC)
AS category_rank
FROM products;

-- Question 167
-- Display product_name, category and unit_price.
-- Create a column called category_row_number.
-- Number products according to unit_price within each category.
SELECT product_name , category , unit_price , 
ROW_NUMBER() OVER( PARTITION BY category
			 ORDER BY unit_price )
AS category_row_number
FROM products;

-- Question 168
-- Display order_id and quantity.
-- Create a column called running_quantity.
-- Calculate the running total of quantity
-- according to order_id.
SELECT order_id , quantity , 
SUM(quantity) OVER(ORDER BY order_id)
AS running_quantity
FROM orders_item ;

-- Question 169
-- Display order_id, order_date and quantity.
-- Create a column called running_quantity.
-- Calculate the running total of quantity
-- according to order_date.
SELECT o.order_id , o.order_date , oi.quantity ,
SUM(oi.quantity) OVER(ORDER BY o.order_date)
AS running_quantity
FROM orders AS o
INNER JOIN orders_item AS oi
ON o.order_id = oi.order_id ;

-- Question 170
-- Display product_name and unit_price.
-- Create a column called average_price.
-- Display the average unit_price of all products
-- alongside every product.
SELECT product_name , unit_price , 
AVG(unit_price) OVER()
AS average_price
FROM products;

-- Question 171
-- Display product_name, category and unit_price.
-- Create a column called category_average_price.
-- Display the average unit_price of each category
-- alongside every product.
SELECT product_name , category , unit_price , 
AVG(unit_price) OVER(PARTITION BY category)
AS category_average_price
FROM products;

-- Question 172
-- Display customer_id, order_id and order_date.
-- Create a column called previous_order_date.
-- Display the previous order date for each customer
-- using LAG().
SELECT customer_id , order_id , order_date, 
LAG(order_date) OVER(PARTITION BY customer_id
					  ORDER BY order_date)
AS previous_order_date
FROM orders;

-- Question 173
-- Display customer_id, order_id and order_date.
-- Create a column called next_order_date.
-- Display the next order date for each customer
-- using LEAD().
SELECT customer_id , order_id , order_date, 
LEAD(order_date) OVER(PARTITION BY customer_id
					  ORDER BY order_date)
AS next_order_date
FROM orders;

-- Question 174
--Create a view named customer_orders.
--The view should contain:
--customer_name
--order_id
--order_date
--Join customers and orders using customer_id.
--Then display all records from the view.
CREATE VIEW customer_orders AS  
SELECT c.customer_name, o.order_id, o.order_date
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id;
SELECT *
FROM customer_orders;


SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM orders_item;
