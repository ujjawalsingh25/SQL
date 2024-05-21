-- 28/07/2023
-- Ujjawal Kuamar
-- Techno Main Salt Lake
-- Assignment 6

----Questions---------------------------------------------------------------------------
-- Create a table with the name travel_dates,
--	 columns date, time, day, month, year.

-- Create a parametrized stored procedure where we need to pass two parameters
--	 first parameter is 'Start_Date' & second parameter id 'End_Date'.

-- In the stored procedure you need to create a query to extract all the 
--	 columns and stored it into table.
------------------------------------------------------------------------------------------


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
	 
INSERT INTO #travel_dates (Full_date, Date_No, Month, Year, Day, Day_Name) 
				VALUES (@full_date, @date, @month, @year, @day, @day_name);
END;


SELECT * FROM #travel_dates;

CREATE PROCEDURE sp_procedure_assignment
@Start_date DATE, @End_date DATE
 AS
	BEGIN
	SELECT * INTO new_data_table FROM #travel_dates WHERE 
		Full_date BETWEEN @Start_date AND @End_date;
	END

DROP PROCEDURE sp_procedure_assignment;

DECLARE @today DATE = GETDATE()
EXECUTE sp_procedure_assignment '08-01-2023',@today

SELECT * FROM new_data_table;


