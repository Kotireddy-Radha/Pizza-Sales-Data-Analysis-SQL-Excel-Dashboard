SELECT * FROM [Pizza Sales Dataset];

--Total Revenue
SELECT 
SUM(total_price) AS Total_Revenue
FROM [Pizza Sales Dataset];

--Average Order Value
SELECT 
SUM(total_price) / COUNT(DISTINCT(order_id)) AS Average_Order_Value 
FROM [Pizza Sales Dataset];

--Total Pizzas Sold
SELECT 
SUM(quantity) AS Total_Pizzas_Sold 
FROM [Pizza Sales Dataset];

--Total Orders
SELECT 
COUNT(DISTINCT(order_id)) AS Total_Orders 
FROM [Pizza Sales Dataset];

--Average Pizzas per order
SELECT 
CAST(
CAST(SUM(quantity) AS DECIMAL) / 
CAST(COUNT(DISTINCT(order_id))AS DECIMAL) 
AS DECIMAL(10,2)) AS Average_Pizzas_Per_Order 
FROM [Pizza Sales Dataset];

--Daily Trend
SELECT 
order_day, 
COUNT(DISTINCT(order_id)) AS Total_orders 
FROM [Pizza Sales Dataset] 
GROUP BY order_day;

--Hourly Trend
SELECT 
DATEPART(HOUR,order_time) AS Order_Hour , 
COUNT(DISTINCT(order_id)) AS Total_orders 
FROM [Pizza Sales Dataset] 
GROUP BY DATEPART(HOUR,order_time) 
ORDER BY DATEPART(HOUR,order_time);

-- Calculating percentage of sales by Category
SELECT 
pizza_category, 
ROUND(SUM(total_price),0 ) AS Total_sales , 
ROUND((SUM(total_price)/ SUM(SUM(total_price)) OVER())*100,2) AS "Percentage_Of_Sales"
FROM [Pizza Sales Dataset]
GROUP BY pizza_category
ORDER BY "Percentage_Of_Sales" DESC;

--Calculating percentage of sales by size
SELECT
pizza_size,
ROUND(SUM(total_price),0) AS Total_sales,
ROUND((SUM(total_price) / SUM(SUM(total_price)) OVER()) * 100, 2) AS Percentage_of_sales
FROM [Pizza Sales Dataset]
GROUP BY pizza_size
ORDER BY Percentage_of_sales DESC

--Calculating Total pizzas sold by category
SELECT
pizza_category, 
SUM(quantity) AS Total_Pizzas_Sold 
FROM [Pizza Sales Dataset] 
GROUP BY pizza_category;

--Calculating Top 5 best sold pizzas
SELECT TOP 5 
pizza_name, 
SUM(quantity) AS Total_Pizzas_Sold
FROM [Pizza Sales Dataset]
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC;

--Calculating bottom 5 worst sold pizzas
SELECT TOP 5 
pizza_name, 
SUM(quantity) AS Total_Pizzas_Sold
FROM [Pizza Sales Dataset]
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC;

