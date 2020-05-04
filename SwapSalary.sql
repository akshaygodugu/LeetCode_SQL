
CREATE TABLE SwapSalary(
[id]   INT,
[Name] VARCHAR(20),
[sex] VARCHAR(20),
[salary] INT,
)
INSERT INTO SwapSalary
( id , name , sex , salary )
VALUES
( 1  , 'A'    , 'm'   , 2500   ),
( 2  , 'B'    , 'f'   , 1500   ),
( 3  , 'C'    , 'm'   , 5500   ),
( 4  , 'D'    , 'f'   , 500    )


-----------------------------------------------------------------

SELECT   ID
		,NAME
		,CASE WHEN SEX = 'M' THEN 'F'
         ELSE 'M' END  AS SEX
		,salary 
	FROM SwapSalary

---------------------------------------------------
--USING UPDATE
UPDATE SwapSalary
    SET SEX = CASE WHEN SEX = 'm' THEN 'f'
              ELSE 'm' END ;