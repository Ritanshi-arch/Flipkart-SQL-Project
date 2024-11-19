# Flipkart E-commerce SQL Project

![flipkart](https://github.com/user-attachments/assets/b25b3047-edef-4786-9c3e-2c1748eb3428)


Welcome to my SQL project, where I analyze real-time data from **Flipkart**! This project uses a dataset of **20,000+ sales records** and additional tables for payments, products, and shipping data to explore and analyze e-commerce transactions, product sales, and customer interactions. The project aims to solve business problems through SQL queries, helping Flipkart make informed decisions.

## Table of Contents
- [Introduction](#introduction)
- [Project Structure](#project-structure)
- [Database Schema](#database-schema)
- [Business Problems](#business-problems)
- [SQL Queries & Analysis](#sql-queries--analysis)
- [Getting Started](#getting-started)
- [Questions & Feedback](#questions--feedback)
- [Contact Me](#contact-me)

---

## Introduction

This project demonstrates essential SQL skills by analyzing e-commerce data from **Flipkart**, focusing on sales, payments, products, and customer data. Through SQL, we answer critical business questions, uncover trends, and derive actionable insights that help improve business strategies and customer experiences. The project covers different SQL techniques including **Joins**, **Group By**, **Aggregations**, and **Date Functions**.

## Project Structure

1. **SQL Scripts**: Contains code to create the database schema and write queries for analysis.
2. **Dataset**: Real-time data representing e-commerce transactions, product details, customer information, and shipping status.
3. **Analysis**: SQL queries crafted to solve business problems, each focusing on understanding e-commerce sales and performance.

---

## Database Schema

Here’s an overview of the database structure:

### 1. **Customers Table**
- **customer_id**: Unique identifier for each customer
- **customer_name**: Name of the customer
- **state**: Location (state) of the customer

### 2. **Products Table**
- **product_id**: Unique identifier for each product
- **product_name**: Name of the product
- **price**: Price of the product
- **cogs**: Cost of goods sold
- **category**: Category of the product
- **brand**: Brand name of the product

### 3. **Sales Table**
- **order_id**: Unique order identifier
- **order_date**: Date the order was placed
- **customer_id**: Linked to the `customers` table
- **order_status**: Status of the order (e.g., Completed, Cancelled)
- **product_id**: Linked to the `products` table
- **quantity**: Quantity of products sold
- **price_per_unit**: Price per unit of the product

### 4. **Payments Table**
- **payment_id**: Unique payment identifier
- **order_id**: Linked to the `sales` table
- **payment_date**: Date the payment was made
- **payment_status**: Status of the payment (e.g., Payment Successed, Payment Failed)

### 5. **Shippings Table**
- **shipping_id**: Unique shipping identifier
- **order_id**: Linked to the `sales` table
- **shipping_date**: Date the order was shipped
- **return_date**: Date the order was returned (if applicable)
- **shipping_providers**: Shipping provider (e.g., Ekart, Bluedart)
- **delivery_status**: Status of delivery (e.g., Delivered, Returned)

## Business Problems

The following queries were created to solve specific business questions. Each query is designed to provide insights based on sales, payments, products, and customer data.

### Easy 
1. `Retrieve a list of all customers with their corresponding product names they ordered. `
2. `List all products and show the details of customers who have placed orders for them. Include products that have no orders. `
3. `List all orders and their shipping status. Include orders that do not have any shipping records. `
4. `Retrieve all products, including those with no orders, along with their price. `
5. `Get a list of all customers who have placed orders, including those with no payment records.`
   
### Medium to Hard
1. `Find the total number of completed orders made by customers from the state 'Delhi'.`
2. `Retrieve a list of products ordered by customers from the state 'Karnataka' with price greater than 10,000.`
3. `List all customers who have placed orders where the product category is 'Accessories' and the order status is 'Completed'.`
4. `Show the order details of customers who have paid for their orders, excluding those who have cancelled their orders.`
5. `Retrieve products ordered by customers who are in the 'Gujarat' state and whose total order price is greater than 15,000.`
6. `Find the total quantity of each product ordered by customers from 'Delhi' and only include products with a quantity greater than 5 .`
7. `Get the average payment amount per customer who has placed more than 3 orders.`
8. `Retrieve the total sales for each product category and only include categories where the total sales exceed 100,000.`
9. `Show the number of customers in each state who have made purchases with a total spend greater than 50,000.`
10. `List the total sales by brand for products that have been ordered more than 10 times.`
11. `Retrieve the total sales per customer in 'Delhi' where the order status is 'Completed', only include those with total sales greater than 50,000, and order the results by total sales.`
12. `Show the total quantity sold per product in the 'Accessories' category where the total quantity sold is greater than 50 and order the results by product name.`
13. `Find the total number of orders for customers from 'Maharashtra' who have spent more than 1,00,000, and order the results by the total amount spent.`
14. `Get the number of orders per product and filter to include only products that have been ordered more than 10 times, then order the results by the highest number of orders.`
15. `Retrieve the number of payments made per customer where the payment status is 'Payment Successed' and group by customer, ordering by payment count.`

### Date Function
1. `List all orders that were placed within the year 2023. `
2. `Retrieve customers who have made purchases in the month of January. `
3. `Calculate the number of days between the payment_date and order_date for each order. `
4. `Find the total sales for each year. `
5. `Show all orders where the shipping date is after the payment date.`

---

## SQL Queries & Analysis

The `queries.sql` file contains all SQL queries developed for this project. Each query corresponds to a business problem and demonstrates skills in SQL syntax, data filtering, aggregation, grouping, and ordering.

---

## Getting Started

### Prerequisites
- PostgreSQL (or any SQL-compatible database)
- Basic understanding of SQL

### Steps
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/flipkart-sql-project.git
   ```
2. **Set Up the Database**:
   - Run the `schema.sql` script to set up tables and insert sample data.

3. **Run Queries**:
   - Execute each query in `queries.sql` to explore and analyze the data.

---

## Questions & Feedback

Feel free to add your questions and code snippets below and submit them as issues for further feedback!

**Example Questions**:
1. **Question**: How can I filter orders placed in the last 6 months?
   **Code Snippet**:
   ```sql
   SELECT * FROM sales
   WHERE order_date >= CURRENT_DATE - INTERVAL '6 months';
   ```

---

## Contact Me

📄 **[Resume][CV_Ritanshi_2024.pdf](https://github.com/user-attachments/files/17817467/CV_Ritanshi_2024.pdf)
**  
📧 **[Email](mailto:ritanshi.arya@gmail.com)**  
📞 **Phone**: +123-456-7890  

---

## ERD (Entity-Relationship Diagram)

## Notice:
All customer names and data used in this project are computer-generated using AI and random
functions. They do not represent real data associated with Amazon or any other entity. This
project is solely for learning and educational purposes, and any resemblance to actual persons,
businesses, or events is purely coincidental.

![Flipkart Project Schemas](https://github.com/user-attachments/assets/98341261-49c0-4630-9d02-4c6697d86b8c)
