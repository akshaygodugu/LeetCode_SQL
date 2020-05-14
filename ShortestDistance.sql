CREATE TABLE ShortestDistance(
[x]   INT
)
INSERT INTO ShortestDistance
(   [x]   )
VALUES
( -1 ),
( 0 ),
( 2 )


SELECT * FROM ShortestDistance

SELECT MIN(ABS(A.x - B.x)) AS Shortest
	FROM ShortestDistance A, ShortestDistance B
	WHERE A.x != B.x 
