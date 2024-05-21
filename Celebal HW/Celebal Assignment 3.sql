-- 30/06/2023
-- Ujjawal Kuamar
-- Techno Main Salt Lake
-- Assignment 3

----Questions-----------------------------------------------------------------------
-- Practice all functions :- DateTime, Math, String									
-- Create two tables and perforn the set operations between the two tables.			
------------------------------------------------------------------------------------


CREATE DATABASE HomeWork_3;
USE HomeWork_3;


--------------- MATH  --------------------------------------

----- 1. ABS
SELECT ABS(0.2)AS AbsoluteValue, ABS(-0.5) AS AbValue;
SELECT ABS(FEE) AS fee FROM school;

----- 2. ROUND
SELECT ROUND(93.793245, 3) AS RoundoffValue;
SELECT Name, Subject, Fee, ROUND(MIN(Fee), 2) AS Smallest_Roundoff FROM tution
WHERE Fee > 750 GROUP BY Name, Subject, Fee;


----- 3. CEILING
SELECT CEILING(0.2)AS CeilingValue, CEILING(-0.5) AS CeValue, CEILING(12.2) AS CLValue;
SELECT Name, Subject, Fee, CEILING(MAX(Fee)) AS Smallest_Roundoff FROM tution
WHERE Fee > 750 GROUP BY Name, Subject, Fee;


----- 4. FLOOR
SELECT FLOOR(0.2)AS CeilingValue, FLOOR(-0.5) AS CeValue, FLOOR(12.2) AS CLValue;
SELECT Name, Subject, Fee, FLOOR(AVG(Fee)) AS Smallest_Roundoff FROM tution
WHERE Fee > 750 GROUP BY Name, Subject, Fee;

----- 5. SQRT
SELECT SQRT(25)AS SqRoot, SQRT(144) AS SquareRoot;

----- 6. POWER
SELECT POWER(5, 3) AS Cube,POWER(12,2) AS Square;
SELECT Name, Subject, Fee, POWER(MIN(Fee), 2) AS Smallest_Square FROM tution
WHERE Fee > 750 GROUP BY Name, Subject, Fee;


---------------  DateTime  --------------------------------------

SELECT GETDATE();

------- Extract Specific Part of a date or time.
-- 1. Year
SELECT DATEPART(YEAR,GETDATE()) AS Current_Year;
SELECT DATEPART(YEAR,'23-NOV-2001') AS Date_Year;

-- 2. MONTH
SELECT DATEPART(MONTH,GETDATE()) AS Current_Month;
SELECT DATEPART(MONTH,'4-APRIL-2004') AS Current_Month;

-- 3. DAY
SELECT DATEPART(DAY,GETDATE()) AS Current_Day;
SELECT DATEPART(DAY,'23-DEC-992') AS Current_Day;

-- 4. HOUR
SELECT DATEPART(HOUR,GETDATE()) AS Current_Hour;
SELECT DATEPART(HOUR,'2:18') AS Current_Hour;

-- 5. MINUTE
SELECT DATEPART(MINUTE,GETDATE()) AS Current_Minute;
SELECT DATEPART(MINUTE,'14:49:23') AS Current_Minute;

-- 6. SECOND
SELECT DATEPART(SECOND,GETDATE()) AS Current_Second;
SELECT DATEPART(SECOND,'14:49:23') AS Current_Second;


----------------------- Extract DATE Or TIME Part from current DateTime.
SELECT CONVERT(TIME,GETDATE());
SELECT CONVERT(DATE,GETDATE());

------------------------ Formate a Date or Time Value.
SELECT FORMAT(GETDATE(), 'dd-MM-yyyy') AS DATE;
SELECT FORMAT(GETDATE(), 'MM-yyyy') AS DATE;
SELECT FORMAT(GETDATE(), 'HH-mm') AS TIME;
SELECT FORMAT(GETDATE(), 'HH-mm-ss') AS TIME;
SELECT FORMAT(GETDATE(), 'dd-MM-yyyy HH-mm-ss') AS DateTime;


---------------  STRING  --------------------------------------

-- 1. RTRIM
SELECT RTRIM('Hello       ') AS RTRIM_WORD;
SELECT RTRIM('Hello World' , 'World') AS RTRIM_WORD;

-- 2. LTRIM
SELECT LTRIM('		Hello') AS LTRIM_WORD;
SELECT LTRIM('Hello World' , 'Hello') AS LTRIM_WORD;

-- 3. CHARINDEX
SELECT CHARINDEX('I', 'POSITION') AS POSITION;


-- 4. REPLACE
SELECT REPLACE('Replace the word','word','term') AS Replaced;

