

CREATE TABLE ReplaceEmployeeUniqueID(
[id]   INT,
[name] VARCHAR(20),
)
INSERT INTO ReplaceEmployeeUniqueID
(   id    , [name]   )
VALUES
( 1  , 'Alice'    ),
( 7  , 'Bob'      ),
( 11 , 'Meir'     ),
( 90 , 'Winston'  ),
( 3  , 'Jonathan' )



CREATE TABLE EmployeeUniqueID(
[id]   INT,
[unique_id] INT,
)
INSERT INTO EmployeeUniqueID
(   [id]    , [unique_id]   )
VALUES
( 3  ,  1   ),
( 11  , 2    ),
( 90 , 3 )
---------------------------------------------------------------------------


SELECT unique_id, name
	FROM ReplaceEmployeeUniqueID r
	LEFT JOIN EmployeeUniqueID E ON R.id = E.id

SELECT * 
	FROM EmployeeUniqueID


