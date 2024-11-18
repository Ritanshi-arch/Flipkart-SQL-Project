--1. Retrieve a list of all customers with their corresponding product names they ordered.
SELECT c.customer_id, c.customer_name, p.product_name
FROM customers c
INNER JOIN sales s ON s.customer_id = c.customer_id
INNER JOIN products p ON s.product_id=p.product_id;

--2. List all products and show the details of customers who have placed orders for them. Include products that have no orders.
SELECT p.product_id, p.product_name, p.price, p.category, c.customer_id, c.state, 
       c.customer_name
FROM products p
LEFT JOIN sales s ON p.product_id=s.product_id
LEFT JOIN customers c ON s.customer_id=c.customer_id;

--3. List all orders and their shipping status. Include orders that do not have any shipping records.
SELECT s.order_id, s.order_date, s.order_status, s.customer_id, s.product_id,
       sh.shipping_id, sh.order_id, sh.delivery_status
FROM sales s
LEFT JOIN shippings sh ON s.order_id=sh.order_id;

--4. Retrieve all products, including those with no orders, along with their price.
SELECT p.product_id, p.product_name, p.price
FROM products p
LEFT JOIN sales s ON p.product_id=s.product_id;

--5. Get a list of all customers who have placed orders, including those with no payment records.
SELECT c.customer_id, c.customer_name, c.state
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
FULL OUTER JOIN payments p ON s.order_id = p.order_id;

--6. Find the total number of completed orders made by customers from the state 'Delhi'
SELECT COUNT(s.order_id) as total_number
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.state = 'Delhi' 
      AND 
	  s.order_status = 'Completed';

--7. Retrieve a list of products ordered by customers from the state 'Karnataka' with price greater than 10,000.
 SELECT p.product_id, p.product_name, p.price
 FROM customers c
 INNER JOIN sales s ON c.customer_id = s.customer_id
 INNER JOIN products p ON s.product_id = p.product_id
 WHERE c.state = 'Karnataka' 
               AND 
	   p.price > 10000; 

--8. List all customers who have placed orders where the product category is 'Accessories' and the order status is 'Completed'.
SELECT c.customer_id, c.customer_name, p.category, s.order_status
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
INNER JOIN products p ON s.product_id = p.product_id
WHERE category = 'Accessories'
              AND 
	  order_status = 'Completed';
	  
--9. Show the order details of customers who have paid for their orders, excluding those who have cancelled their orders.
            SELECT c.customer_id, c.customer_name, py.payment_status, s.order_status
            FROM customers c
            INNER JOIN sales s ON c.customer_id = s.customer_id
            INNER JOIN payments py ON s.order_id = py.order_id
           WHERE s.order_status != 'Cancelled';

--10. Retrieve products ordered by customers who are in the 'Gujarat' state and whose total order price is greater than 15,000.
SELECT p.product_id, p.product_name, p.price, c.state 
FROM products p
INNER JOIN sales s ON p.product_id = s.product_id
INNER JOIN customers c ON s.customer_id = c.customer_id
WHERE c.state ='Gujarat'
      AND
	  p.price > 15000;

--11. Find the total quantity of each product ordered by customers from 'Delhi' and only include products with a quantity greater than 5.
SELECT p.product_id, p.product_name,
       SUM(s.quantity) AS total_quantity
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
INNER JOIN products p ON s.product_id = p.product_id
WHERE c.state = 'Delhi'
GROUP BY p.product_id, p.product_name
HAVING sum(s.quantity) > 5;

--12. Get the average payment amount per customer who has placed more than 3 orders.
SELECT c.customer_id, c.customer_name, COUNT(s.order_id) as total_order,
       AVG(s.quantity * s.price_per_unit) AS avg_payment
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
INNER JOIN payments py ON s.order_id = py.order_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(s.order_id) > 3;

--13. Retrieve the total sales for each product category and only include categories where the total sales exceed 100,000.
SELECT  p.category, SUM(s.quantity * s.price_per_unit) AS total_sales
FROM products p
INNER JOIN sales s ON s.product_id = p.product_id
GROUP BY p.category
HAVING SUM(s.quantity * s.price_per_unit) > 100000;

