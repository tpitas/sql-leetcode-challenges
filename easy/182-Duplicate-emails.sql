/*
Q182-Duplicate Emails
Write a SQL query to find all duplicate emails in a table named Person.
+----+---------+
| Id | Email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
For example, your query should return the following for the above table:
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
*/

-- create table person
create table person
(
id int,
email text
);

-- insert records into the person table
insert into person (id, email) values 
(1, 'a@b.com'),
(2, 'c@d.com'),
(3, 'a@b.com');

-- solution
select email
from
(select email, count(email)
from person
group by email
having count(email) > 1 
) a;