


CREATE TABLE ActorDirector(
[actor_id]   INT,
[director_id]  INT,
[timestamp] INT,
) 
INSERT INTO ActorDirector
( [actor_id]   , [director_id]   , [timestamp])
VALUES
( 1           , 1           , 0  ),
( 1           , 1           , 1  ),
( 1           , 1           , 2  ),
( 1           , 2           , 3  ),
( 1           , 2           , 4  ),
( 2           , 1           , 5  ),
( 2           , 1           , 6  )   


SELECT actor_id, director_id
	FROM ActorDirector
	WHERE actor_id = director_id
	GROUP BY actor_id, director_id
	HAVING COUNT(actor_id) >= 3

-------------- SUB QUERY-----------------
SELECT DISTINCT actor_id, director_id 
	FROM(
		SELECT actor_id, director_id, COUNT(*) OVER (PARTITION BY actor_id, director_id) AS co
		FROM actorDirector) AS summary 
	WHERE summary.co >= 3