--NETFLIX PROJECT
DROP TABLE IF EXISTS Netflix;
CREATE TABLE Netflix
(
  show_id VARCHAR(6),	
  type VARCHAR(10),
  title	VARCHAR(150),
  director VARCHAR(208),	
  casts	VARCHAR(1000),
  country VARCHAR(150),	
  date_added VARCHAR(50),	
  release_year INT,
  rating VARCHAR(10),	
  duration VARCHAR(15),
  listed_in	VARCHAR(100),
  description VARCHAR(250)
);
SELECT * FROM Netflix;

SELECT 
COUNT(*) AS total_content
FROM Netflix;

SELECT 
DISTINCT Type
FROM Netflix;

SELECT * FROM Netflix;

-- 1. count the number of movies vs TV shows
SELECT * FROM Netflix;

SELECT Type, 
 COUNT(*) AS Total_content
 FROM Netflix
 GROUP BY Type

 -- 2. find the most common rating for movies and tv shows
 SELECT * FROM Netflix;

SELECT Type,
 rating
 FROM
 (
   SELECT Type,
   rating,
   COUNT(*),
   rank() OVER(PARTITION BY Type ORDER BY COUNT(*) DESC) AS ranking
   FROM Netflix
   GROUP BY 1,2
 ) AS t1
 WHERE ranking=1

 --3. list all movies released in a specific year(2020)
SELECT * FROM Netflix;
 SELECT 
 *
 FROM Netflix where Type='Movie'AND release_year= 2020

 --4. find the top 5 countries with the most content on netflix
SELECT * FROM Netflix;
SELECT 
 UNNEST(STRING_TO_ARRAY(Country,',')) as new_country,
 COUNT(show_id) AS Total_content
 FROM Netflix
 GROUP BY country
 ORDER BY 2 DESC
 LIMIT 5

 --5.identify the longest movie

 SELECT * FROM Netflix;

select * from 
 (select distinct title as movie,
  split_part(duration,' ',1):: numeric as duration 
  from netflix
  where type ='Movie') as subquery
where duration = (select max(split_part(duration,' ',1):: numeric ) from netflix)

select *
 from netflix
 where type='Movie' and duration= (select max(duration) from Netflix)

 --6. find all movies/tv shows directed by rajiv chilaka
SELECT * FROM Netflix;
 SELECT 
 *
 FROM Netflix where director like '%Rajiv Chilaka%'

--7.list all tv shows with more than 5 seasons

SELECT * FROM Netflix;

SELECT * 
FROM Netflix
where type='TV Show' 
AND SPLIT_PART(duration,' ',1)::numeric > 5

--8.count the number of content items in each genre

SELECT * FROM Netflix;

SELECT 
 UNNEST(STRING_TO_ARRAY(listed_in,',')) as genre,
 COUNT(show_id) AS Total_content
 FROM Netflix
 GROUP BY 1

--9. find each year and average numbers of content release in India on netflix
-- return by top 5 year with average content release

SELECT * FROM Netflix;

SELECT 
 EXTRACT(YEAR FROM TO_DATE(date_added,'Month DD,YYYY')) AS Year,
 COUNT(*) as yearly_content,
 ROUND(
 COUNT(*)::numeric/(SELECT COUNT(*) FROM Netflix WHERE Country='india')::numeric * 100,2) as avg_content_per_year
 FROM Netflix
 WHERE Country='india'
 GROUP BY 1

 --10.list all movies that are documentaries

 SELECT * FROM Netflix;

 SELECT * FROM Netflix
 where listed_in ilike '%documentaries%'

 --11. find all content without A director

 SELECT * FROM Netflix;
 
 SELECT * FROM Netflix where director is null

 --12. find how many movies did salman khan appeared in last 10 years

 SELECT * FROM Netflix;

SELECT * FROM Netflix
WHERE casts ILIKE '%salman khan%'
and release_year > EXTRACT(YEAR FROM CURRENT_DATE)-10

--13.find top 10 actors appeared in the highest number of movies produced in india

SELECT * FROM Netflix;

