customer(id,sal,project)

select * from customer 
minus
select * from customer group by project;


 SELECT * FROM customer WHERE sal BETWEEN 1000 AND 5000;

 SELECT * FROM Employee;

 DECLARE @D_name VARCHAR(55)
 SET @D_name='Rajveer'
 SELECT * FROM Employee WHERE Ename=@D_Name

 DECLARE @slimit1 INT
 DECLARE @slimit2 INT
-- SET @slimit1 MIN(Esalary) FROM Employee GROUP BY Esalary
 --SET @slimit2 AVG(Esalary) FROM Employee GROUP BY Esalary
 -- SET @slimit1 = MIN(Esalary) FROM Employee
 --SET @slimit2 = AVG(Esalary) FROM Employee
 SET @slimit1 = MIN(Esalary)
 SET @slimit2 = AVG(Esalary) 
 SELECT * FROM Employee WHERE Esalary BETWEEN @slimit1 AND @slimit2
 
-- Declare a date '01-07-21'
-- Create a temporary table 'date_details' which consists of columns date,day,month,year,day_name.
-- Extract all date from '01-07-2021' to current date