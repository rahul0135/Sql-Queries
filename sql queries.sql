use ecommerce_task3;
show tables;
SELECT 
    customer_id, customer_name, city
FROM
    customers;

select customer_id,customer_name,city
from customers
where city='visakhapatnam';

select product_name, unit_price
from products
order by unit_price desc;
joins

select o.order_id, c.customer_name, o.order_date, o.order_status
from orders o
inner join customers c
on o.customer_id=c.customer_id;

SELECT c.customer_id, c.customer_name, o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

sub query
Find customers who have placed more than 2 orders
SELECT customer_id, customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(order_id) > 2
);

Aggregate functions
Total sales:
SELECT SUM(quantity * unit_price - discount_amount) AS total_sales
FROM order_items;

Average product price
SELECT AVG(unit_price) AS average_product_price
FROM products;

view

CREATE VIEW customer_order_summary AS
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;


SELECT *
FROM customer_order_summary;