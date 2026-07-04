-- ==========================================================
-- Project : Superstore Sales Analytics
-- File    : 03_Sales_Analysis.sql
-- Database: SQLite
-- ==========================================================

-- ==========================================================
-- 1. Total Sales
-- ==========================================================

SELECT
    ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore;

-- ==========================================================
-- 2. Total Profit
-- ==========================================================

SELECT
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore;

-- ==========================================================
-- 3. Profit Margin (%)
-- ==========================================================

SELECT
    ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin_Percentage
FROM superstore;

-- ==========================================================
-- 4. Total Orders
-- ==========================================================

SELECT
    COUNT(DISTINCT "Order ID") AS Total_Orders
FROM superstore;

-- ==========================================================
-- 5. Average Order Value
-- ==========================================================

SELECT
    ROUND(SUM(Sales)/COUNT(DISTINCT "Order ID"),2) AS Average_Order_Value
FROM superstore;

-- ==========================================================
-- 6. Sales by Category
-- ==========================================================

SELECT
    Category,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY Category
ORDER BY Sales DESC;

-- ==========================================================
-- 7. Sales by Sub-Category
-- ==========================================================

SELECT
    "Sub-Category",
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY "Sub-Category"
ORDER BY Sales DESC;

-- ==========================================================
-- 8. Sales by Region
-- ==========================================================

SELECT
    Region,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY Region
ORDER BY Sales DESC;

-- ==========================================================
-- 9. Sales by State
-- ==========================================================

SELECT
    State,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY State
ORDER BY Sales DESC
LIMIT 10;

-- ==========================================================
-- 10. Sales by Segment
-- ==========================================================

SELECT
    Segment,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY Segment
ORDER BY Sales DESC;

-- ==========================================================
-- 11. Sales by Ship Mode
-- ==========================================================

SELECT
    "Ship Mode",
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY "Ship Mode"
ORDER BY Sales DESC;

-- ==========================================================
-- 12. Top 10 Products by Sales
-- ==========================================================

SELECT
    "Product Name",
    ROUND(SUM(Sales),2) AS Sales
FROM superstore
GROUP BY "Product Name"
ORDER BY Sales DESC
LIMIT 10;

-- ==========================================================
-- 13. Top 10 Products by Profit
-- ==========================================================

SELECT
    "Product Name",
    ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY "Product Name"
ORDER BY Profit DESC
LIMIT 10;

-- ==========================================================
-- 14. Bottom 10 Products by Profit
-- ==========================================================

SELECT
    "Product Name",
    ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY "Product Name"
ORDER BY Profit ASC
LIMIT 10;

-- ==========================================================
-- 15. Top 10 Customers by Sales
-- ==========================================================

SELECT
    "Customer Name",
    ROUND(SUM(Sales),2) AS Sales
FROM superstore
GROUP BY "Customer Name"
ORDER BY Sales DESC
LIMIT 10;

-- ==========================================================
-- 16. Top 10 Customers by Profit
-- ==========================================================

SELECT
    "Customer Name",
    ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY "Customer Name"
ORDER BY Profit DESC
LIMIT 10;

-- ==========================================================
-- 17. Discount Impact on Profit
-- ==========================================================

SELECT
    Discount,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY Discount
ORDER BY Discount;

-- ==========================================================
-- 18. Most Sold Products
-- ==========================================================

SELECT
    "Product Name",
    SUM(Quantity) AS Quantity_Sold
FROM superstore
GROUP BY "Product Name"
ORDER BY Quantity_Sold DESC
LIMIT 10;

-- ==========================================================
-- 19. Sales by Year
-- ==========================================================

SELECT
    strftime('%Y',"Order Date") AS Year,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY Year
ORDER BY Year;

-- ==========================================================
-- 20. Monthly Sales Trend
-- ==========================================================

SELECT
    strftime('%Y-%m',"Order Date") AS Month,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY Month
ORDER BY Month;

-- ==========================================================
-- 21. Monthly Order Count
-- ==========================================================

SELECT
    strftime('%Y-%m',"Order Date") AS Month,
    COUNT(DISTINCT "Order ID") AS Orders
FROM superstore
GROUP BY Month
ORDER BY Month;

-- ==========================================================
-- 22. Category Contribution (%)
-- ==========================================================

SELECT
    Category,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND((SUM(Sales)/(SELECT SUM(Sales) FROM superstore))*100,2) AS Sales_Percentage
FROM superstore
GROUP BY Category
ORDER BY Sales DESC;

-- ==========================================================
-- 23. Region Contribution (%)
-- ==========================================================

SELECT
    Region,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND((SUM(Sales)/(SELECT SUM(Sales) FROM superstore))*100,2) AS Sales_Percentage
FROM superstore
GROUP BY Region
ORDER BY Sales DESC;

-- ==========================================================
-- 24. Top Loss-Making Orders
-- ==========================================================

SELECT
    "Order ID",
    "Customer Name",
    State,
    ROUND(Sales,2) AS Sales,
    ROUND(Profit,2) AS Profit
FROM superstore
ORDER BY Profit ASC
LIMIT 20;

-- ==========================================================
-- 25. Executive KPIs
-- ==========================================================

SELECT
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity,
    COUNT(DISTINCT "Order ID") AS Total_Orders,
    COUNT(DISTINCT "Customer ID") AS Total_Customers,
    ROUND(AVG(Sales),2) AS Average_Sale,
    ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin
FROM superstore;

-- ==========================================================
-- END OF FILE
-- ==========================================================