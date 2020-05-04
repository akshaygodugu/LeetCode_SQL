CREATE TABLE DuplicateEmail(
[id]   INT,
[Email] VARCHAR(20),
)

INSERT INTO DuplicateEmail
( Id , Email   )
VALUES
( 1  , 'a@b.com' ),
( 2  , 'c@d.com' ),
( 3  , 'a@b.com' )
-----------------------------------
SELECT  EMAIL
	FROM DuplicateEmail
	GROUP BY EMAIL
	HAVING COUNT(EMAIL) > 1