creATE DATABASE retail_sales;
use retail_sales;
ALTER USER 'root'@'localhost'
IDENTIFIED BY 'newpassword123';
SELECT SUM(total_amount)
FROM retail_sales_large.csv;

SHOW DATABASES;

USE retail_project;

-- 1. Find Total Revenue

SELECT SUM(price * quantity) AS total_revenue
FROM retail_sales;


-- 2. Find Average Customer Age

SELECT AVG(age) AS average_age
FROM retail_sales;


-- 3. Find Top Product Categories

SELECT product_category,
       COUNT(*) AS total_sales
FROM retail_sales
GROUP BY product_category
ORDER BY total_sales DESC;

-- 4.  Top 5 Customers by Spending

SELECT customer_name,
       SUM(price * quantity) AS total_spent
FROM retail_sales
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;

-- 5. Duplicate customers
SELECT customer_name,
       COUNT(*) AS frequency
FROM retail_sales
GROUP BY customer_name
HAVING frequency > 1;

-- 6. Revenue after discount
SELECT customer_name,
       price,
       discount_percent,
       (price - (price * discount_percent / 100)) AS final_price
FROM retail_sales;
-- 7. Young customers
SELECT customer_name,
       age
FROM retail_sales
WHERE age < 30;
-- 8. Expensive products
SELECT product_name,
       price
FROM retail_sales
ORDER BY price DESC
LIMIT 10;

-- =========================================
-- RETAIL SALES DATA ANALYSIS PROJECT
-- =========================================

USE retail_project;

-- =========================================
-- BASIC ANALYSIS
-- =========================================

-- 1. Find Total Revenue
-- Analysis:
-- Calculates overall business revenue generated from all orders.

SELECT SUM(price * quantity) AS total_revenue
FROM retail_sales;


-- 2. Find Average Customer Age
-- Analysis:
-- Helps understand the average customer demographic.

SELECT AVG(age) AS average_age
FROM retail_sales;


-- 3. Find Total Orders
-- Analysis:
-- Shows total number of transactions placed.

SELECT COUNT(*) AS total_orders
FROM retail_sales;


-- =========================================
-- PRODUCT ANALYSIS
-- =========================================

-- 4. Find Top Product Categories
-- Analysis:
-- Identifies the most frequently purchased product categories.

SELECT product_category,
       COUNT(*) AS total_sales
FROM retail_sales
GROUP BY product_category
ORDER BY total_sales DESC;


-- 5. Find Most Expensive Products
-- Analysis:
-- Displays products with the highest prices.

SELECT product_name,
       price
FROM retail_sales
ORDER BY price DESC
LIMIT 10;


-- 6. Find Total Quantity Sold Per Product
-- Analysis:
-- Helps identify best-selling products by quantity.

SELECT product_name,
       SUM(quantity) AS total_quantity
FROM retail_sales
GROUP BY product_name
ORDER BY total_quantity DESC;


-- =========================================
-- CUSTOMER ANALYSIS
-- =========================================

-- 7. Top 5 Customers by Spending
-- Analysis:
-- Identifies high-value customers based on spending.

SELECT customer_name,
       SUM(price * quantity) AS total_spent
FROM retail_sales
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;


-- 8. Find Duplicate Customers
-- Analysis:
-- Detects customers appearing multiple times in transactions.

SELECT customer_name,
       COUNT(*) AS frequency
FROM retail_sales
GROUP BY customer_name
HAVING frequency > 1;


-- 9. Find Young Customers
-- Analysis:
-- Retrieves customers younger than 30 for age-based analysis.

SELECT customer_name,
       age
FROM retail_sales
WHERE age < 30;


-- 10. Revenue by Gender
-- Analysis:
-- Compares spending patterns between genders.

SELECT gender,
       SUM(price * quantity) AS revenue
FROM retail_sales
GROUP BY gender
ORDER BY revenue DESC;


-- =========================================
-- DISCOUNT ANALYSIS
-- =========================================

-- 11. Revenue After Discount
-- Analysis:
-- Calculates final product price after applying discount.

SELECT customer_name,
       price,
       discount_percent,
       (price - (price * discount_percent / 100)) AS final_price
FROM retail_sales;


-- 12. Average Discount Percentage
-- Analysis:
-- Measures average discount offered across all orders.

SELECT AVG(discount_percent) AS avg_discount
FROM retail_sales;


-- =========================================
-- LOCATION ANALYSIS
-- =========================================

-- 13. State-wise Revenue
-- Analysis:
-- Shows which states generate the highest revenue.

SELECT state,
       SUM(price * quantity) AS revenue
FROM retail_sales
GROUP BY state
ORDER BY revenue DESC;


-- 14. City-wise Revenue
-- Analysis:
-- Helps identify top-performing cities.

SELECT city,
       SUM(price * quantity) AS revenue
FROM retail_sales
GROUP BY city
ORDER BY revenue DESC
LIMIT 10;


-- 15. Region-wise Orders
-- Analysis:
-- Displays order distribution by region.

SELECT region,
       COUNT(*) AS total_orders
FROM retail_sales
GROUP BY region;


-- =========================================
-- PAYMENT ANALYSIS
-- =========================================

-- 16. Most Used Payment Methods
-- Analysis:
-- Identifies preferred customer payment methods.

SELECT payment_method,
       COUNT(*) AS usage_count
FROM retail_sales
GROUP BY payment_method
ORDER BY usage_count DESC;


-- =========================================
-- TIME-BASED ANALYSIS
-- =========================================

-- 17. Monthly Revenue Trend
-- Analysis:
-- Tracks revenue performance month by month.

SELECT MONTH(order_date) AS month,
       SUM(price * quantity) AS monthly_revenue
FROM retail_sales
GROUP BY month
ORDER BY month;


-- =========================================
-- BUSINESS KPI ANALYSIS
-- =========================================

-- 18. Business KPI Summary
-- Analysis:
-- Provides overall business performance metrics.

SELECT 
    COUNT(*) AS total_orders,
    COUNT(DISTINCT customer_name) AS total_customers,
    SUM(price * quantity) AS total_revenue,
    AVG(price * quantity) AS avg_order_value
FROM retail_sales;