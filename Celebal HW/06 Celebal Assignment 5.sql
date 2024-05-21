-- 21/07/2023
-- Ujjawal Kuamar
-- Techno Main Salt Lake
-- Assignment 5

----Questions---------------------------------------------------------------------------
-- Solve 3 easy and 2 medium questions of JOINS from HackerRank 
------------------------------------------------------------------------------------------
--		EASY QUESTIONS

-- QUESTION 
Given the CITY and COUNTRY tables, query the sum of the populations 
of all cities where the CONTINENT is 'Asia'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

-- QUERY
SELECT SUM(c.POPULATION) FROM CITY AS c
INNER JOIN COUNTRY AS cn ON c.COUNTRYCODE = cn.CODE
WHERE cn.CONTINENT = 'Asia';


-- QUESTION 
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

-- QUERY
SELECT c.NAME FROM CITY AS c INNER JOIN COUNTRY AS cn ON c.COUNTRYCODE = cn.CODE 
WHERE cn.CONTINENT = 'Africa'; 


-- QUESTION 
Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent)
and their respective average city populations (CITY.Population) rounded down to the nearest integer.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

-- QUERY
SELECT cn.CONTINENT, ROUND(AVG(c.POPULATION),0) FROM CITY AS c
INNER JOIN COUNTRY AS cn ON c.COUNTRYCODE = cn.CODE
GROUP BY cn.CONTINENT;


--------------------------------------------------------------------------------------------------------

--			MEDIUM QUESTIONS

-- QUESTION 
Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. 
Ketty does not want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade
i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them,
order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and 
list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order 
those particular students by their marks in ascending order.

-- QUERY
SELECT s.Name, s.Marks, gmax.Grade FROM Students AS s INNER JOIN Grades AS gmax
ON s.Marks BETWEEN gmax.Min_Mark AND gmax.Max_Mark WHERE gmax.Grade >= 8
ORDER BY s.Marks DESC, gmax.Grade DESC,s.Name ASC 
UNION
SELECT NULL AS Name, s.Marks, gmin.Grade FROM Students AS s
INNER JOIN Grades AS gmin ON s.Marks BETWEEN gmin.Min_Mark AND gmin.Max_Mark WHERE gmin.Grade < 8
ORDER BY gmin.Grade DESC,s.Marks ASC;


-- QUESTION 
-- You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.
-- Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES of those students 
-- who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. 
-- If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically.
-- Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student 
-- with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.
-- Write a query to help Eve.

-- Query
with T (Name, Grade, Marks) as
(
    select Students.Name, Grades.Grade, Students.Marks 
     from Students
     join Grades
     on Students.Marks>=Grades.Min_mark and Students.Marks<=Grades.Max_mark
),
T1 as (
    select Name, Grade, Marks, row_number() over (order by Grade desc, Name) as r1
    from T
    where Grade >= 8 and Grade <= 10
),
T2 as (
    select NULL as Name, Grade, Marks, 100 + row_number() over (order by grade desc, Marks) as r1
    from T
    where Grade < 8
)
select Name, Grade, Marks 
from (
    select * from T1
    union all 
    select * from t2
) as X
order by X.r1;