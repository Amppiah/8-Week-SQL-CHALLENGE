# Pizza Metrics 
## Questions to be analysed in this part of the case study :

***
### 1. How many pizzas were ordered?

```sql
Select COUNT (order_id)
From Customer_orders
```
***

### 2. How many unique customer orders were made?

``` sql
Select COUNT (DISTINCT (order_id))
From Customer_orders
```
***

### 3. How many successful orders were delivered by each runner?

``` sql
Select runner_id, COUNT (DISTINCT(order_id)) AS Order_Count
From Runner_order_temp
WHERE cancellation = ''
GROUP BY runner_id ;

```
***


### 4. How many of each type of pizza was delivered?

``` sql
Select C.pizza_id, COUNT(R.order_id) AS PIzza_delievered
From Customer_orders_temp C
JOIN Runner_order_temp R
ON C.order_id = R.order_id
WHERE cancellation = ''
GROUP BY pizza_id 
```
***


### 5. How many Vegetarian and Meatlovers were ordered by each customer?

``` sql
Select  C.customer_id,P.pizza_name,COUNT((C.order_id)) AS Total
FROM Customer_orders_temp C
JOIN Pizza_name P
ON C.pizza_id = P.pizza_id
GROUP BY C.customer_id, P.pizza_name
ORDER BY C.customer_id ;

````
***


### 6. What was the maximum number of pizzas delivered in a single order?
``` sql
Select TOP 1 C.customer_id,R.order_id, COUNT(R.order_id) AS T_Number
FROM Customer_orders_temp C
JOIN Runner_order_temp R
ON C.order_id = R.order_id
WHERE R.cancellation = ''
GROUP BY C.customer_id, R.order_id
ORDER BY T_Number DESC ;

---OR 

 WITH pizza_total_cte AS 
 (
Select C.customer_id,R.order_id, COUNT(R.order_id) AS T_Number
FROM Customer_orders_temp C
JOIN Runner_order_temp R
ON C.order_id = R.order_id
WHERE R.cancellation = ''
GROUP BY C.customer_id, R.order_id
--ORDER BY T_Number DESC
)
Select MAX(T_Number) AS Total
From pizza_total_cte

```
***


### 7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
``` sql
Select customer_id,
SUM
(CASE WHEN C.exclusions <> '' OR C.extras <> '' THEN 1
 ELSE 0
 END) AS Atleast_1_change,
 SUM 
 (CASE WHEN C.exclusions = '' OR C.extras = '' THEN 1
 ELSE 0
 END) AS no_change 
From Customer_orders_temp C
JOIN Runner_order_temp R
ON C.order_id = R.order_id
WHERE R.cancellation = ''
GROUP BY C.customer_id;

```
***

### 8. How many pizzas were delivered that had both exclusions and extras?
``` sql
WITH pizza_delivered_cte AS
 (
Select C.pizza_id, R.order_id, R.cancellation
FROM  Customer_orders_temp C
JOIN Runner_order_temp R
ON C.order_id = R.order_id
WHERE C.exclusions <> '' AND C.extras <> '' AND R.cancellation <>''
) 
Select COUNT(order_id)
From pizza_delivered_cte
WHERE cancellation <> '';


```
***

### 9. What was the total volume of pizzas ordered for each hour of the day?
``` sql
Select DATEPART(HH,[order_time]) AS hour_day,COUNT(order_id)Total
FROM Customer_orders_temp
GROUP BY DATEPART(HH,order_time) ;

```
***

### 10. What was the volume of orders for each day of the week?
``` sql
Select
FORMAT(DATEADD(DAY, 2, order_time),'dddd') AS day_of_week, -- add 2 to adjust 1st day of the week as Monday
  COUNT(order_id) AS total_pizzas_ordered
FROM Customer_orders_temp
GROUP BY FORMAT(DATEADD(DAY, 2, order_time),'dddd') ;
***
