---Creating the schema to be used for the queries

CREATE TABLE Runners ( 
"runner_id" INTEGER,
"registration_Date" DATE)

INSERT INTO Runners("runner_id", "registration_Date")
VALUES 
     ('1','2021-01-01'),
	 ('2','2021-01-03'),
	 ('3','2021-01-08'),
	 ('4','2021-01-15');

CREATE TABLE Customer_orders ( 
"order_id" INTEGER,
"customer_id" INTEGER,
"pizza_id" INTEGER,
"exclusions" VARCHAR(4),
"extras" VARCHAR(4),
"order_time" DATE
)
--In creating the tables Data type for the exclusion and extra column Datatype varchar was used instead of Integer 
--because of the values which can be classified as text instead of value( can be used in calculations). The same 
--process was used for the preceeding tables
INSERT INTO Customer_orders ("order_id","customer_id","pizza_id","exclusions","extras","order_time")
VALUES 
	  ('1','101','1','','','2021-01-01 18:05:02'),
	  ('2','101','1','','','2021-01-01 19:00:52'),
	  ('3','102','1','','','2021-01-02 23:51:23'),
	  ('3','102','2','','Null','2021-01-02 23:51:23'),
	  ('4','103','1','4','','2021-01-04 13:23:46'),
	  ('4','103','1','4','','2021-01-04 13:23:46'),
	  ('4','103','2','4','','2021-01-04 13:23:46'),
	  ('5','104','1',null,'1','2021-01-08 21:00:29'),
	  ('6','101','2',null,null,'2021-01-08 21:03:13'),
	  ('7','105','2',null,'1','2021-01-08 21:20:29'),
	  ('8','102','1',null,null,'2021-01-09 23:54:33'),
	  ('9','103','1','4','1,5','2021-01-10 11:22:59'),
	  ('10','104','1',null,null,'2021-01-11 18:34:49'),
	  ('10','104','1','2,6','1,4','2021-01-11 18:34:49');

CREATE TABLE Runner_orders ( 
"order_id" INTEGER,
"runner_id" INTEGER,
"pickup-time" VARCHAR(20),
"distance" VARCHAR(20),
"duration(m)" VARCHAR(20),
"cancellation" VARCHAR(25)
)

DROP TABLE Runner_orders ;

INSERT INTO Runner_orders ("order_id","runner_id","pickup-time","distance","duration(m)",cancellation)
VALUES 
	  ('1','1','2021-01-01 18:15:34','20km','32 minutes',''),
	  ('2','1','2021-01-01 19:10:54','20km','27 minutes',''),
	  ('3','1','2021-01-03 00:12:37','13.4km','20 mins','NaN'),
	  ('4','2','2021-01-04 13:53:03','23.4km','40','NaN'),
	  ('5','3','2021-01-08 21:10:57','10','15','NaN'),
	  ('6','3','Null','Null','Null','Restaurant Cancellation'),
	  ('7','2','2020-01-08 21:30:45','25km','25mins','Null'),
	  ('8','1','2020-01-10 00:15:02','23.4km','15 minute','Null'),
	  ('9','2','Null','Null','Null','Customer Cancelled'),
	  ('10','1','2020-01-11 18:50:20','10km','10minutes','Null');


CREATE TABLE Pizza_name(
						"pizza_id" INTEGER,
						"pizza_name" VARCHAR(20)
)

INSERT INTO Pizza_name("pizza_id","pizza_name")
VALUES 
	('1','Meat Lovers'),
	('2','Vegatarian');	  

CREATE TABLE Pizza_recipes(
						   "pizza_id" INTEGER,
						   "toppings" VARCHAR(20))

INSERT INTO Pizza_recipes("pizza_id", "toppings")
VALUES 
	  ('1','1,2,3,4,5,6,8,10'),
	  ('2', '4,6,7,9,11,12');

CREATE TABLE Pizza_toppings(
							"topping_id" INTEGER,
							"topping_name" VARCHAR(20))

INSERT INTO Pizza_toppings("topping_id","topping_name")
VALUES 
	  ('1','Bacon'),
	  ('2','BBQ Sauce'),
	  ('3','Beef'),
	  ('4','Cheese'),
	  ('5','Chicken'),
	  ('6','Mushrooms'),
	  ('7','Onions'),
	  ('8','Pepperoni'),
	  ('9','Peppers'),
	  ('10','Salami'),
	  ('11','Tomatoes'),
	  ('12','Tomatoes Sauce');
