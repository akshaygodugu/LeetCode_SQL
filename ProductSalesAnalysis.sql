
/*-------ProducTSalesAnalysis--------------*/

CREATE TABLE PSA_Sales(
 sale_id      int   ,
 product_id   int   ,
 year         int   ,
 quantity     int   ,
 price        int   
)
INSERT INTO PSA_Sales
( sale_id , product_id , year , quantity , price )
VALUES	
( 1       , 100        , 2008 , 10       , 5000  ),
( 2       , 100        , 2009 , 12       , 5000  ),
( 7       , 200        , 2011 , 15       , 9000  )


CREATE TABLE PSA_Product(
[product_id]   INT,
[product_name] VARCHAR(20),
)
INSERT INTO PSA_Product
( product_id , product_name )
VALUES
( 100        , 'Nokia'        ),
( 200        , 'Apple'        ),
( 300        , 'Samsung'      )

---------ProducTSalesAnalysis 1-----------------

SELECT product_name ,year, price
	FROM PSA_Sales S
	INNER JOIN PSA_Product P ON S.product_id = P.product_id


---------ProducTSalesAnalysis 11-----------------

SELECT product_id, SUM(quantity) AS total_quantity		
	FROM PSA_Sales
	GROUP BY product_id

-- WINDOW FUNCTION
SELECT DISTINCT product_id, SUM(quantity) OVER (PARTITION BY product_id) AS total_quantity		
	FROM PSA_Sales

