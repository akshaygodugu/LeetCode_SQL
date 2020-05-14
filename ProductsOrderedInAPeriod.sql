
----------------ProductsOrderedInAPeriod--------------------------

DROP TABLE ProductsOrdered
CREATE TABLE ProductsOrdered(
[product_id]   INT,
[product_name]  VARCHAR(30),
[product_category]  VARCHAR(30),
) 
INSERT INTO ProductsOrdered
( product_id  ,  product_name, product_category)
 VALUES		  
( 1           , 'Leetcode Solutions'    , 'Book'    ),
( 2           , 'Jewels of Stringology' , 'Book'    ),
( 3           , 'HP'                    , 'Laptop'  ),
( 4           , 'Lenovo'                , 'Laptop'  ),
( 5           , 'Leetcode Kit'          , 'T-shirt' )

CREATE TABLE OrdersOrdered(
[product_id]   INT,
[order_date]  DATE,
[unit] int,
) 
INSERT INTO OrdersOrdered
( product_id   , order_date   , unit)
VALUES
( 1            , '2020-02-05'   , 60  ),
( 1            , '2020-02-10'   , 70  ),
( 2            , '2020-01-18'   , 30  ),
( 2            , '2020-02-11'   , 80  ),
( 3            , '2020-02-17'   , 2   ),
( 3            , '2020-02-24'   , 3   ),
( 4            , '2020-03-01'   , 20  ),
( 4            , '2020-03-04'   , 30  ),
( 4            , '2020-03-04'   , 60  ),
( 5            , '2020-02-25'   , 50  ),
( 5            , '2020-02-27'   , 50  ),
( 5            , '2020-03-01'   , 50  )


SELECT *
	FROM(
	SELECT product_name, SUM(unit) AS unit
		FROM ProductsOrdered P
		JOIN OrdersOrdered O ON P.product_id = O.product_id
		WHERE order_date BETWEEN '20200201' AND '20200229' 
		GROUP BY product_name) AS T
	WHERE unit >= 100

-----------------WITHOUT USING A SUB QUERY--------------------------------

SELECT product_name,  SUM(unit) AS unit
	FROM ProductsOrdered P
	JOIN OrdersOrdered O ON P.product_id = O.product_id
	WHERE order_date BETWEEN '20200201' AND '20200229' 
	GROUP BY product_name
	HAVING SUM(unit) >= 100
	