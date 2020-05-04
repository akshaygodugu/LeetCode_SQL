------GamePlayAnalysis-------
--DROP TABLE GamePlayAnalysis
--CREATE TABLE GamePlayAnalysis(
--player_id   int,
--device_id INT,
--event_date     DATE,
--games_played      int   
--)
--INSERT INTO GamePlayAnalysis
--( player_id , device_id , event_date , games_played )
--VALUES 
--( 1         , 2         , '2016-03-01' , 5            ),
--( 1         , 2         , '2016-05-02' , 6            ),
--( 2         , 3         , '2017-06-25' , 1            ),
--( 3         , 1         , '2016-03-02' , 0            ),
--( 3         , 4         , '2018-07-03' , 5            )

------------------------------------------------------------------
------GamePlayAnalysis 1-------

SELECT player_id, min(event_date) AS first_login	
	FROM GamePlayAnalysis
	GROUP  BY player_id

------GamePlayAnalysis 11-------

SELECT player_id , device_id
FROM
	(SELECT player_id ,device_id, ROW_NUMBER() OVER (PARTITION BY PLAYER_ID ORDER BY EVENT_DATE ASC) AS RN 
	FROM GamePlayAnalysis) B 
	WHERE RN = 1

	----USING  jOIN----

SELECT A.player_id,	A.device_id
	FROM GamePlayAnalysis A
	INNER JOIN (
	SELECT player_id, min(event_date) AS first_login	
	FROM GamePlayAnalysis
	GROUP BY player_id) AS B ON A.player_id = B.player_id AND B.first_login = A.event_date


------GamePlayAnalysis 111-------
DROP TABLE GamePlayAnalysis_4
CREATE TABLE GamePlayAnalysis_4(
player_id   int,
device_id INT,
event_date     DATE,
games_played      int   
)
INSERT INTO GamePlayAnalysis_4
( player_id , device_id , event_date , games_played )
VALUES 
( 1         , 2         , '2016-03-01' , 5            ),
( 1         , 2         , '2016-03-02' , 6            ),
( 2         , 3         , '2017-06-25' , 1            ),
( 3         , 1         , '2016-03-02' , 0            ),
( 3         , 4         , '2018-07-03' , 5            )

SELECT	 player_id
		,event_date
		,SUM(games_played) OVER (PARTITION BY player_id ORDER BY event_date ASC) AS games_played_so_far
	FROM GamePlayAnalysis_3
	
-------USING JOIN--------------
SELECT a.player_id 
		,a.event_date 
		,SUM(b.games_played) as games_played_so_far 
		FROM GamePlayAnalysis_3 a
		INNER JOIN GamePlayAnalysis_3 b
		ON a.event_date>=b.event_date and a.player_id=b.player_id
		GROUP BY a.player_id, a.event_date


------GamePlayAnalysis 1V------


;WITH CTE AS
(
SELECT player_id
	FROM(
	SELECT player_id,
	MIN(event_date) OVER(PARTITION BY player_id) AS event_date,
	LEAD(event_date, 1) OVER(PARTITION BY player_id ORDER BY event_date) AS lead_date
	FROM GamePlayAnalysis_4) B
	WHERE event_date = DATEADD(DAY,-1, lead_date)
)
SELECT ROUND(COUNT(DISTINCT player_id)*1.0/(SELECT COUNT(DISTINCT player_id) FROM GamePlayAnalysis_4) *1.0, 2) as fraction
FROM CTE




------GamePlayAnalysis V------
CREATE TABLE GamePlayAnalysis_5(
player_id   int,
device_id INT,
event_date     DATE,
games_played      int   
)
INSERT INTO GamePlayAnalysis_5
( player_id , device_id , event_date , games_played )
VALUES 
( 1         , 2         , '2016-03-01' , 5            ),
( 1         , 2         , '2016-03-02' , 6            ),
( 2         , 3         , '2017-06-25' , 1            ),
( 3         , 1         , '2016-03-01' , 0            ),
( 3         , 4         , '2018-07-03' , 5            )


-------------------------------------------------------------

SELECT *		
	FROM GamePlayAnalysis_5 


SELECT install_dt, COUNT(DISTINCT player_id) installs,
ROUND(SUM(Day1)/COUNT(DISTINCT player_id),2) Day1_retention
	FROM
		( SELECT DISTINCT player_id,MIN(event_date) OVER(PARTITION BY player_id) install_dt
		,(CASE WHEN DATEDIFF(DAY,MIN(event_date) OVER(PARTITION BY player_id),event_date) = 1 THEN 1.0 ELSE 0 END) Day1
			FROM GamePlayAnalysis_5 ) T
			GROUP BY install_dt