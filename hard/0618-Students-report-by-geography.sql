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

