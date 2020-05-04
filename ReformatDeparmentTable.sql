DROP TABLE ReformatDeparmentTable
CREATE TABLE ReformatDeparmentTable(
ID INT,
REVENUE INT,
MONTH VARCHAR(20)
)

INSERT INTO ReformatDeparmentTable(
ID,
REVENUE,
[MONTH])
VALUES
( 1    , 8000    , 'Jan'   ),
( 2    , 9000    , 'Jan'   ),
( 3    , 10000   , 'Feb'   ),
( 1    , 7000    , 'Feb'   ),
( 1    , 6000    , 'Mar'   )

--------------------------------------------------------
--USING PIVOT 

SELECT * FROM
(
SELECT ID,REVENUE,CONCAT([MONTH], '_Revenue') AS [MONTH] 
	FROM ReformatDeparmentTable 

) AS SRC
PIVOT 
(
	MAX(REVENUE)
	FOR [MONTH] IN ([Jan_Revenue],[Feb_Revenue],[Mar_Revenue],[Apr_Revenue],[May_Revenue],[Jun_Revenue],[Jul_Revenue]
	,[Aug_Revenue],[Sep_Revenue],[Oct_Revenue],[Nov_Revenue],[Dec_Revenue])
) AS PVT



----------------------------------------------------------------
-- USING CASE STATEMENT  
select
	id
	,sum(case when [month] = 'Jan' then revenue else null end) as Jan_Revenue
	,sum(case when [month] = 'Feb' then revenue else null end) as Feb_Revenue
	,sum(case when [month] = 'Mar' then revenue else null end) as Mar_Revenue
	,sum(case when [month] = 'Apr' then revenue else null end) as Apr_Revenue
	,sum(case when [month] = 'May' then revenue else null end) as May_Revenue
	,sum(case when [month] = 'Jun' then revenue else null end) as Jun_Revenue
	,sum(case when [month] = 'Jul' then revenue else null end) as Jul_Revenue
	,sum(case when [month] = 'Aug' then revenue else null end) as Aug_Revenue
	,sum(case when [month] = 'Sep' then revenue else null end) as Sep_Revenue
	,sum(case when [month] = 'Oct' then revenue else null end) as Oct_Revenue
	,sum(case when [month] = 'Nov' then revenue else null end) as Nov_Revenue
	,sum(case when [month] = 'Dec' then revenue else null end) as Dec_Revenue
from
	ReformatDeparmentTable
group by
	id;