-- 5. SUBSTRING
SELECT SUBSTRING('SUBSTRING_WORD',6,4) AS S_word;

-- 6. CONCAT
SELECT CONCAT('UJJAWAL','_', 'KUMAR') AS Concat_Word;

-- 7. LOWER
SELECT LOWER('UJJAWAL') AS L_Case;
SELECT LOWER(Name) AS L_Case FROM school;

-- 8. UPPER
SELECT UPPER('ujjawal kumar') AS U_Case;
SELECT UPPER(Name) AS U_Case FROM school;

-- 9. LEN
SELECT LEN('Ujjawal') AS String_Length;
SELECT Name,LEN(Name) AS String_Length FROM school;



---------------------------------- ( SET OPERATIONS ) ---------------------------------------------

CREATE TABLE school(
Roll INT PRIMARY KEY,
Name VARCHAR(55),
Subject VARCHAR(55),
Fee INT,
DOB	DATE
);

INSERT INTO school(Roll, Name, Subject, Fee,DOB) VALUES
				(1,'Piyush', 'Math', 1200,'2001-MAR-06'),
				(2,'Aryan','Science', 1200,'2005-MAY-23'),
				(3, 'Shivam','Math', 1200,'2000-MAY-29'),
				(4,'Ankur','Science', 1200,'1999-JAN-06'),
				(5,'Vivek', 'Hindi', 1200,'2007-DEC-02'),
				(6,'Rahul', 'Math', 1200,'1994-MAY-13'),
				(7,'Anand','Science', 1200,'1991-DEC-12'),
				(8, 'Pratyush','Math', 1200,'2001-NOV-18'),
				(9,'Ankur','Math', 1200,'2001-MAR-06'),
				(10,'Harshit', 'Hindi', 1200,'2002-MAY-22');

CREATE TABLE tution(
id INT,
Name VARCHAR(55),
Subject VARCHAR(55),
Fee FLOAT,
DOB	DATE
);

INSERT INTO tution(id, Name, Subject, Fee,DOB) VALUES
				(101,'Piyush', 'Math', 800.44614,'2001-MAR-06'),
				(102,'Abhinav','Science', 750.03038,'2005-MAY-23'),
				(103, 'Ankit','Math', 800.33232,'2000-MAY-29'),
				(104,'Ankur','Science', 750.0000,'1999-JAN-06'),
				(105,'Vivek', 'Hindi', 400.24553,'1994-MAY-13'),
				(106,'Abhishek', 'Science', 750.49272,'2001-MAR-06'),
				(107,'Rahul', 'Hindi', 400.00382,'1991-DEC-12'),
				(108,'Pratyush', 'Science', 800.24221,'2001-NOV-18'),
				(109,'Himanshu', 'Math', 800.00000,'2001-MAR-06'),
				(110,'Harshit', 'Hindi', 800.72920,'2002-MAY-22');

SELECT * FROM school;
SELECT * FROM tution;
DROP TABLE tution,school;				

--------------- (UNION) -------------------------------------
SELECT * FROM school
	UNION
SELECT * FROM tution;

SELECT * FROM school WHERE Subject='Science'
	UNION
SELECT * FROM tution WHERE Subject='Science';

--------------- (UNION ALL) -------------------------------------
SELECT * FROM school
	UNION ALL						--Select all attributes from both tables, even same data have a twice view.
SELECT * FROM tution;

SELECT Name,Subject FROM school
	UNION								--Select DISTINCT attributes from both tables based on selection, the same data have a single view.
SELECT Name,Subject FROM tution;			-- If 'id' will be selected then it work as UNION ALL.

SELECT Name,Subject FROM school
	UNION ALL							----Select all attributes from both tables, even same data have a twice view.
SELECT Name,Subject FROM tution;

--------------- (INTERSECT) -------------------------------------
SELECT Name,Subject FROM school
	INTERSECT								
SELECT Name,Subject FROM tution;

SELECT Name,Subject FROM school WHERE Subject='Science'
	INTERSECT
SELECT Name,Subject FROM tution WHERE Subject='Science';

		
--------------- (INTERSECTION Through Emulation) ---------------------------------------
SELECT school.* FROM school INNER JOIN tution ON school.Name = tution.Name;
SELECT s.Roll,s.Name,s.Subject,s.Fee,t.Name,t.Subject,t.Fee FROM school AS s INNER JOIN tution AS t ON s.Name=t.Name;


--------------- (MINUS Through Emulation) -------------------------------------
SELECT school.* FROM school LEFT JOIN tution ON school.Roll = tution.id WHERE tution.id IS NULL;


---------------X--------------------X------------------------X--------------------X-------------------------------X------------------------
---------------X--------------------X------------------------X--------------------X-------------------------------X------------------------
