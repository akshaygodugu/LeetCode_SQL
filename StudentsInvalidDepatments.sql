DROP TABLE StudentsInvalidDepatments
CREATE TABLE StudentsInvalidDepatments(
[id]   INT,
[name] VARCHAR(30),
)
INSERT INTO StudentsInvalidDepatments
(   [id]  , [name]   )
VALUES
( 1    , 'Electrical Engineering'   ),
( 7    , 'Computer Engineering'     ),
( 13   , 'Bussiness Administration' )

CREATE TABLE StudentsInvalidStudents(
[id]   INT,
[name] VARCHAR(20),
[department_id]   INT,
)
INSERT INTO StudentsInvalidStudents
(   [id]  , [name],[department_id]   )
VALUES
( 23   , 'Alice'    , 1    ),         
( 1    , 'Bob'      , 7    ),         
( 5    , 'Jennifer' , 13   ),         
( 2    , 'John'     , 14   ),         
( 4    , 'Jasmine'  , 77   ),         
( 3    , 'Steve'    , 74   ),         
( 6    , 'Luis'     , 1    ),         
( 8    , 'Jonathan' , 7    ),         
( 7    , 'Daiana'   , 33   ),         
( 11   , 'Madelynn' , 1    )         
----------------------------------------------------------------------------------------


SELECT S.id, S.name
	FROM StudentsInvalidDepatments D
	RIGHT JOIN StudentsInvalidStudents S ON D.ID = S.department_id
	WHERE S.department_id NOT IN ( SELECT ID FROM StudentsInvalidDepatments)



										