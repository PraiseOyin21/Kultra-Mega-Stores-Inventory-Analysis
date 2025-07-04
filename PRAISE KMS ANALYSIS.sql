create database KMS_DSA

-- Kultra Mega Stores (KMS) Business Intelligence Analysis
-- Case Scenario I: Sales & Operations Analysis
-- DSA Capstone Project - Case Study 2

------IMPORT KMS SQL CASE STUDY FILES
-- SCENARIO I ANALYSIS QUERIES

-- Question 1: Which product category had the highest sales?
-- =====================================================

select * from KMS


select (product_category),
sum(unit_price) As totalsales
from KMS
Group by (Product_category)
order by totalsales desc

-- Question 2: What are the Top 3 and Bottom 3 regions in terms of sales?
-- =====================================================

-- Top 3 regions by sales
select Region, SUM(SALES) As Totalsales
from KMS
GROUP BY Region
ORDER BY Totalsales DESC

---Bottom 3 regions in terms of sales---
select Region, SUM(SALES) As Totalsales
from KMS
GROUP BY Region
ORDER BY Totalsales ASC

-- Question 3: What were the total sales of appliances in Ontario?
--============================================================

select SUM(Sales) As ApplianceSalesInOntario
from KMS
GROUP BY Region
ORDER BY Totalsales DESC


-- Question 4:Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers
--Bottom 10 customers analysis for revenue optimization
-- =====================================================

select Customer_Name, SUM(Profit) As TotalProfit
from KMS
GROUP BY Customer_Name
ORDER BY TotalProfit ASC


-- Question 5: KMS incurred the most shipping cost using which shipping method? 
---Shipping method with highest shipping cost
-- =====================================================

select Ship_mode, SUM(Shipping_Cost) As TotalShipping_Cost
from KMS 
GROUP BY Ship_mode
ORDER BY TotalShipping_Cost DESC

-- SCENARIO II ANALYSIS QUERIES
-- =====================================================

-- Question 6: Who are the most valuable customers, and what products or services do they typically purchase?

---Most valuable customers and their purchase patterns

select Customer_Name, Product_Name, SUM(Profit) As TotalProfit, COUNT(Order_ID) As Order_Quatity
from KMS
GROUP BY Customer_Name, Product_Name 
ORDER BY TotalProfit DESC,order_Quatity DESC

select Customer_Name, Product_Name, SUM(Profit) As TotalProfit, COUNT(Order_ID) As Order_count
from KMS
GROUP BY Customer_Name, Product_Name 
ORDER BY TotalProfit DESC,order_count DESC

--Question 7: Which small business customer had the highest sales? ------
select Customer_Name, SUM(Sales) As Totalsales
from KMS
GROUP BY Customer_Name 
ORDER BY Totalsales DESC

---Question 8: Which Corporate Customer placed the most number of orders in 2009 – 2012?
select Customer_Name, COUNT(Order_ID) As order_count
from KMS 
WHERE Customer_Segment= 'Corporate' AND YEAR(Order_Date) BETWEEN 2009 AND 2012
GROUP BY Customer_Name
ORDER BY order_count DESC

---Question 9: Which consumer customer was the most profitable one?
select Customer_Name, SUM(Profit) As TotalProfit 
from KMS 
WHERE Customer_Segment= 'Consumer'
GROUP BY Customer_Name 
ORDER BY TotalProfit DESC 

---Question 10: Which customer returned items, and what segment do they belong to? 
SELECT DISTINCT Customer_Name, Customer_Segment,Customer_ID  COUNT(Order_ID) as Order_Quantity,SUM(Sales) As Total_return_sales, SUM(Profit) As Total_return_incidents
FROM KMS
WHERE profit < 0  
GROUP BY customer_name, customer_id, Customer_segment
ORDER BY return_incidents DESC