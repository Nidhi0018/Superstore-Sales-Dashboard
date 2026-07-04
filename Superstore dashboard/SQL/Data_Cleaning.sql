-- ==========================================================
-- Project : Superstore Sales Analytics
-- Database: SQLite
-- File    : 02_Data_Cleaning.sql
-- Description : Data Quality & Cleaning Checks
-- ==========================================================

-- ==========================================================
-- 1. Total Records
-- ==========================================================

SELECT COUNT(*) AS total_records
FROM superstore;

-- ==========================================================
-- 2. Check Duplicate Rows
-- ==========================================================

SELECT
    "Order ID",
    "Product ID",
    COUNT(*) AS duplicate_count
FROM superstore
GROUP BY
    "Order ID",
    "Product ID"
HAVING COUNT(*) > 1;

-- ==========================================================
-- 3. Check NULL Values
-- ==========================================================

SELECT
    SUM(CASE WHEN "Order ID" IS NULL THEN 1 ELSE 0 END) AS order_id_null,
    SUM(CASE WHEN "Customer ID" IS NULL THEN 1 ELSE 0 END) AS customer_id_null,
    SUM(CASE WHEN "Customer Name" IS NULL THEN 1 ELSE 0 END) AS customer_name_null,
    SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS category_null,
    SUM(CASE WHEN "Sub-Category" IS NULL THEN 1 ELSE 0 END) AS sub_category_null,
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS sales_null,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS profit_null
FROM superstore;

-- ==========================================================
-- 4. Check Blank Customer Names
-- ==========================================================

SELECT *
FROM superstore
WHERE TRIM("Customer Name") = '';

-- ==========================================================
-- 5. Check Blank Product Names
-- ==========================================================

SELECT *
FROM superstore
WHERE TRIM("Product Name") = '';

-- ==========================================================
-- 6. Check Negative Sales
-- ==========================================================

SELECT *
FROM superstore
WHERE Sales < 0;

-- ==========================================================
-- 7. Check Negative Quantity
-- ==========================================================

SELECT *
FROM superstore
WHERE Quantity < 0;

-- ==========================================================
-- 8. Check Negative Profit
-- ==========================================================

SELECT *
FROM superstore
WHERE Profit < 0;

-- ==========================================================
-- 9. Check Discount Range
-- ==========================================================

SELECT *
FROM superstore
WHERE Discount < 0
   OR Discount > 1;

-- ==========================================================
-- 10. Check Unique Categories
-- ==========================================================

SELECT DISTINCT Category
FROM superstore
ORDER BY Category;

-- ==========================================================
-- 11. Check Unique Sub-Categories
-- ==========================================================

SELECT DISTINCT "Sub-Category"
FROM superstore
ORDER BY "Sub-Category";

-- ==========================================================
-- 12. Check Unique Regions
-- ==========================================================

SELECT DISTINCT Region
FROM superstore
ORDER BY Region;

-- ==========================================================
-- 13. Check Unique Ship Modes
-- ==========================================================

SELECT DISTINCT "Ship Mode"
FROM superstore
ORDER BY "Ship Mode";

-- ==========================================================
-- 14. Check Sales Outliers
-- ==========================================================

SELECT *
FROM superstore
ORDER BY Sales DESC
LIMIT 20;

-- ==========================================================
-- 15. Check Profit Outliers
-- ==========================================================

SELECT *
FROM superstore
ORDER BY Profit DESC
LIMIT 20;

-- ==========================================================
-- 16. Check Loss Making Orders
-- ==========================================================

SELECT *
FROM superstore
WHERE Profit < 0
ORDER BY Profit;

-- ==========================================================
-- 17. Verify Date Range
-- ==========================================================

SELECT
    MIN("Order Date") AS first_order_date,
    MAX("Order Date") AS last_order_date,
    MIN("Ship Date") AS first_ship_date,
    MAX("Ship Date") AS last_ship_date
FROM superstore;

-- ==========================================================
-- 18. Check Shipping Delay
-- ==========================================================

SELECT
    "Order ID",
    "Order Date",
    "Ship Date",
    ROUND(julianday("Ship Date") - julianday("Order Date"),2) AS shipping_days
FROM superstore
ORDER BY shipping_days DESC
LIMIT 20;

-- ==========================================================
-- 19. Record Count by Category
-- ==========================================================

SELECT
    Category,
    COUNT(*) AS total_records
FROM superstore
GROUP BY Category
ORDER BY total_records DESC;

-- ==========================================================
-- 20. Data Quality Summary
-- ==========================================================

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT "Order ID") AS total_orders,
    COUNT(DISTINCT "Customer ID") AS total_customers,
    COUNT(DISTINCT "Product ID") AS total_products,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit
FROM superstore;

-- ==========================================================
-- END OF FILE
-- ==========================================================