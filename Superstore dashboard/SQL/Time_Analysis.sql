-- ==========================================================
-- Project : Superstore Sales Analytics
-- File    : 07_Time_Analysis.sql
-- Database: SQLite
-- ==========================================================

-- ==========================================================
-- 1. Sales by Year
-- ==========================================================

SELECT
    strftime('%Y',"Order Date") AS Year,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY Year
ORDER BY Year;

-- ==========================================================
-- 2. Orders by Year
-- ==========================================================

SELECT
    strftime('%Y',"Order Date") AS Year,
    COUNT(DISTINCT "Order ID") AS Total_Orders
FROM superstore
GROUP BY Year
ORDER BY Year;

-- ==========================================================
-- 3. Monthly Sales Trend
-- ==========================================================

SELECT
    strftime('%Y-%m',"Order Date") AS Month,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY Month
ORDER BY Month;

-- ==========================================================
-- 4. Monthly Orders
-- ==========================================================

SELECT
    strftime('%Y-%m',"Order Date") AS Month,
    COUNT(DISTINCT "Order ID") AS Total_Orders
FROM superstore
GROUP BY Month
ORDER BY Month;

-- ==========================================================
-- 5. Monthly Quantity Sold
-- ==========================================================

SELECT
    strftime('%Y-%m',"Order Date") AS Month,
    SUM(Quantity) AS Quantity_Sold
FROM superstore
GROUP BY Month
ORDER BY Month;

-- ==========================================================
-- 6. Quarterly Sales
-- ==========================================================

SELECT
    strftime('%Y',"Order Date") AS Year,
    CASE
        WHEN CAST(strftime('%m',"Order Date") AS INTEGER) BETWEEN 1 AND 3 THEN 'Q1'
        WHEN CAST(strftime('%m',"Order Date") AS INTEGER) BETWEEN 4 AND 6 THEN 'Q2'
        WHEN CAST(strftime('%m',"Order Date") AS INTEGER) BETWEEN 7 AND 9 THEN 'Q3'
        ELSE 'Q4'
    END AS Quarter,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY Year, Quarter
ORDER BY Year, Quarter;

-- ==========================================================
-- 7. Quarterly Profit
-- ==========================================================

SELECT
    strftime('%Y',"Order Date") AS Year,
    CASE
        WHEN CAST(strftime('%m',"Order Date") AS INTEGER) BETWEEN 1 AND 3 THEN 'Q1'
        WHEN CAST(strftime('%m',"Order Date") AS INTEGER) BETWEEN 4 AND 6 THEN 'Q2'
        WHEN CAST(strftime('%m',"Order Date") AS INTEGER) BETWEEN 7 AND 9 THEN 'Q3'
        ELSE 'Q4'
    END AS Quarter,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY Year, Quarter
ORDER BY Year, Quarter;

-- ==========================================================
-- 8. Sales by Month Name
-- ==========================================================

SELECT
    strftime('%m',"Order Date") AS Month_Number,
    CASE strftime('%m',"Order Date")
        WHEN '01' THEN 'January'
        WHEN '02' THEN 'February'
        WHEN '03' THEN 'March'
        WHEN '04' THEN 'April'
        WHEN '05' THEN 'May'
        WHEN '06' THEN 'June'
        WHEN '07' THEN 'July'
        WHEN '08' THEN 'August'
        WHEN '09' THEN 'September'
        WHEN '10' THEN 'October'
        WHEN '11' THEN 'November'
        WHEN '12' THEN 'December'
    END AS Month_Name,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY Month_Number, Month_Name
ORDER BY Month_Number;

-- ==========================================================
-- 9. Profit by Month Name
-- ==========================================================

SELECT
    strftime('%m',"Order Date") AS Month_Number,
    CASE strftime('%m',"Order Date")
        WHEN '01' THEN 'January'
        WHEN '02' THEN 'February'
        WHEN '03' THEN 'March'
        WHEN '04' THEN 'April'
        WHEN '05' THEN 'May'
        WHEN '06' THEN 'June'
        WHEN '07' THEN 'July'
        WHEN '08' THEN 'August'
        WHEN '09' THEN 'September'
        WHEN '10' THEN 'October'
        WHEN '11' THEN 'November'
        WHEN '12' THEN 'December'
    END AS Month_Name,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY Month_Number, Month_Name
ORDER BY Month_Number;

-- ==========================================================
-- 10. Yearly Customer Growth
-- ==========================================================

SELECT
    strftime('%Y',"Order Date") AS Year,
    COUNT(DISTINCT "Customer ID") AS Customers
FROM superstore
GROUP BY Year
ORDER BY Year;

-- ==========================================================
-- 11. Yearly Product Sales
-- ==========================================================

SELECT
    strftime('%Y',"Order Date") AS Year,
    COUNT(DISTINCT "Product ID") AS Products_Sold
FROM superstore
GROUP BY Year
ORDER BY Year;

-- ==========================================================
-- 12. Average Monthly Sales
-- ==========================================================

SELECT
    ROUND(AVG(monthly_sales),2) AS Average_Monthly_Sales
FROM (
    SELECT
        strftime('%Y-%m',"Order Date") AS Month,
        SUM(Sales) AS monthly_sales
    FROM superstore
    GROUP BY Month
);

-- ==========================================================
-- 13. Best Sales Month
-- ==========================================================

SELECT
    strftime('%Y-%m',"Order Date") AS Month,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY Month
ORDER BY Total_Sales DESC
LIMIT 1;

-- ==========================================================
-- 14. Worst Sales Month
-- ==========================================================

SELECT
    strftime('%Y-%m',"Order Date") AS Month,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY Month
ORDER BY Total_Sales ASC
LIMIT 1;

-- ==========================================================
-- 15. Best Profit Month
-- ==========================================================

SELECT
    strftime('%Y-%m',"Order Date") AS Month,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY Month
ORDER BY Total_Profit DESC
LIMIT 1;

-- ==========================================================
-- 16. Worst Profit Month
-- ==========================================================

SELECT
    strftime('%Y-%m',"Order Date") AS Month,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY Month
ORDER BY Total_Profit ASC
LIMIT 1;

-- ==========================================================
-- 17. Monthly Profit Margin
-- ==========================================================

SELECT
    strftime('%Y-%m',"Order Date") AS Month,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit,
    ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin
FROM superstore
GROUP BY Month
ORDER BY Month;

-- ==========================================================
-- 18. Time Analysis Summary
-- ==========================================================

SELECT
    MIN("Order Date") AS First_Order_Date,
    MAX("Order Date") AS Last_Order_Date,
    COUNT(DISTINCT strftime('%Y',"Order Date")) AS Total_Years,
    COUNT(DISTINCT strftime('%Y-%m',"Order Date")) AS Total_Months,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore;

-- ==========================================================
-- END OF FILE
-- ==========================================================