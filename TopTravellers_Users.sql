--------------TOP TRAVELLERS----------
CREATE TABLE TopTravellers_Users(
[id]   INT,
[name] VARCHAR(20),
)
INSERT INTO TopTravellers_Users
( id , name )
VALUES
( 1    , 'Alice'     ),
( 2    , 'Bob'       ),
( 3    , 'Alex'      ),
( 4    , 'Donald'    ),
( 7    , 'Lee'       ),
( 13   , 'Jonathan'  ),
( 19   , 'Elvis'     )


CREATE TABLE TopTravellers_Rides(
[id]   INT,
[user_id] INT,
[distance] INT
)
INSERT INTO TopTravellers_Rides
( id   , user_id , distance )
VALUES
( 1    , 1       , 120      ),
( 2    , 2       , 317      ),
( 3    , 3       , 222      ),
( 4    , 7       , 100      ),
( 5    , 13      , 312      ),
( 6    , 19      , 50       ),
( 7    , 7       , 120      ),
( 8    , 19      , 400      ),
( 9    , 7       , 230      )
--------------------------------------------

SELECT name, ISNULL(SUM(distance),0) AS travelled_distance
	FROM TopTravellers_Users U
	LEFT JOIN TopTravellers_Rides R ON U.id = R.user_id
	GROUP BY name
	ORDER BY travelled_distance DESC, name ASC

-------USING CASE-----------
SELECT
  name, 
  SUM(CASE WHEN distance IS NOT NULL THEN distance ELSE  0 END) AS travelled_distance
FROM
  TopTravellers_Users u
LEFT JOIN TopTravellers_Rides r ON u.id = r.user_id
GROUP BY name
ORDER BY travelled_distance desc, name asc


