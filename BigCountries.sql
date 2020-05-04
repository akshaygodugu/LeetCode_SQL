
CREATE TABLE BigCountries(
[Name] VARCHAR(20),
[continent] VARCHAR(20),
[area] INT,
[population]   INT,
[gdp]   INT,
)
INSERT INTO BigCountries(
name, continent  , area       , population   , gdp           )
VALUES
( 'Afghanistan'     , 'Asia'       , 652230     , 25500100     , 20343000      ),
( 'Albania'         , 'Europe'     , 28748      , 2831741      , 12960000      ),
( 'Algeria'         , 'Africa'     , 2381741    , 37100000     , 188681000     ),
( 'Andorra'         , 'Europe'     , 468        , 78115        , 3712000       ),
( 'Angola'          , 'Africa'     , 1246700    , 20609294     , 100990000     )


----------------------------------------------------------------------------------
SELECT NAME, population, area 
	FROM BigCountries
	WHERE AREA > 3000000 OR population > 25000000






