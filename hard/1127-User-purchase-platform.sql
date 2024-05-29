/*
1127 User purchase platform.sql
-- Table: Spending
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| user_id     | int     |
| spend_date  | date    |
| platform    | enum    |
| amount      | int     |
+-------------+---------+
The table logs the spendings history of users that make purchases from an online shopping website which has a desktop and a mobile application.
(user_id, spend_date, platform) is the primary key of this table.
The platform column is an ENUM type of ('desktop', 'mobile').
Write an SQL query to find the total number of users and the total amount spent using mobile only, desktop only and both mobile and desktop together for each date.
The query result format is in the following example:
Spending table:
+---------+------------+----------+--------+
| user_id | spend_date | platform | amount |
+---------+------------+----------+--------+
| 1       | 2019-07-01 | mobile   | 100    |
| 1       | 2019-07-01 | desktop  | 100    |
| 2       | 2019-07-01 | mobile   | 100    |
| 2       | 2019-07-02 | mobile   | 100    |
| 3       | 2019-07-01 | desktop  | 100    |
| 3       | 2019-07-02 | desktop  | 100    |
+---------+------------+----------+--------+
Result table:
+------------+----------+--------------+-------------+
| spend_date | platform | total_amount | total_users |
+------------+----------+--------------+-------------+
| 2019-07-01 | desktop  | 100          | 1           |
| 2019-07-01 | mobile   | 100          | 1           |
| 2019-07-01 | both     | 200          | 1           |
| 2019-07-02 | desktop  | 100          | 1           |
| 2019-07-02 | mobile   | 100          | 1           |
| 2019-07-02 | both     | 0            | 0           |
+------------+----------+--------------+-------------+
On 2019-07-01, user 1 purchased using both desktop and mobile, user 2 purchased using mobile only and user 3 purchased using desktop only.
On 2019-07-02, user 2 purchased using mobile only, user 3 purchased using desktop only and no one purchased using both platforms.
*/

-- solution

create table spending (
user_id       int,   
spend_date   date,
platform     varchar,
amount       int 
); 

insert into spending  values 
(1 , '2019-07-01' , 'mobile ' ,100),
(1 , '2019-07-01' , 'desktop' ,100),
(2 , '2019-07-01' , 'mobile ' ,100),
(2 , '2019-07-02' , 'mobile ' ,100),
(3 , '2019-07-01' , 'desktop' ,100),
(3 , '2019-07-02' , 'desktop' ,100);

with cte
    as (select user_id, spend_date,
            max(platform) as platform, sum(amount) as amount
        from spending
        group by user_id, spend_date
        having count(distinct platform) = 1
        union
        select user_id, spend_date,
            'both' as platform, sum(amount) as amount
        from spending
        group by user_id,spend_date
        having count(platform) = 2
        union
        select null as user_id, spend_date,
            'both' as platform, 0 as amount
        from spending
        group by spend_date
        )

select spend_date, platform,
    sum(amount)    as total_amount,
    count(user_id) as total_users
from   cte
group by spend_date, platform
order by spend_date, platform desc;