--NETFLIX PROJECT
DROP TABLE IF EXISTS Netflix;
CREATE TABLE Netflix
(
  show_id VARCHAR(6),	
  type VARCHAR(10),
  title	VARCHAR(150),
  director VARCHAR(208),	
  casts	VARCHAR(1000),
  country VARCHAR(150),	
  date_added VARCHAR(50),	
  release_year INT,
  rating VARCHAR(10),	
  duration VARCHAR(15),
  listed_in	VARCHAR(100),
  description VARCHAR(250)
);
SELECT * FROM Netflix;

SELECT 
COUNT(*) AS total_content
FROM Netflix;

SELECT 
DISTINCT Type
FROM Netflix;

SELECT * FROM Netflix;

-- 1. count the number of movies vs TV shows
SELECT * FROM Netflix;

SELECT Type, 
 COUNT(*) AS Total_content
 FROM Netflix
 GROUP BY Type

 -- 2. find the most common rating for movies and tv shows
 SELECT * FROM Netflix;

SELECT Type,
 rating
 FROM
 (
   SELECT Type,
   rating,
   COUNT(*),
   rank() OVER(PARTITION BY Type ORDER BY COUNT(*) DESC) AS ranking
   FROM Netflix
   GROUP BY 1,2
 ) AS t1
 WHERE ranking=1

 --3. list all movies released in a specific year(2020)
SELECT * FROM Netflix;
 SELECT 
 *
 FROM Netflix where Type='Movie'AND release_year= 2020

 --4. find the top 5 countries with the most content on netflix
SELECT * FROM Netflix;
SELECT 
 UNNEST(STRING_TO_ARRAY(Country,',')) as new_country,
 COUNT(show_id) AS Total_content
 FROM Netflix
 GROUP BY country
 ORDER BY 2 DESC
 LIMIT 5

 --5.identify the longest movie

 SELECT * FROM Netflix;

select * from 
 (select distinct title as movie,
  split_part(duration,' ',1):: numeric as duration 
  from netflix
  where type ='Movie') as subquery
where duration = (select max(split_part(duration,' ',1):: numeric ) from netflix)

select *
 from netflix
 where type='Movie' and duration= (select max(duration) from Netflix)

 --6. find all movies/tv shows directed by rajiv chilaka
SELECT * FROM Netflix;
 SELECT 
 *
 FROM Netflix where director like '%Rajiv Chilaka%'

--7.list all tv shows with more than 5 seasons

SELECT * FROM Netflix;

SELECT * 
FROM Netflix
where type='TV Show' 
AND SPLIT_PART(duration,' ',1)::numeric > 5

--8.count the number of content items in each genre

SELECT * FROM Netflix;

SELECT 
 UNNEST(STRING_TO_ARRAY(listed_in,',')) as genre,
 COUNT(show_id) AS Total_content
 FROM Netflix
 GROUP BY 1

--9. find each year and average numbers of content release in India on netflix
-- return by top 5 year with average content release

SELECT * FROM Netflix;

SELECT 
 EXTRACT(YEAR FROM TO_DATE(date_added,'Month DD,YYYY')) AS Year,
 COUNT(*) as yearly_content,
 ROUND(
 COUNT(*)::numeric/(SELECT COUNT(*) FROM Netflix WHERE Country='india')::numeric * 100,2) as avg_content_per_year
 FROM Netflix
 WHERE Country='india'
 GROUP BY 1

 --10.list all movies that are documentaries

 SELECT * FROM Netflix;

 SELECT * FROM Netflix
 where listed_in ilike '%documentaries%'

 --11. find all content without A director

 SELECT * FROM Netflix;
 
 SELECT * FROM Netflix where director is null

 --12. find how many movies did salman khan appeared in last 10 years

 SELECT * FROM Netflix;

SELECT * FROM Netflix
WHERE casts ILIKE '%salman khan%'
and release_year > EXTRACT(YEAR FROM CURRENT_DATE)-10

--13.find top 10 actors appeared in the highest number of movies produced in india

SELECT * FROM Netflix;

--NETFLIX PROJECT
DROP TABLE IF EXISTS Netflix;
CREATE TABLE Netflix
(
  show_id VARCHAR(6),	
  type VARCHAR(10),
  title	VARCHAR(150),
  director VARCHAR(208),	
  casts	VARCHAR(1000),
  country VARCHAR(150),	
  date_added VARCHAR(50),	
  release_year INT,
  rating VARCHAR(10),	
  duration VARCHAR(15),
  listed_in	VARCHAR(100),
  description VARCHAR(250)
);
SELECT * FROM Netflix;

