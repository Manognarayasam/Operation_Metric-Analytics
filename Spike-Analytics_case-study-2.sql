CREATE DATABASE Operation_Analytics_casestudy_2;

USE Operation_Analytics_casestudy_2;

select * from users LIMIT 5;
select * from email_events LIMIT 5;
select * from events LIMIT 5;
select * from events ;

-- 1st question
SELECT WEEK(activated_at) AS WEEK_Number,
            COUNT(user_id) AS Weekly_Engagemnet
         FROM users
         GROUP BY WEEK(activated_at);
         
  

SELECT WEEK(u.activated_at) AS Account_acctivated,EXTRACT(week FROM e.occurred_at) as event_week_occurance,
            COUNT(u.user_id) AS Weekly_Engagemnet
         FROM users u
         inner join events e
         on u.user_id=e.user_id
         GROUP BY EXTRACT(week FROM e.occurred_at);
         
         
  
  
 SELECT  EXTRACT(week FROM occurred_at) as week,
  count(distinct(event_name)) as event_count
FROM events
GROUP BY  week;

         
         
         

-- 2nd question
SELECT
  EXTRACT(month from activated_at) as month,
  count(DISTINCT user_id) as num_users
FROM users
GROUP BY month;



-- 3rd question
SELECT u1.user_id, week(u1.created_at) AS login_week,min(week(u1.activated_at)) AS first_week
FROM users AS u1,users AS u2
where u1.user_id=u2.user_id
GROUP BY week(u1.activated_at);
        
        
 -- 4th question
SELECT e.device,EXTRACT(week FROM e.occurred_at) as occurance,WEEK(u.activated_at) AS Account_acctivated,
            COUNT(e.event_name) AS Weekly_Engagemnet
         FROM users u
         inner join events e
         on u.user_id=e.user_id
         GROUP BY EXTRACT(week FROM e.occurred_at),e.device;
         
         
         
         
         
         
 -- 5th question    
  select count(action) As monthly_email_engagement,
 extract(month FROM occurred_at) As month_number from email_events group by month_number;
