/*
0618 Students report by geography.sql
A U.S graduate school has students from Asia, Europe and America. The students' location information are stored in table student as below.
+--------+-----------+
| name   | continent |
+--------+-----------+
| Jane   | America   |
| Pascal | Europe    |
| Xi     | Asia      |
| Jack   | America   |
+--------+-----------+
Pivot the continent column in this table so that each name is sorted alphabetically and displayed underneath its corresponding continent. 
The output headers should be America, Asia and Europe respectively. 
It is guaranteed that the student number from America is no less than either Asia or Europe.
For the sample input, the output is: 
+---------+------+--------+
| America | Asia | Europe |
+---------+------+--------+
| Jack    | Xi   | Pascal |
| Jane    | null | null   |
+---------+------+--------+
*/

-- solution
create table student(
	name varchar(55),
	continent varchar(55)
);

insert into student values
('Jane  ' , 'America'),
('Pascal' , 'Europe '),
('Xi    ' , 'Asia   '),
('Jack  ' , 'America');

select min(case when continent = 'America' then name end) as America,
min(case when continent = 'Asia' then name end) as Asia,
min(case when continent = 'Europe' then name end) as Europe
from 
	(select *, row_number() over(partition by continent order by name) as rn
	from student) a
group by rn ;
