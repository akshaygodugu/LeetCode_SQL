------ImmediateFoodDelivey-------

CREATE TABLE ImmediateFoodDelivey(
delivery_id   int,
customer_id INT,
order_date     DATE,
customer_pref_delivery_date   DATE   
)
INSERT INTO ImmediateFoodDelivey
( delivery_id , customer_id , order_date , customer_pref_delivery_date )
VALUES
( 1           , 1           , '2019-08-01' , '2019-08-02'                  ),
( 2           , 5           , '2019-08-02' , '2019-08-02'                  ),
( 3           , 1           , '2019-08-11' , '2019-08-11'                  ),
( 4           , 3           , '2019-08-24' , '2019-08-26'                  ),
( 5           , 4           , '2019-08-21' , '2019-08-22'                  ),
( 6           , 2           , '2019-08-11' , '2019-08-13'		           )

--------------------------------------------------------------------------------
------ImmediateFoodDelivey1-------


--USING JOIN-------
SELECT ROUND(CAST(COUNT(*) * 100 AS FLOAT)  / CAST((SELECT COUNT(*) FROM ImmediateFoodDelivey) AS FLOAT) , 2) AS immediate_percentage
	FROM ImmediateFoodDelivey A
	INNER JOIN ImmediateFoodDelivey B ON A.delivery_id = B.delivery_id AND A.order_date = B.customer_pref_delivery_date

--WTHOUT JOIN-------
SELECT ROUND(CAST((SELECT COUNT(*) FROM ImmediateFoodDelivey WHERE order_date = customer_pref_delivery_date)*100 AS FLOAT) / COUNT(*), 2) AS immediate_percentage
FROM ImmediateFoodDelivey



------ImmediateFoodDelivey11-------

CREATE TABLE ImmediateFoodDelivey11(
delivery_id   int,
customer_id INT,
order_date     DATE,
customer_pref_delivery_date   DATE   
)
INSERT INTO ImmediateFoodDelivey11
( delivery_id , customer_id , order_date , customer_pref_delivery_date )
VALUES
( 1           , 1           , '2019-08-01' , '2019-08-02'                  ),
( 2           , 2           , '2019-08-02' , '2019-08-02'                  ),
( 3           , 1           , '2019-08-11' , '2019-08-12'                  ),
( 4           , 3           , '2019-08-24' , '2019-08-24'                  ),
( 5           , 3           , '2019-08-21' , '2019-08-22'                  ),
( 6           , 2           , '2019-08-11' , '2019-08-13'		           ),
( 7           , 4           , '2019-08-09' , '2019-08-09'		           )

--------------------------------------------------------------------------------------------------------------------


SELECT ROUND(CAST(SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END)*100 AS FLOAT) / COUNT(*), 2) AS immediate_percentage
	FROM(
		SELECT *,ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS RN
			FROM ImmediateFoodDelivey11
		) AS A
		WHERE RN = 1
-------------------------------- ACCEPTED BUT COMPLICATED PROCESS--------------------------------
WITH CTE AS
(
SELECT *
	FROM 
	(
	SELECT *,ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS RN
		FROM ImmediateFoodDelivey11 A 
	) B
	WHERE RN = 1
)
SELECT ROUND(CAST(COUNT(*) * 100 AS FLOAT)  / CAST((SELECT COUNT(*) FROM CTE) AS FLOAT) , 2) AS immediate_percentage
	FROM CTE A
	INNER JOIN CTE B ON A.delivery_id = B.delivery_id AND A.order_date = B.customer_pref_delivery_date 
-----------------------------------------------------------------------------------------------------------------
