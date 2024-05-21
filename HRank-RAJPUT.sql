/*
Query the Name of any student in STUDENTS who scored higher than 75 Marks.
Order your output by the last three characters of each name. If two or more students
both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), 
secondary sort them by ascending ID.
*/

SELECT Name FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), ID ASC;

-----------------------------------------------------------------------------------------------------------------------------

SELECT ROUND(MIN(LAT_N),4) AS Smallest FROM STATION 
WHERE LAT_N > 38.7780;

-----------------------------------------------------------------------------------------------------------------------------

SELECT 
    CASE
        WHEN A+B<=C OR A+C<=B OR B+C<=A THEN 'Not A Triangle'
        WHEN A=B AND B=C THEN 'Equilateral'
        WHEN A=B OR A=C OR B=C THEN 'Isosceles'
        ELSE 'Scalene'
    END
FROM TRIANGLES;

-----------------------------------------------------------------------------------------------------------------------------

/*
Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a 
parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation]
is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.
*/

SELECT CONCAT(Name, '(', (SUBSTRING(Occupation, 1, 1)), ')')
FROM OCCUPATIONS
ORDER BY Name ASC;

SELECT CONCAT('There are a total of ', COUNT(OCCUPATION), ' ', LOWER(Occupation), 's.')
FROM OCCUPATIONS
GROUP BY OCCUPATION
ORDER BY COUNT(OCCUPATION) ASC;

-----------------------------------------------------------------------------------------------------------------------------



-- Create a table with the name travel_dates,
--	 columns date, time, day, month, year.

-- Create a parametrized stored procedure where we need to pass two parameters
--	 first parameter is 'Start_Date' & second parameter id 'End_Date'.

-- In the stored procedure you need to create a query to extract all the 
--	 columns and stored it into table.

-- write a sql query where
-- In the stored procedure you need to create a query to extract all the 
--	 columns from travel_dates and stored it into new table dates_table.


CREATE DATABASE HomeWork_5;
USE HomeWork_5;

CREATE TABLE #travel_dates(
	Full_date DATE,
	Date_No INT,
	Month INT,
	Year INT,
	Day INT,
	Day_Name VARCHAR(55),
);

DROP TABLE #travel_dates;


DECLARE @date_given DATE = '07-01-2023';
SELECT @date_given;
--SELECT FORMAT(@date_given, 'dd-MM-yyyy') AS DATE;

DECLARE @current_date DATE;
SET @current_date = GETDATE();
DECLARE @full_date DATE;
DECLARE @date INT;
DECLARE @month INT;
DECLARE @year INT;
DECLARE @day INT;
DECLARE @day_name VARCHAR(55);

WHILE @date_given <= @current_date
BEGIN

	--SELECT DATEPART(DAY,GETDATE()) AS Current_Day;
	SET @full_date = CONVERT(DATE, @date_given);
	SET @date = DATEPART(DAY, @date_given);
	SET @month = DATEPART(MONTH, @date_given);
    SET @year = DATEPART(YEAR, @date_given);
	SET @day = DATEPART(WEEKDAY, @date_given);
	SET @day_name = DATENAME(DW, @date_given);

	SET @date_given = DATEADD(DAY, 1, @date_given);  
	--PRINT @month;
	-- PRINT @year;
	-- PRINT FORMAT(@date, 'dd-MM-yyyy');
	--PRINT @day;
	-- PRINT @day_name;
	
INSERT INTO #travel_dates (Full_date, Date_No, Month, Year, Day, Day_Name) 
				VALUES (@full_date, @date, @month, @year, @day, @day_name);

END;


SELECT * FROM #travel_dates;

CREATE PROCEDURE sp_procedure_assignment
    @Start_date DATE,
    @End_date DATE
AS
BEGIN
    SELECT * INTO dates_table FROM #travel_dates
    WHERE Full_date BETWEEN @Start_date AND @End_date;
END

DECLARE @today DATE = GETDATE();
EXECUTE sp_procedure_assignment '08-01-2023', @today;

SELECT * FROM dates_table;
drop TABLE dates_table;



































































