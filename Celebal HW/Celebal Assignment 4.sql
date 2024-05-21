-- 15/07/2023
-- Ujjawal Kuamar
-- Techno Main Salt Lake
-- Assignment 4

----Questions-----------------------------------------------------------------------
-- Declare a date '01-07-21'
-- Create a temporary table 'date_details' which consists of columns date,month,year,day,day_name.
-- Extract all date from '01-07-2021' to current date
------------------------------------------------------------------------------------


CREATE DATABASE HomeWork_4;
USE HomeWork_4;

SELECT GETDATE();
SELECT DATEPART(WEEKDAY,GETDATE()) AS Current_Day;
SELECT DATENAME(DW,GETDATE()) AS Current_Day_Name;

CREATE TABLE #date_detail(
	Date_No INT,
	Month INT,
	Year INT,
	Day INT,
	Day_Name VARCHAR(55),
);

DROP TABLE #date_detail;


DECLARE @date_given DATE = '01-07-2021';
SELECT @date_given;
--SELECT FORMAT(@date_given, 'dd-MM-yyyy') AS DATE;

DECLARE @current_date DATE;
SET @current_date = GETDATE();
DECLARE @date INT;
DECLARE @month INT;
DECLARE @year INT;
DECLARE @day INT;
DECLARE @day_name VARCHAR(55);

WHILE @date_given <= @current_date
BEGIN

	--SELECT DATEPART(DAY,GETDATE()) AS Current_Day;
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
	
INSERT INTO #date_detail (Date_No, Month, Year, Day, Day_Name) 
				VALUES (@date, @month, @year, @day, @day_name);

END;


SELECT * FROM #date_detail;



