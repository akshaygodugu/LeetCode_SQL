

CREATE TABLE ArticleViews(
[article_id]   INT,
[author_id]   INT,
[viewer_id]   INT,
[view_date] DATE,
) 
INSERT INTO ArticleViews
( article_id , author_id , viewer_id , view_date  )
VALUES
( 1          , 3         , 5         , '2019-08-01'),
( 1          , 3         , 6         , '2019-08-02'),
( 2          , 7         , 7         , '2019-08-01'),
( 2          , 7         , 6         , '2019-08-02'),
( 4          , 7         , 1         , '2019-07-22'),
( 3          , 4         , 4         , '2019-07-21'),
( 3          , 4         , 4         , '2019-07-21')

------------ARTICLE VIIEWS 1--------------------------


SELECT DISTINCT author_id AS id	
	FROM ArticleViews
	WHERE author_id = viewer_id
	ORDER BY author_id ASC



------------ARTICLE VIEWS 11-------------------------

CREATE TABLE ArticleViews2(
[article_id]   INT,
[author_id]   INT,
[viewer_id]   INT,
[view_date] DATE,
) 
INSERT INTO ArticleViews2
( article_id , author_id , viewer_id , view_date  )
VALUES
( 1          , 3         , 5         , '2019-08-01'),
( 3          , 4         , 5         , '2019-08-01'),
( 1          , 3         , 6         , '2019-08-02'),
( 2          , 7         , 7         , '2019-08-01'),
( 2          , 7         , 6         , '2019-08-02'),
( 4          , 7         , 1         , '2019-07-22'),
( 3          , 4         , 4         , '2019-07-21'),
( 3          , 4         , 4         , '2019-07-21')

------WRONG IN TERMINAL BUT CORRECT OUTPUT------

SELECT viewer_id AS id
FROM(
	SELECT *	
		FROM ArticleViews2
		WHERE author_id != viewer_id) AS A 
		GROUP BY view_date, viewer_id
		HAVING COUNT(viewer_id) >1
		ORDER BY viewer_id ASC

------CORRECT ANSWER-----------
WITH CTE AS 
(
SELECT viewer_id, view_date	
	FROM ArticleViews2
	GROUP BY view_date,viewer_id
	HAVING COUNT(DISTINCT article_id) > 1 
)
SELECT DISTINCT viewer_id  AS id
	FROM CTE
	ORDER BY viewer_id
