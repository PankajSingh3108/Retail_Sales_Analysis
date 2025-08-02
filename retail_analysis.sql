create database Sales_Analysis
go 
use Sales_Analysis

--1. Total Sales, Profit, and Orders

SELECT 
    COUNT(DISTINCT Order_ID) AS TotalOrders,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM RetailSales; 

select * from RetailSales

--2. Top 5 Selling Products
SELECT Top 5
    Product_Name,
    SUM(Sales) AS TotalSales
FROM RetailSales
GROUP BY Product_Name
ORDER BY TotalSales DESC
;

--3. Bottom 5 Products by Profit
SELECT Top 5
    Product_Name,
    SUM(Profit) AS TotalProfit
FROM RetailSales
GROUP BY Product_Name
ORDER BY TotalProfit ASC
;

--4. Sales by Region and Category

SELECT 
    Region,
    Category,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM RetailSales
GROUP BY Region, Category
ORDER BY Region, TotalSales DESC;

--5. Delayed Shipments (>7 Days)

SELECT 
    Order_ID,
    Order_Date,
    Ship_Date,
    DATEDIFF(day, Order_Date, Ship_Date) AS ShippingDays
FROM RetailSales
WHERE DATEDIFF(day, Order_Date, Ship_Date) > 7;

--6. Monthly Sales Trend

SELECT 
    YEAR(Order_Date) AS OrderYear,
    MONTH(Order_Date) AS OrderMonth,
    SUM(Sales) AS MonthlySales
FROM RetailSales
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY OrderYear, OrderMonth;


--7. Discount Impact on Profit
SELECT 
    Discount,
    ROUND(AVG(Profit), 2) AS AvgProfit
FROM RetailSales
GROUP BY Discount
ORDER BY Discount;













