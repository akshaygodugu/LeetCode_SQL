

CREATE TABLE NotBoringMovies(
[id]   INT,
[movie] VARCHAR(20),
[description] VARCHAR(20),
[rating] INT,
)
INSERT INTO NotBoringMovies
(   id    , movie     ,  description ,  rating   )
VALUES
(   1     , 'War'       ,   'great 3D'   ,   8.9     ),
(   2     , 'Science'   ,   'fiction'    ,   8.5     ),
(   3     , 'irish'     ,   'boring'     ,   6.2     ),
(   4     , 'Ice song'  ,   'Fantacy'    ,   8.6     ),
(   5     , 'House card',   'Interesting',   9.1     )
------------------------------------------------------------------------------



SELECT * 
	FROM NotBoringMovies
	WHERE ID % 2 <> 0 AND description != 'boring' 
	ORDER BY rating DESC

