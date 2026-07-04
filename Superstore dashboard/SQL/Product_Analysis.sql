-- ==========================================================
-- Project : Superstore Sales Analytics
-- File    : 05_Product_Analysis.sql
-- Database: SQLite
-- ==========================================================

-- ==========================================================
-- 1. Total Products
-- ==========================================================

SELECT
    COUNT(DISTINCT "Product ID") AS Total_Products
FROM superstore;

-- ==========================================================
-- 2. Products by Category
-- ==========================================================

SELECT
    Category,
    COUNT(DISTINCT "Product ID") AS Products
FROM superstore
GROUP BY Category
ORDER BY Products DESC;

-- ==========================================================
-- 3. Products by Sub-Category
-- ==========================================================

SELECT
    "Sub-Category",
    COUNT(DISTINCT "Product ID") AS Products
FROM superstore
GROUP BY "Sub-Category"
ORDER BY Products DESC;

-- ==========================================================
-- 4. Top 10 Products by Sales
-- ==========================================================

SELECT
    "Product Name",
    ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY "Product Name"
ORDER BY Total_Sales DESC
LIMIT 10;

-- ==========================================================
-- 5. Top 10 Products by Profit
-- ==========================================================

SELECT
    "Product Name",
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY "Product Name"
ORDER BY Total_Profit DESC
LIMIT 10;

-- ==========================================================
-- 6. Bottom 10 Products by Profit
-- ==========================================================

SELECT
    "Product Name",
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY "Product Name"
ORDER BY Total_Profit ASC
LIMIT 10;

-- ==========================================================
-- 7. Most Sold Products
-- ==========================================================

SELECT
    "Product Name",
    SUM(Quantity) AS Quantity_Sold
FROM superstore
GROUP BY "Product Name"
ORDER BY Quantity_Sold DESC
LIMIT 10;

-- ==========================================================
-- 8. Highest Average Selling Price
-- ==========================================================

SELECT
    "Product Name",
    ROUND(AVG(Sales),2) AS Avg_Sale
FROM superstore
GROUP BY "Product Name"
ORDER BY Avg_Sale DESC
LIMIT 10;

-- ==========================================================
-- 9. Category-wise Sales
-- ==========================================================

SELECT
    Category,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY Category
ORDER BY Sales DESC;

-- ==========================================================
-- 10. Sub-Category Sales
-- ==========================================================

SELECT
    "Sub-Category",
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY "Sub-Category"
ORDER BY Sales DESC;

-- ==========================================================
-- 11. Category Contribution (%)
-- ==========================================================

SELECT
    Category,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(
        SUM(Sales) * 100.0 /
        (SELECT SUM(Sales) FROM superstore),
        2
    ) AS Sales_Percentage
FROM superstore
GROUP BY Category
ORDER BY Sales DESC;

-- ==========================================================
-- 12. Sub-Category Contribution (%)
-- ==========================================================

SELECT
    "Sub-Category",
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(
        SUM(Sales) * 100.0 /
        (SELECT SUM(Sales) FROM superstore),
        2
    ) AS Sales_Percentage
FROM superstore
GROUP BY "Sub-Category"
ORDER BY Sales DESC;

-- ==========================================================
-- 13. Average Discount by Category
-- ==========================================================

SELECT
    Category,
    ROUND(AVG(Discount),2) AS Avg_Discount
FROM superstore
GROUP BY Category
ORDER BY Avg_Discount DESC;

-- ==========================================================
-- 14. Average Discount by Sub-Category
-- ==========================================================

SELECT
    "Sub-Category",
    ROUND(AVG(Discount),2) AS Avg_Discount
FROM superstore
GROUP BY "Sub-Category"
ORDER BY Avg_Discount DESC;

-- ==========================================================
-- 15. Profit Margin by Category
-- ==========================================================

SELECT
    Category,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit,
    ROUND(
        SUM(Profit) * 100.0 / SUM(Sales),
        2
    ) AS Profit_Margin
FROM superstore
GROUP BY Category
ORDER BY Profit_Margin DESC;

-- ==========================================================
-- 16. Products with Loss
-- ==========================================================

SELECT
    "Product Name",
    ROUND(SUM(Profit),2) AS Total_Loss
FROM superstore
GROUP BY "Product Name"
HAVING SUM(Profit) < 0
ORDER BY Total_Loss;

-- ==========================================================
-- 17. Product Performance Summary
-- ==========================================================

SELECT
    COUNT(DISTINCT "Product ID") AS Products,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM superstore;

-- ==========================================================
-- 18. Average Sales per Product
-- ==========================================================

SELECT
    "Product Name",
    ROUND(AVG(Sales),2) AS Avg_Sales
FROM superstore
GROUP BY "Product Name"
ORDER BY Avg_Sales DESC
LIMIT 20;

-- ==========================================================
-- 19. Quantity Sold by Category
-- ==========================================================

SELECT
    Category,
    SUM(Quantity) AS Quantity_Sold
FROM superstore
GROUP BY Category
ORDER BY Quantity_Sold DESC;

-- ==========================================================
-- 20. Top 10 Products by Orders
-- ==========================================================

SELECT
    "Product Name",
    COUNT(DISTINCT "Order ID") AS Total_Orders
FROM superstore
GROUP BY "Product Name"
ORDER BY Total_Orders DESC
LIMIT 10;

-- ==========================================================
-- END OF FILE
-- ==========================================================