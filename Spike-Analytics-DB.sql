CREATE DATABASE Operation_Analytics;

USE Operation_Analytics;

/*Table-1*/
CREATE TABLE table_1(
	job_id INT  NOT NULL,
    actor_id INT  NOT NULL,
	event VARCHAR(100) NOT NULL,
    language VARCHAR(255) NOT NULL,
    time_spent INT NOT NULL,
    Org VARCHAR(30) NOT NULL,
	ds DATE
);
Select * from table_1;

INSERT INTO table_1 (job_id,actor_id,event,language,time_spent,Org,ds) VALUES 
(21, 1001,'Skip','English',15,'A','2020-11-30'),
(22, 1006,'Transfer','Arabic',25,'B','2020-11-30'),
(23, 1003,'Decision','Persian',20,'C','2020-11-29'),
(23, 1005,'Transfer','Persian',22,'D','2020-11-28'),
(25, 1002,'Decision','Hindi',11,'B','2020-11-28'),
(11, 1007,'Decision','French',104,'D','2020-11-27'),
(23, 1004,'Skip','Persian',56,'A','2020-11-26'),
(20, 1003,'Transfer','Italian',45,'C','2020-11-25');




-- 1st question
SELECT job_id,count(*),ds, COUNT(*)/24 AS Number_Hrs
  FROM table_1
   WHERE ds BETWEEN '2020-11-01' AND '2020-12-01' 
 group by job_id;







-- 2nd question
SELECT job_id,ds,
  AVG(time_spent) OVER (
    ORDER BY ds
    ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
  ) MovingAveragesevenDay
FROM table_1;



-- 3rd question
select ds,job_id,language,count(language), count(*) * 100.0 / sum(count(*))  over()  percentage_share
from table_1
Where ds BETWEEN '2020-11-01' AND '2020-12-01' 
group by job_id;



-- 4th question
SELECT job_id,actor_id,count(*)
FROM table_1
GROUP BY job_id
HAVING COUNT(*) >1  ;





select *
       from table_1
       group by job_id
       having count(job_id)>1;
