# Runner and Customer Experience 
## Questions to be analysed in this part of the case study :

***
### 1. How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)

```sql
Select DATEPART(week,registration_Date) AS Week, COUNT(runner_id) AS Total_runners
From Runners
GROUP BY DATEPART(week,registration_Date) ;
```
***

### 2.What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?

``` sql
Select [runner_id], DATEDIFF(MINUTE,order_time, [pickup-time]) AS Runer_pickup
From Customer_orders_temp C
JOIN Runner_order_temp R
ON C.order_id = R.order_id ;
```
***

### 3. Is there any relationship between the number of pizzas and how long the order takes to prepare?

``` sql


```
***


### 4.What was the average distance travelled for each customer?

``` sql
 Select customer_id, AVG(distance) AS Average_distance
From Customer_orders_temp C
JOIN Runner_order_temp R
ON C.order_id =R.order_id
WHERE cancellation =''
GROUP BY customer_id ;

```
***


### 5. What was the difference between the longest and shortest delivery times for all orders?

``` sql
Select MIN([duration(m)])AS Lowest, MAX([duration(m)]) AS Highest,
( MAX([duration(m)]) -  MIN([duration(m)]) )AS duration_intereval
From Runner_order_temp  
WHERE [duration(m)] <> '' ;

````
***


### 6. What was the average speed for each runner for each delivery and do you notice any trend for these values?
```sql

```
***


### 7. What is the successful delivery percentage for each runner?
``` sql

```
***

### 8. How many pizzas were delivered that had both exclusions and extras?
``` sql


```
***

### 9. What was the total volume of pizzas ordered for each hour of the day?
``` sql

```
***

### 10. What was the volume of orders for each day of the week?
``` sql

```
***
