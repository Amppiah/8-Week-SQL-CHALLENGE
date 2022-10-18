# Pizza Runner
##TABLE : Customer Orders
Having a view of the customer orders table reveal some issues that need to be corrected.
- The exclusions and extra column will need to be cleaned of the nulls 


```sql
Select order_id,
	   customer_id,
	   pizza_id,
CASE 
	WHEN exclusions LIKE 'NULL' or exclusions LIKE 'NULLL' THEN ''
	ELSE exclusions
	END AS exclusions,
CASE 
	WHEN extras LIKE 'NULL' or extras LIKE 'NULL' THEN ''
	ELSE extras
	END AS extras,
	order_time
INTO Customer_orders_temp

From Customer_orders

Select *
From Customer_orders_temp;

```
