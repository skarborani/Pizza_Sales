select * from pizza_sales;

select sum(total_price) as total_sales_revenue from pizza_sales;

select sum(total_price) / COUNT(distinct order_id) AS AVG_ORDER_Value from pizza_sales;

select sum(quantity) as Total_Pizza_Sold from pizza_sales;

select count(distinct order_id) as Total_Orders from pizza_sales;

select cast(
		cast(sum(quantity) AS decimal(10,2)) / cast(COUNT(distinct order_id) as decimal(10,2)) as decimal(10,2)) AS AVG_Pizza_Per_Order from pizza_sales;


-- Daily Trend
select DATENAME(DW, order_date) as order_day, COUNT(distinct order_id) as TOTAL_Orders 
from pizza_sales
group by DATENAME(DW, order_date);

-- Hourly Trend
select DATEPART(HOUR, order_time) AS order_hours, COUNT(distinct order_id) AS total_orders
from pizza_sales
group by DATEPART(HOUR, order_time)
order by DATEPART(HOUR, order_time);

select pizza_category, SUM(total_price), SUM(total_price) * 100 / (select sum(total_price) from pizza_sales where MONTH(order_date) = 1
) As PCT
from pizza_sales
where MONTH(order_date) = 1
group by pizza_category;

select pizza_size, cast(SUM(total_price) as decimal(10,2)) as total_sales, cast(SUM(total_price) * 100 / (select sum(total_price) from pizza_sales where datepart(quarter, order_date) = 1) as decimal(10,2)) as PCT
from pizza_sales
where datepart(quarter, order_date) = 1
group by pizza_size
order by PCT desc;

select pizza_category, SUM(quantity) as total_Pizza_sold
from pizza_sales
group by pizza_category;


select top 5 pizza_name, sum(quantity) as Total_sold
from pizza_sales
where month(order_date) =1
Group by pizza_name
order by sum(quantity) asc;

