-- ==========================================================
-- Project : Superstore Sales Analytics
-- File    : 06_Regional_Analysis.sql
-- Database: SQLite
-- ==========================================================

-- ==========================================================
-- 1. Sales & Profit by Region
-- ==========================================================

SELECT
    Region,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- ==========================================================
-- 2. Sales by State
-- ==========================================================

SELECT
    State,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY State
ORDER BY Total_Sales DESC;

-- ==========================================================
-- 3. Top 10 States by Sales
-- ==========================================================

SELECT
    State,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;

-- ==========================================================
-- 4. Bottom 10 States by Sales
-- ==========================================================

SELECT
    State,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY State
ORDER BY Total_Sales ASC
LIMIT 10;

-- ==========================================================
-- 5. Top 10 States by Profit
-- ==========================================================

SELECT
    State,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY State
ORDER BY Total_Profit DESC
LIMIT 10;

-- ==========================================================
-- 6. Bottom 10 States by Profit
-- ==========================================================

SELECT
    State,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY State
ORDER BY Total_Profit ASC
LIMIT 10;

-- ==========================================================
-- 7. Sales by City
-- ==========================================================

SELECT
    City,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 20;

-- ==========================================================
-- 8. Orders by Region
-- ==========================================================

SELECT
    Region,
    COUNT(DISTINCT "Order ID") AS Total_Orders
FROM superstore
GROUP BY Region
ORDER BY Total_Orders DESC;

-- ==========================================================
-- 9. Customers by Region
-- ==========================================================

SELECT
    Region,
    COUNT(DISTINCT "Customer ID") AS Total_Customers
FROM superstore
GROUP BY Region
ORDER BY Total_Customers DESC;

-- ==========================================================
-- 10. Average Sales by Region
-- ==========================================================

SELECT
    Region,
    ROUND(AVG(Sales),2) AS Avg_Sales
FROM superstore
GROUP BY Region
ORDER BY Avg_Sales DESC;

-- ==========================================================
-- 11. Average Profit by Region
-- ==========================================================

SELECT
    Region,
    ROUND(AVG(Profit),2) AS Avg_Profit
FROM superstore
GROUP BY Region
ORDER BY Avg_Profit DESC;

-- ==========================================================
-- 12. Sales Contribution by Region
-- ==========================================================

SELECT
    Region,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(
        SUM(Sales) * 100.0 /
        (SELECT SUM(Sales) FROM superstore),
        2
    ) AS Sales_Percentage
FROM superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- ==========================================================
-- 13. Profit Margin by Region
-- ==========================================================

SELECT
    Region,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit,
    ROUND(
        SUM(Profit) * 100.0 / SUM(Sales),
        2
    ) AS Profit_Margin
FROM superstore
GROUP BY Region
ORDER BY Profit_Margin DESC;

-- ==========================================================
-- 14. Sales by Ship Mode
-- ==========================================================

SELECT
    "Ship Mode",
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY "Ship Mode"
ORDER BY Sales DESC;

-- ==========================================================
-- 15. Region and Category Performance
-- ==========================================================

SELECT
    Region,
    Category,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY Region, Category
ORDER BY Region, Sales DESC;

-- ==========================================================
-- 16. Region and Segment Performance
-- ==========================================================

SELECT
    Region,
    Segment,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY Region, Segment
ORDER BY Region, Sales DESC;

-- ==========================================================
-- 17. Top Cities by Profit
-- ==========================================================

SELECT
    City,
    State,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY City, State
ORDER BY Total_Profit DESC
LIMIT 20;

-- ==========================================================
-- 18. Loss-Making States
-- ==========================================================

SELECT
    State,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY State
HAVING SUM(Profit) < 0
ORDER BY Total_Profit;

-- ==========================================================
-- 19. Regional KPI Summary
-- ==========================================================

SELECT
    COUNT(DISTINCT Region) AS Total_Regions,
    COUNT(DISTINCT State) AS Total_States,
    COUNT(DISTINCT City) AS Total_Cities,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore;

-- ==========================================================
-- 20. Regional Ranking
-- ==========================================================

SELECT
    Region,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    COUNT(DISTINCT "Order ID") AS Orders,
    COUNT(DISTINCT "Customer ID") AS Customers
FROM superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- ==========================================================
-- END OF FILE
-- ==========================================================