
/*-------AverageSellingPrice-------------*/
DROP TABLE ASP_Prices
CREATE TABLE ASP_Prices(
 product_id   int,
 [start_date] DATE,
 end_date     DATE,
 price        int   
)
INSERT INTO ASP_Prices
(product_id , [start_date] , end_date  , price )
VALUES	
( 1          , '2019-02-17' , '2019-02-28' , 5  ),    
( 1          , '2019-03-01' , '2019-03-22' , 20 ),    
( 2          , '2019-02-01' , '2019-02-20' , 15 ),    
( 2          , '2019-02-21' , '2019-03-31' , 30 ) 

DROP TABLE ASP_UnitsSold
CREATE TABLE ASP_UnitsSold(
[product_id]   INT,
[purchase_date] DATE,
[units] INT,
)
INSERT INTO ASP_UnitsSold
(product_id , purchase_date , units )
VALUES
( 1          , '2019-02-25'    , 100   ),
( 1          , '2019-03-01'    , 15    ),
( 2          , '2019-02-10'    , 200   ),
( 2          , '2019-03-22'    , 30  )

--------------------------------------------------------------------------------------

SELECT P.product_id, ROUND(CAST(SUM(P.price * U.units) AS float) / CAST(SUM(units) AS float), 2) AS average_price
	FROM ASP_Prices P 
	JOIN ASP_UnitsSold U ON P.product_id = U.product_id AND U.purchase_date BETWEEN P.start_date AND P.end_date
	GROUP BY P.product_id

SELECT CAST(UNITS AS varchar(20))
FROM ASP_UnitsSold 


