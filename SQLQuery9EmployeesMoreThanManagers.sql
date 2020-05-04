

CREATE TABLE EmployeesMoreThanManagers(
[id]   INT,
[Name] VARCHAR(20),
[Salary] VARCHAR(20),
[ManagerId] INT,
)
INSERT INTO EmployeesMoreThanManagers
( Id , Name  , Salary , ManagerId )
VALUES
( 1  , 'Joe'   , 70000  , 3         ),
( 2  , 'Henry' , 80000  , 4         ),
( 3  , 'Sam'   , 60000  , NULL      ),
( 4  , 'Max'   , 90000  , NULL      )

-------------------------------------------------------------
SELECT B.Name AS Employee
	FROM EmployeesMoreThanManagers A
	JOIN EmployeesMoreThanManagers B ON A.id = B.ManagerId AND B.Salary> A.Salary
