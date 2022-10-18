Select *
from Customer_orders
---Creating a temporay table to clean the data

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
From Customer_orders_temp

---Creating of a Temporary table to clean the Runners_order

Select [pickup-time]
From Runner_orders

DROP TABLE Runner_order_temp

Select order_id,
	   runner_id,
CASE 
	WHEN [pickup-time] LIKE 'Null' THEN ''
	ELSE [pickup-time]
	END AS [pickup-time],
CASE 
	WHEN distance LIKE 'Null' THEN ''
	WHEN distance LIKE '%km' THEN TRIM ('km' from distance) 
	ELSE distance
END AS distance,
CASE 
	WHEN [duration(m)]LIKE 'Null' THEN ''
	WHEN [duration(m)] LIKE '%minutes' THEN TRIM ('minutes' from [duration(m)])
	WHEN [duration(m)] LIKE '%mins' THEN TRIM ('mins' from [duration(m)])
	WHEN [duration(m)] LIKE '%minute' THEN TRIM ('minute' from [duration(m)])
	ELSE [duration(m)] 
END AS [duration(m)],
CASE 
	WHEN cancellation LIKE 'Null' THEN ''
	WHEN cancellation LIKE 'NaN' THEN ''
	ELSE cancellation 
END AS cancellation
INTO Runner_order_temp
From Runner_orders

Select *
From Runner_order_temp

ALTER TABLE Runner_order_temp
ALTER COLUMN [pickup-time] DATETIME,
ALTER COLUMN distance FLOAT,
ALTER COLUMN [duration(m)] INTEGER

----Changing column name in Runner_orders Table to make it easy to ready

--ALTER TABLE Runner_order_temp RENAME Column distance TO [distance(km)]
