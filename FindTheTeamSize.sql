

CREATE TABLE FindTheTeamSize(
[employee_id]   INT,
[team_id] INT,
)
INSERT INTO FindTheTeamSize
(   [employee_id]    ,   [team_id] )
VALUES
(     1       ,     8      ),
(     2       ,     8      ),
(     3       ,     8      ),
(     4       ,     7      ),
(     5       ,     9      ),
(     6       ,     9      )
-------------------------------------------------------------------------


SELECT employee_id, team_size
	FROM FindTheTeamSize A
	JOIN (SELECT  team_id,COUNT([team_id]) AS team_size
	FROM FindTheTeamSize
	GROUP BY team_id) AS B ON A.team_id = B.team_id
	ORDER BY employee_id ASC

------USING WINDOW FUNCTION----------

SELECT  employee_id,COUNT(employee_id) OVER (PARTITION BY team_id)  AS team_size       --COUNT([team_id]) AS team_size
	FROM FindTheTeamSize
	ORDER BY employee_id ASC



	------WRONG IDEA-------

SELECT  employee_id,(SELECT COUNT(team_id) AS team_size FROM FindTheTeamSize GROUP BY team_id) AS team_id     --COUNT([team_id]) AS team_size
	FROM FindTheTeamSize
	GROUP BY team_id, employee_id

SELECT  employee_id,ROW_NUMBER() OVER (PARTITION BY team_id ORDER BY team_id)         --COUNT([team_id]) AS team_size
	FROM FindTheTeamSize
	GROUP BY team_id, employee_id
