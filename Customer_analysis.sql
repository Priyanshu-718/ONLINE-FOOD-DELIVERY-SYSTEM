CREATE DATABASE ANALYSIS;
USE ANALYSIS;
#here we are using four tabels customers, resturnat, orders and order_items
Select * from `analysis`.`customers_50`;
#1.Get the total count of customers
SELECT COUNT(customer_id)
FROM `analysis`.`customers_50`;
-- customers_50
-- order_items_300
SELECT * FROM `analysis`.`order_items_300`;
-- orders_200
SELECT * FROM `analysis`.`orders_200`;
-- restaurants_20
SELECT * FROM `analysis`.`restaurants_20`;
-- these are the table names
#2.List all unique cities from customers
SELECT DISTINCT(city)
FROM `analysis`.`customers_50`;

#3.Display all resturants with rating aboe 4
SELECT name,rating
FROM `analysis`.`restaurants_20`
WHERE rating>4;

#4.Find total number of orders
SELECT COUNT(order_id)
FROM `analysis`.`orders_200`;
#there are total 200 orders

#5.show orders with amount greater than 500
SELECT COUNT(order_id),total_amount
FROM `analysis`.`orders_200`
WHERE total_amount >500;

#6.count total_customers 
SELECT COUNT(customer_id)
FROM `analysis`.`customers_50`;

#7.Find all resturants in DELHI
SELECT name,city
FROM `analysis`.`restaurants_20`
WHERE city="DELHI";

#8.Show orders placed in my 2023
SELECT order_id,order_date
FROM `analysis`.`orders_200`
WHERE order_date between '2023-06-01' AND '2023-06-31';

#9.Display top 10 orders by amount.
SELECT order_id,total_amount
FROM `analysis`.`orders_200`
ORDER BY total_amount DESC LIMIT 10;

#10.find minimun and maximum order amount
SELECT MIN(total_amount),MAX(total_amount)
FROM `analysis`.`orders_200`;

#11.Find total revenue
SELECT SUM(total_amount)
FROM `analysis`.`orders_200`;
-- 138218 this is sum of total orders 

#12.count orders per city
SELECT a.city,	COUNT(b.order_id)
FROM `analysis`.`customers_50` as a
JOIN `analysis`.`orders_200` as b
ON a.customer_id=b.customer_id #here we are taking waht is common between both the tables
GROUP BY a.city;

#12.show customer names with total orders placed
SELECT a.name,COUNT(b.order_id)
FROM `analysis`.`customers_50` as a
JOIN `analysis`.`orders_200` as b
ON a.customer_id=b.customer_id
group by a.name;

#13.Find average order value per resturant
SELECT a.restaurant_id,AVG(b.total_amount)
FROM `analysis`.`restaurants_20` as a
JOIN `analysis`.`orders_200` as b
ON a.restaurant_id=b.restaurant_id
GROUP BY a.restaurant_id;

#14. Find top 5 customers by spending
SELECT customer_id,(total_amount)
FROM `analysis`.`orders_200`
ORDER BY total_amount DESC LIMIT 5;

#15 Show restaurant names with total sales
SELECT restaurant_id,Sum(total_amount)
FROM `analysis`.`orders_200`
GROUP BY restaurant_id;

#16.Find customers who ordered more than 5 times
SELECT COUNT(customer_id),
COUNT(order_id) as total_count, 
SUM(total_amount) as total_spent
FROM `analysis`.`orders_200` as a 
GROUP BY customer_id
HAVING COUNT(order_id)>5
ORDER BY total_spent  DESC limit 5;

#17.show month wise order count
SELECT MONTH(order_date) as month_wise,
SUM(total_amount) as total_spent
FROM `analysis`.`orders_200`
Group by month_wise;

#18. find city wise revenue
SELECT a.city,
sum(b.total_amount)
FROM `analysis`.`customers_50` as a
JOIN `analysis`.`orders_200` as b
ON a.customer_id=b.customer_id
GROUP BY a.city;

#19.find orders with more than one item
SELECT order_id,count(item_name)
FROM `analysis`.`order_items_300`
GROUP BY order_id
HAVING count(item_name)>1;

#20. find customer who never placed orders
SELECT order_id,count(item_name)
FROM `analysis`.`order_items_300`
GROUP BY order_id
HAVING count(item_name)=0;

#21 show the most popular item 
SELECT (count(item_name)),item_name
FROM `analysis`.`order_items_300`
GROUP BY item_name
ORDER BY count(item_name) DESC limit 1;

#22.find the highest rated restaurant
SELECT name
,MAX(rating)
FROM `analysis`.`restaurants_20`
GROUP BY name
ORDER BY MAX(rating) DESC LIMIT 1;

#23.Show customers who ordered from more than 3 different restaurants.
SELECT customer_id,count(restaurant_id)
FROM `analysis`.`orders_200`
GROUP BY customer_id
HAVING count(restaurant_id)>3;

#24.rank customers by total spending
SELECT customer_id,
(total_amount),
RANK() OVER (ORDER BY total_amount DESC) as ordered_rank
FROM `analysis`.`orders_200`;

#25.Find top restaurant by each city
SELECT SUM(b.total_amount),a.city
FROM `analysis`.`customers_50` as a
JOIN `analysis`.`orders_200` as b
on a.customer_id=b.customer_id
GROUP BY a.city;

#26.show running total by date
SELECT order_date,
       SUM(total_amount) AS daily_revenue,
       SUM(SUM(total_amount)) OVER (ORDER BY order_date) AS running_total
FROM analysis.orders_200
GROUP BY order_date
ORDER BY order_date;

#27.show customer name with order amount
SELECT a.name,sum(b.total_amount)
FROM `analysis`.`customers_50` as a
INNER JOIN `analysis`.`orders_200` as b
on a.customer_id= b.customer_id
Group by name
ORDER BY sum(b.total_amount) DESC;

#28.show all customers, even those who never placed any order also
SELECT a.name,count(b.order_id)
FROM `analysis`.`customers_50` as a
LEFT JOIN `analysis`.`orders_200` as b
ON a.customer_id=b.customer_id
GROUP BY name;

#29.show all restaurants even if they don't have any orders
SELECT a.name,count(b.order_id) as total_count
FROM `analysis`.`restaurants_20` as a
RIGHT JOIN `analysis`.`orders_200` as b
on a.restaurant_id=b.restaurant_id
Group by name;

#30.Show all customers and restuarants and all orders (matched + unmatched)
SELECT a.name,count(b.order_id)
FROM `analysis`.`customers_50` as a
LEFT JOIN `analysis`.`orders_200` as b
ON a.customer_id=b.customer_id
GROUP BY name
UNION
SELECT a.name,count(b.order_id) as total_count
FROM `analysis`.`restaurants_20` as a
RIGHT JOIN `analysis`.`orders_200` as b
on a.restaurant_id=b.restaurant_id
Group by name;

