-- ==========================================================
-- Project : Superstore Sales Analytics
-- File    : 04_Customer_Analysis.sql
-- Database: SQLite
-- ==========================================================

-- ==========================================================
-- 1. Total Customers
-- ==========================================================

SELECT COUNT(DISTINCT "Customer ID") AS Total_Customers
FROM superstore;

-- ==========================================================
-- 2. Customers by Segment
-- ==========================================================

SELECT
    Segment,
    COUNT(DISTINCT "Customer ID") AS Total_Customers
FROM superstore
GROUP BY Segment
ORDER BY Total_Customers DESC;

-- ==========================================================
-- 3. Top 10 Customers by Sales
-- ==========================================================

SELECT
    "Customer ID",
    "Customer Name",
    ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY "Customer ID", "Customer Name"
ORDER BY Total_Sales DESC
LIMIT 10;

-- ==========================================================
-- 4. Top 10 Customers by Profit
-- ==========================================================

SELECT
    "Customer ID",
    "Customer Name",
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY "Customer ID", "Customer Name"
ORDER BY Total_Profit DESC
LIMIT 10;

-- ==========================================================
-- 5. Customers with Highest Number of Orders
-- ==========================================================

SELECT
    "Customer ID",
    "Customer Name",
    COUNT(DISTINCT "Order ID") AS Total_Orders
FROM superstore
GROUP BY "Customer ID", "Customer Name"
ORDER BY Total_Orders DESC
LIMIT 10;

-- ==========================================================
-- 6. Average Sales per Customer
-- ==========================================================

SELECT
    "Customer ID",
    "Customer Name",
    ROUND(AVG(Sales),2) AS Avg_Sales
FROM superstore
GROUP BY "Customer ID", "Customer Name"
ORDER BY Avg_Sales DESC
LIMIT 10;

-- ==========================================================
-- 7. Average Profit per Customer
-- ==========================================================

SELECT
    "Customer ID",
    "Customer Name",
    ROUND(AVG(Profit),2) AS Avg_Profit
FROM superstore
GROUP BY "Customer ID", "Customer Name"
ORDER BY Avg_Profit DESC
LIMIT 10;

-- ==========================================================
-- 8. Customers Generating Loss
-- ==========================================================

SELECT
    "Customer ID",
    "Customer Name",
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY "Customer ID", "Customer Name"
HAVING SUM(Profit) < 0
ORDER BY Total_Profit;

-- ==========================================================
-- 9. Customer Sales by Region
-- ==========================================================

SELECT
    Region,
    COUNT(DISTINCT "Customer ID") AS Customers,
    ROUND(SUM(Sales),2) AS Sales
FROM superstore
GROUP BY Region
ORDER BY Sales DESC;

-- ==========================================================
-- 10. Customer Sales by State
-- ==========================================================

SELECT
    State,
    COUNT(DISTINCT "Customer ID") AS Customers,
    ROUND(SUM(Sales),2) AS Sales
FROM superstore
GROUP BY State
ORDER BY Sales DESC
LIMIT 15;

-- ==========================================================
-- 11. Customer Sales by Segment
-- ==========================================================

SELECT
    Segment,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY Segment
ORDER BY Sales DESC;

-- ==========================================================
-- 12. Repeat Customers
-- ==========================================================

SELECT
    "Customer ID",
    "Customer Name",
    COUNT(DISTINCT "Order ID") AS Orders
FROM superstore
GROUP BY "Customer ID", "Customer Name"
HAVING COUNT(DISTINCT "Order ID") > 1
ORDER BY Orders DESC;

-- ==========================================================
-- 13. Customer Purchase Quantity
-- ==========================================================

SELECT
    "Customer Name",
    SUM(Quantity) AS Total_Quantity
FROM superstore
GROUP BY "Customer Name"
ORDER BY Total_Quantity DESC
LIMIT 10;

-- ==========================================================
-- 14. Customer Discount Analysis
-- ==========================================================

SELECT
    "Customer Name",
    ROUND(AVG(Discount),2) AS Avg_Discount
FROM superstore
GROUP BY "Customer Name"
ORDER BY Avg_Discount DESC
LIMIT 10;

-- ==========================================================
-- 15. Customer Lifetime Sales
-- ==========================================================

SELECT
    "Customer ID",
    "Customer Name",
    ROUND(SUM(Sales),2) AS Lifetime_Sales,
    ROUND(SUM(Profit),2) AS Lifetime_Profit
FROM superstore
GROUP BY "Customer ID", "Customer Name"
ORDER BY Lifetime_Sales DESC;

-- ==========================================================
-- 16. Top Customer in Each Segment
-- ==========================================================

SELECT
    Segment,
    "Customer Name",
    ROUND(SUM(Sales),2) AS Sales
FROM superstore
GROUP BY Segment, "Customer Name"
ORDER BY Segment, Sales DESC;

-- ==========================================================
-- 17. Customer Distribution by Region
-- ==========================================================

SELECT
    Region,
    COUNT(DISTINCT "Customer ID") AS Customer_Count
FROM superstore
GROUP BY Region
ORDER BY Customer_Count DESC;

-- ==========================================================
-- 18. Most Profitable Customer by Region
-- ==========================================================

SELECT
    Region,
    "Customer Name",
    ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY Region, "Customer Name"
ORDER BY Region, Profit DESC;

-- ==========================================================
-- 19. Customer Summary KPI
-- ==========================================================

SELECT
    COUNT(DISTINCT "Customer ID") AS Total_Customers,
    COUNT(DISTINCT "Order ID") AS Total_Orders,
    ROUND(AVG(Sales),2) AS Avg_Order_Value,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore;

-- ==========================================================
-- END OF FILE
-- ==========================================================