SELECT 
COUNT(*) AS total_content
FROM Netflix;

SELECT 
DISTINCT Type
FROM Netflix;

SELECT * FROM Netflix;

-- 1. count the number of movies vs TV shows
SELECT * FROM Netflix;

SELECT Type, 
 COUNT(*) AS Total_content
 FROM Netflix
 GROUP BY Type

 -- 2. find the most common rating for movies and tv shows
 SELECT * FROM Netflix;

SELECT Type,
 rating
 FROM
 (
   SELECT Type,
   rating,
   COUNT(*),
   rank() OVER(PARTITION BY Type ORDER BY COUNT(*) DESC) AS ranking
   FROM Netflix
   GROUP BY 1,2
 ) AS t1
 WHERE ranking=1

 --3. list all movies released in a specific year(2020)
SELECT * FROM Netflix;
 SELECT 
 *
 FROM Netflix where Type='Movie'AND release_year= 2020

 --4. find the top 5 countries with the most content on netflix
SELECT * FROM Netflix;
SELECT 
 UNNEST(STRING_TO_ARRAY(Country,',')) as new_country,
 COUNT(show_id) AS Total_content
 FROM Netflix
 GROUP BY country
 ORDER BY 2 DESC
 LIMIT 5

 --5.identify the longest movie

 SELECT * FROM Netflix;

select * from 
 (select distinct title as movie,
  split_part(duration,' ',1):: numeric as duration 
  from netflix
  where type ='Movie') as subquery
where duration = (select max(split_part(duration,' ',1):: numeric ) from netflix)

select *
 from netflix
 where type='Movie' and duration= (select max(duration) from Netflix)

 --6. find all movies/tv shows directed by rajiv chilaka
SELECT * FROM Netflix;
 SELECT 
 *
 FROM Netflix where director like '%Rajiv Chilaka%'

--7.list all tv shows with more than 5 seasons

SELECT * FROM Netflix;

SELECT * 
FROM Netflix
where type='TV Show' 
AND SPLIT_PART(duration,' ',1)::numeric > 5

--8.count the number of content items in each genre

SELECT * FROM Netflix;

SELECT 
 UNNEST(STRING_TO_ARRAY(listed_in,',')) as genre,
 COUNT(show_id) AS Total_content
 FROM Netflix
 GROUP BY 1

--9. find each year and average numbers of content release in India on netflix
-- return by top 5 year with average content release

SELECT * FROM Netflix;

SELECT 
 EXTRACT(YEAR FROM TO_DATE(date_added,'Month DD,YYYY')) AS Year,
 COUNT(*) as yearly_content,
 ROUND(
 COUNT(*)::numeric/(SELECT COUNT(*) FROM Netflix WHERE Country='india')::numeric * 100,2) as avg_content_per_year
 FROM Netflix
 WHERE Country='india'
 GROUP BY 1

 --10.list all movies that are documentaries

 SELECT * FROM Netflix;

 SELECT * FROM Netflix
 where listed_in ilike '%documentaries%'

 --11. find all content without A director

 SELECT * FROM Netflix;
 
 SELECT * FROM Netflix where director is null

 --12. find how many movies did salman khan appeared in last 10 years

 SELECT * FROM Netflix;

SELECT * FROM Netflix
WHERE casts ILIKE '%salman khan%'
and release_year > EXTRACT(YEAR FROM CURRENT_DATE)-10

--13.find top 10 actors appeared in the highest number of movies produced in india

SELECT * FROM Netflix;

SELECT 
UNNEST(STRING_TO_ARRAY(casts,',')) as actors,
COUNT(*) AS total_content
FROM Netflix
WHERE Country ilike '%india'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10

--14. categorize the content based on the presence of the keywords 'kill'and 'violence' in the description field.label content containing the keywords as 'bad' and all other content as good.count how many item fall into each category.

SELECT * FROM Netflix;

WITH new_table
AS
(
SELECT
*,
CASE 
WHEN description ILIKE '%kill%' OR
     description ILIKE '%violence%' THEN 'Bad'
else 'good'
END category
FROM Netflix
)
SELECT
category,count(*)
from new_table
GROUP BY 1