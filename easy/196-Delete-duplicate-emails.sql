/*
Q196-Delete Duplicate Emails
Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.
+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Id is the primary key column for this table.
For example, after running your query, the above Person table should have the following rows:
+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
Note:
Your output is the whole Person table after executing your sql. Use delete statement.
*/

-- create table person
create table person
(
    id int,
    email varchar(55)
);

-- insert records into person
insert into person (id, email) values
(1, 'john@example.com'),
(2, 'bob@example.com '),
(3, 'john@example.com');

-- solution
with cte as
(
    select *,
    row_number() over(partition by email order by id) rn
    from person
)
delete from person
where id in (select cte.id from cte where cte.rn > 1);

-- verify soltution
select * from person;