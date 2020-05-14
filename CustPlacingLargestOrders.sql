

CREATE TABLE CustPlacingLargestOrders
(
 order_number  int       ,
 customer_number    int       ,
 order_date         date      ,
 required_date      date      ,
 shipped_date       date      ,
 status             VARchar(15)  ,
 comment            VARchar(200) 
 )
 INSERT INTO CustPlacingLargestOrders
 ( order_number , customer_number , order_date , required_date , shipped_date , status , comment )
 VALUES
( 1            , 1               , '2017-04-09' ,'2017-04-13', '2017-04-12', 'Closed' , '' ),
( 2            , 2               , '2017-04-15' ,'2017-04-20', '2017-04-18', 'Closed' , '' ),
( 3            , 3               , '2017-04-16' ,'2017-04-25', '2017-04-20', 'Closed' , '' ),
( 4            , 3               , '2017-04-18' ,'2017-04-28', '2017-04-25', 'Closed' , '' )    

SELECT TOP 1 customer_number
	FROM CustPlacingLargestOrders
	GROUP BY customer_number
	ORDER BY COUNT(order_number) DESC
