CREATE TABLE #Day(
Day_Name VARCHAR(55)
);
DROP table #Day;


DECLARE @date DATE = '01-07-2023';
SELECT @date;
--SELECT FORMAT(@date_given, 'dd-MM-yyyy') AS DATE;

DECLARE @current_date DATE;
SET @current_date = GETDATE();
DECLARE @month INT;
DECLARE @year INT;
DECLARE @day INT;
DECLARE @day_name VARCHAR(55);

WHILE @date <= @current_date
BEGIN
	--SELECT DATEPART(HOUR,@date_given) AS Hour;
	SET @month = DATEPART(MONTH, @date);
    SET @year = DATEPART(YEAR, @date);
	SET @day = DATEPART(WEEKDAY, @date);
	SET @day_name = DATENAME(DW, @date);

	SET @date = DATEADD(DAY, 1, @date);  
	--PRINT @month;
	-- PRINT @year;
	 PRINT FORMAT(@date, 'dd-MM-yyyy');
	--PRINT @day;
	-- PRINT @day_name;
	
--INSERT INTO #TempDate (Day_Name) VALUES (@day_name);
--INSERT INTO #TempMonth (Day_Name) VALUES (@day_name);
--INSERT INTO #TempYear (Day_Name) VALUES (@day_name);
--INSERT INTO #Day (Day_Name) VALUES (@day);
--INSERT INTO #TempDay_Name (Day_Name) VALUES (@day_name);

END;