--14. Show the number of customers in each state who have made purchases with a total spend greater than 50,000.
SELECT  c.state, COUNT(DISTINCT c.customer_id) AS total_customers
FROM customers c
INNER JOIN sales s ON s.customer_id = c.customer_id
GROUP BY c.state
HAVING SUM(s.quantity * s.price_per_unit) > 50000;

--15. List the total sales by brand for products that have been ordered more than 10 times.
SELECT  p.brand, SUM(s.quantity * s.price_per_unit) AS total_sales
FROM products p
INNER JOIN sales s ON s.product_id = p.product_id
GROUP BY p.brand
HAVING SUM(s.quantity) > 10;

--16. Retrieve the total sales per customer in 'Delhi' where the order status is 'Completed', only include those with total sales greater than 50,000, and order the results by total sales.
SELECT  c.customer_id, c.customer_name, SUM(s.price_per_unit * s.quantity) as total_sales
FROM customers c
INNER JOIN sales s ON s.customer_id = c.customer_id
WHERE c.state = 'Delhi'
      AND
	  s.order_status = 'Completed'
GROUP BY c.customer_id, c.customer_name
HAVING SUM(s.price_per_unit * s.quantity) > 50000
ORDER BY total_sales;

--17. Show the total quantity sold per product in the 'Accessories' category where the total quantity sold is greater than 50 and order the results by product name.
SELECT  p.product_id, p.product_name, SUM(s.quantity) as total_sales
FROM products p
INNER JOIN sales s ON s.product_id = p.product_id
WHERE p.category = 'Accessories'
GROUP BY p.product_id, p.product_name
HAVING SUM(s.quantity) > 50
ORDER BY p.product_name;

--18. Find the total number of orders for customers from 'Maharashtra' who have spent more than 1,00,000, and order the results by the total amount spent.
SELECT  c.customer_id, c.customer_name, COUNT(s.order_id) as total_orders,
        SUM(s.quantity * s.price_per_unit) AS total_amt_spent
FROM customers c
INNER JOIN sales s ON s.customer_id = c.customer_id
WHERE c.state = 'Maharashtra'
GROUP BY c.customer_id, c.customer_name
HAVING  SUM(s.quantity * s.price_per_unit) > 100000
ORDER BY total_amt_spent;

--19. Get the number of orders per product and filter to include only products that have been ordered more than 10 times, then order the results by the highest number of orders.
SELECT p.product_name, COUNT(s.order_id) AS total_order
FROM sales s
INNER JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
HAVING COUNT(s.order_id)> 10
ORDER BY total_order desc;

--20. Retrieve the number of payments made per customer where the payment status is 'Payment Successed' and group by customer, ordering by payment count.
SELECT c.customer_name, COUNT(py.payment_id) as payment_count
FROM payments py
INNER JOIN sales s ON s.order_id = py.order_id
INNER JOIN customers c ON s.customer_id = c.customer_id
WHERE py.payment_status = 'Payment Successed'
GROUP BY c.customer_name
ORDER BY payment_count DESC;

--21. List all orders that were placed within the year 2023.
SELECT * 
FROM sales
WHERE EXTRACT (YEAR FROM order_date) = 2023;

--22. Retrieve customers who have made purchases in the month of January.
SELECT DISTINCT c.customer_name 
FROM customers c
INNER JOIN sales s ON s.customer_id = c.customer_id
WHERE EXTRACT (MONTH FROM s.order_date) = 1
      AND 
	  TO_CHAR(s.order_date, 'MM') = '01';

--23. Calculate the number of days between the payment_date and order_date for each order.
SELECT s.order_id,
       s.order_date,
       p.payment_date,
       EXTRACT(DAY FROM AGE(p.payment_date, s.order_date)) AS days_between
FROM sales s
JOIN payments p ON s.order_id = p.order_id;

--24. Find the total sales for each year.
SELECT EXTRACT (YEAR FROM s.order_date) AS years, 
       SUM(s.quantity * s.price_per_unit) AS total_sales
FROM sales s
GROUP BY EXTRACT (YEAR FROM s.order_date)
ORDER BY years;

--25. Show all orders where the shipping date is after the payment date.
SELECT s.order_id, s.order_date, py.payment_date, sh.shipping_date
FROM sales s
INNER JOIN payments py ON py.order_id = s.order_id
INNER JOIN shippings sh ON sh.order_id = s.order_id
WHERE sh.shipping_date > py.payment_date;

