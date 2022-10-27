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
DROP TABLE IF EXISTS Date_D;
Select R.runner_id,C.order_time, R.[pickup-time], DATEDIFF(MINUTE, C.order_time, R.[pickup-time]) AS Time_D
INTO Date_D
FROM Customer_orders_temp C
JOIN Runner_order_temp R
ON C.order_id = R.order_id
WHERE R.distance <> '' ;


Select runner_id, Time_D, AVG(Time_D)
FROM Date_D 
GROUP BY runner_id, Time_D;
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
Select R.runner_id, C.order_id,DATENAME(WEEKDAY, [pickup-time]) AS DayOFWeek,
ROUND(AVG(distance/[duration(m)] *60), 2) AS Avg_speed
From Runner_order_temp R
JOIN Customer_orders_temp C
ON R.order_id = C.order_id
WHERE distance <> '' 
GROUP BY R.runner_id, C.order_id,DATENAME(WEEKDAY, [pickup-time]);
```
- Runner 1 and Runner 2 appear to both have an average speed of 60km/H when the distance covered for both are 10km 
 and 25km respectively lasting for different time Periods. This is something that can be looked into to understand
 the reason .
- Runner 2 recorded a high Average speed of 93.6 which should be investigated further for any inconsistency

***


### 7. What is the successful delivery percentage for each runner?
``` sql
Select runner_id, 
(100*SUM(CASE WHEN distance = 0 THEN 0
	  ELSE 1
	  END)/ COUNT(*) )AS Success_percent
FROM Runner_order_temp 
GROUP BY runner_id ;
```
***
