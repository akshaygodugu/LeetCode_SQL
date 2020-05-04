
--CREATE A SEESION BAR CHART -----

CREATE TABLE CreateSessionBarChart
(session_id INT, 
duration INT
)-- Insert rows into table 'CreateSessionBarChart' in schema '[dbo]'
INSERT INTO [dbo].[CreateSessionBarChart]
( -- Columns to insert data into
 [session_id], [duration]
)
VALUES
( 1           , 30            ),
( 2           , 199           ),
( 3           , 299           ),
( 4           , 580           ),
( 5           , 1000          )

-----------------------------------------------------------
SELECT *    
    FROM CreateSessionBarChart


SELECT B.bin, ISNULL(COUNT(s.session_id),0) AS total 
    FROM
        (SELECT
            CASE WHEN duration BETWEEN 0 AND 300 THEN '[0-5>'
                 WHEN duration BETWEEN 300 AND 600 THEN '[5-10>'
                 WHEN duration BETWEEN 600 AND 900 THEN '[10-15>'
                 ELSE '15 OR MORE'
                 END AS BIN
            ,session_id
            FROM CreateSessionBarChart) S
            RIGHT JOIN 
                        (SELECT '[0-5>' AS bin
                        UNION ALL
                        SELECT '[5-10>' AS bin
                        UNION ALL
                        SELECT '[10-15>' AS bin
                        UNION ALL
                        SELECT '15 or more' AS bin) B
                        ON B.bin=S.bin
    GROUP BY B.bin



-------------FIRST APPROACH WRONG METHOD-----------------------------

SELECT 
        CASE WHEN duration BETWEEN 0 AND 300 THEN '[0-5>'
             WHEN duration BETWEEN 300 AND 600 THEN '[5-10>'
             WHEN duration BETWEEN 600 AND 900 THEN '[10-15>'
             WHEN duration >= 900 THEN '15 OR MORE'
        END AS BIN
        ,COUNT(session_id) AS total
    FROM CreateSessionBarChart
    GROUP BY
            CASE WHEN duration BETWEEN 0 AND 300 THEN '[0-5>'
             WHEN duration BETWEEN 300 AND 600 THEN '[5-10>'
             WHEN duration BETWEEN 600 AND 900 THEN '[10-15>'
             WHEN duration >= 900 THEN '15 OR MORE'
        END


