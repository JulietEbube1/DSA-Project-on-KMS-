create database Kultra_Megastores_Inventory

-------import table----------
select * from [KMS Sql Case Study 1]


1. ------ product category with the highest sales----
select PRODUCT_CATEGORY, SUM (SALES) as TOTALSALES 
from [KMS Sql Case Study 1]
group by PRODUCT_CATEGORY
order by TOTALSALES DESC
----Product category with highest sales is TECHNOLOGY


2. ------ TOP 3 REGIONS IN TERMS OF SALES
 select top 3 region,
 round(sum(sales),2) as totalsales
 from [KMS Sql Case Study 1]
 group by region
 order by totalsales desc
 ----- The top 3 region is WEST, ONTARIO and PRARIE

 ----- Bottom 3 regions in terms of sales
 select region,
 round(sum(sales),2) as totalsales
 from [KMS Sql Case Study 1]
 group by region
 order by totalsales asc
 offset 0 rows fetch next 3 rows only 
 ----- The bottom 3 region is NUNAVUT, NORTHWEST TERRITORIES and YUKON


 3. ------the total sales of appliances in Ontario? 
 SELECT REGION,
 ROUND(SUM(SALES),2) AS Total_Sales_Appliances
 from  [KMS Sql Case Study 1]
 WHERE REGION = 'ONTARIO' AND PRODUCT_SUB_CATEGORY = 'APPLIANCES'
 GROUP BY REGION 
 ---- The total sales is 202346.84


 4. -----4.	Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers
 select top 10 customer_name,
 round(sum(sales),2) as total_sales
 from [KMS Sql Case Study 1]
 group by customer_name
 order by total_sales asc
 -- To increse revenue in these customers it will be adviced that the company invest in advertisement of products, 
 --and givng of incentives to customers to create sensitization and encourage patronage


 5.------KMS incurred the most shipping cost using which shipping method? 
 select ship_mode,
 round(sum(Shipping_Cost),2) as total_ship_cost
 from [KMS Sql Case Study 1]
 group by Ship_mode
 order by total_ship_cost desc
 ------- using Delivery Truck
 

 6.	----Who are the most valuable customers, and what products or services do they typically purchase? 
 select customer_name, product_category,
 round(sum(sales),3) as total_sales
 from [KMS Sql Case Study 1]
 group by customer_name, product_category
 order by total_sales desc 
 ------the most valuable customers purchase Technolgy 


 7.------Which small business customer had the highest sales?
 select customer_name, customer_segment,
 round(sum(sales),3) as total_sales
 from [KMS Sql Case Study 1]
 where customer_segment = 'small business'
 group by customer_name, customer_segment 
 order by total_sales desc
 ------ the small business customer that had highest sales is Dennis Kane


  8.-------Which Corporate Customer placed the most number of orders in 2009 – 2012? 
 select customer_name,ORDER_QUANTITY
 from [KMS Sql Case Study 1]
 WHERE ORDER_DATE BETWEEN '01-01-2009' AND '01-01-2012'
 GROUP BY CUSTOMER_NAME, ORDER_QUANTITY


 9.------Which consumer customer was the most profitable one?
 select customer_name, 
 round(sum(profit),2) as total_profit
 from [KMS Sql Case Study 1]
 group by customer_name
 order by total_profit desc
 ---- the most profitable customer is Emily Phan


10.-----Which customer returned items, and what segment do they belong to?
select [KMS Sql Case Study 1] . ROW_ID,
       [KMS Sql Case Study 1] . ORDER_ID,
       [KMS Sql Case Study 1] . CUSTOMER_NAME,
       [KMS Sql Case Study 1] . CUSTOMER_SEGMENT,
       ORDER_STATUS. ORDER_ID,
       ORDER_STATUS.STATUS 
FROM [KMS Sql Case Study 1]
JOIN ORDER_STATUS 
ON [KMS Sql Case Study 1].ORDER_ID = ORDER_STATUS.ORDER_ID
---- The customers that returned goods was gotten by joining the two tables together


11.----If the delivery truck is the most economical but the slowest shipping method and 
--Express Air is the fastest but the most expensive one, 
--do you think the company appropriately spent shipping costs 
--based on the Order Priority? 
--Explain your answer 

answer-- YES, I think the company spent shipping cost besed on priority, because, the faster the turn over
--the faster the profit is gotten and also,the customer are not at risk of changing suppliers because of delay
--thereby, maintaining customers and also delivering in due time and at the same time making faster sales circles.

