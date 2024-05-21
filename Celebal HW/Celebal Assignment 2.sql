-- 23/06/2023
-- Ujjawal Kuamar
-- Techno Main Salt Lake
-- Assignment 2


----Questions----------------------------------------------------------------------------------------------
-- Create 3 table and each table with 10 rows.
--  and perform all the operations, arithmetic , logical, clauses, Comparison Operator, and range.
-- Find min salary
-- Find 2nd heighest salary for employee_detail table having column id, name, salary, dob.
-------------------------------------------------------------------------------------------------------------
	

CREATE DATABASE HomeWork_2;
USE HomeWork_2;


CREATE TABLE Employee (
empid INT PRIMARY KEY,
Ename VARCHAR(55),
Eaddress VARCHAR(55),
Esalary INT,
DOB	DATE
);

INSERT INTO Employee (empid, Ename, Eaddress, Esalary, DOB) VALUES
			(101, 'Rajveer', 'Patna', 1000, '2001-MAR-06'),
			(102, 'Aryan','Kankarbagh', 3000, '2005-MAY-23'), 
			(103, 'Anmol','Bhootnath', 4500, '2000-MAY-29'),
			(104, 'Aman','Pahari', 1340, '1999-JAN-06'),
			(105, 'Vikram','Pahari', 8000, '2007-DEC-02'),
			(106, 'Sunny', 'Bairia', 9500, '1994-MAY-13'),
			(107, 'Anmol', 'Merchi', 3400, '1991-DEC-12'),
			(108, 'Ankit', 'Alawalpur', 5000, '2001-NOV-18'),
			(109, 'Aryan', 'Kumhrar', 5000, '2001-MAR-06'),
			(110, 'Shivam', 'Alawalpur', 5000, '2002-MAY-22');

CREATE TABLE Client (
clno INT PRIMARY KEY,
clid INT,
Cname VARCHAR(55),
Caddress VARCHAR(55),
Cpayment INT,
CAge INT,
FOREIGN KEY(clid) REFERENCES Employee(empid),
);

INSERT INTO Client (clno,clid,Cname,Caddress,Cpayment,CAge) VALUES
			(501,101,'Manoj','Buxar',1000,32),
			(502,108,'Varun','Patna',1200,54),
			(503,101,'Vishnu','Nawada',1100,23),
			(504,104,'Saurav','Rajgir',1600,34),
			(505,105,'Ashish','Ara',1300,12),
			(506,101,'Saksham','Mokama',1300,45),
			(507,107,'Uddesh','Bihta',1600,32),
			(508,108,'Kishu','Hajipur',1200,23),
			(509,109,'Vishal','Rohtas',1600,24),
			(510,110,'Abhishek','Hajipur',1100,23);

CREATE TABLE Project (
Prno INT PRIMARY KEY,
Prid INT ,
Prname VARCHAR(55),
Princome INT,
FOREIGN KEY(Prid) REFERENCES Employee(empid),
);

INSERT INTO Project (Prno,Prid,Prname,Princome) VALUES
			(801,101,'Project A',5600),
			(802,102,'Project B',3600),
			(803,101,'Project C',2300),
			(804,104,'Project A',7600),
			(805,101,'Project E',4300),
			(806,103,'Project D',6400),
			(807,108,'Project A',4200),
			(808,109,'Project B',2700),
			(809,110,'Project G',2700),
			(810,103,'Project C',2700);

SELECT * FROM Employee;
SELECT * FROM Client;
SELECT * FROM Project;

------------( OPERATIONS )--------------------------------
----- 1. ARITHMETIC -------------------------------------------------------------------------------------------------------------

-- ADDITION 
SELECT empid, Ename, Esalary, Esalary + 1000 AS "Increment" FROM Employee;
SELECT empid, Ename, Esalary, Esalary + 1000 AS "Increment",(Esalary + (Esalary+1000)) AS "Total"  FROM Employee;

-- SUBTRACTION
SELECT empid, Ename, Esalary, Esalary - 100 AS "Decrement" FROM Employee;
SELECT empid, Ename, Esalary, Esalary - 800 AS "Decrement",(Esalary - (Esalary-800)) AS "Total"  FROM Employee;

-- MULTIPLICATION
SELECT empid, Ename, Esalary, Esalary * 2 AS "Multiplied" FROM Employee;
SELECT empid, Ename, Esalary, Esalary*1.5 AS "Increment",(Esalary + (Esalary*1.5)) AS "Total"  FROM Employee;

-- DIVISION
SELECT empid, Ename, Esalary, Esalary/2 AS "Multiplied" FROM Employee;
SELECT empid, Ename, Esalary, Esalary/0.5 AS "Decrement",(Esalary - (Esalary/2)) AS "Total"  FROM Employee;

--MODULUS
SELECT empid, Ename, Esalary, Esalary%3 AS "Multiplied" FROM Employee;
-----------------------------------------------------------------------------------------------------------------------------


----- 2. LOGICAL OPERATION  -----------------------------------------------------------------------------------------------

SELECT * FROM Client;
-- AND
SELECT * FROM Client WHERE Cpayment BETWEEN 1200 AND 1500;
SELECT * FROM Client WHERE Cpayment BETWEEN 1200 AND 1500 AND Caddress='Patna';

-- BETWEEN
SELECT * FROM Client WHERE CAge BETWEEN 20 AND 30;
SELECT * FROM Client WHERE Cpayment BETWEEN 1200 AND 1500;

--IN 
SELECT * FROM Client WHERE Caddress IN('Buxar','Patna','Nawada','Ara');

-- NOT
SELECT * FROM Client WHERE Caddress NOT IN('Buxar','Patna','Nawada','Ara');

-- OR
SELECT * FROM Client WHERE Cname = 'Manoj' OR Caddress = 'Ara';
SELECT * FROM Client WHERE Cpayment BETWEEN 1200 AND 1500 OR Cname='Saurav';

-- LIKE
SELECT * FROM Client WHERE Cname LIKE'%a%';
SELECT * FROM Client WHERE Cpayment BETWEEN 1200 AND 1500 OR Cname LIKE 'V%';
-----------------------------------------------------------------------------------------------------------------------


----- 3. Clauses  -----------------------------------------------------------------------------------------------------------
SELECT * FROM Project;

-- ORDER BY  (ASC,DESC)
SELECT * FROM Project ORDER BY Prname ASC;
SELECT * FROM Project ORDER BY Princome;
SELECT * FROM Project ORDER BY Prname DESC;

----- GROUP BY CLAUSE
--COUNT
SELECT Prname, COUNT(Princome) FROM Project GROUP BY Prname;
--SUM
SELECT Prname, SUM(Princome) FROM Project GROUP BY Prname;
--AVG
SELECT Prname, AVG(Princome) FROM Project GROUP BY Prname;
--MIN
SELECT Prname, MIN(Princome) FROM Project GROUP BY Prname;
--MAX
SELECT Prname, MAX(Princome) FROM Project GROUP BY Prname;

-- HAVING CLAUSE
SELECT Prname, COUNT(Princome) FROM Project GROUP BY Prname HAVING COUNT(Princome)>=2;
SELECT Prname, MAX(Princome) FROM Project WHERE Prid<108 GROUP BY Prname HAVING MAX(Princome)>=2; 
--------------------------------------------------------------------------------------------------------------------------------


------ 4. COMPARISON OPERATOR  ----------------------------------------------------------------------------------------------------------

SELECT * FROM Employee;
-- ( = )
SELECT empid,Ename,Esalary,Eaddress FROM Employee WHERE Ename='Rajveer' OR Esalary=5000;

-- ( > )
SELECT empid,Ename,Esalary,Eaddress FROM Employee WHERE Esalary>3000;
SELECT empid,Ename,Esalary,Eaddress FROM Employee WHERE empid>103;

-- ( < )
SELECT empid,Ename,Esalary,Eaddress FROM Employee WHERE Esalary<8000;
SELECT empid,Ename,Esalary,Eaddress FROM Employee WHERE empid<107;

-- ( >= )
SELECT empid,Ename,Esalary,Eaddress FROM Employee WHERE Esalary>=3000;
SELECT empid,Ename,Esalary,Eaddress FROM Employee WHERE empid>=103;

--( <= )
SELECT empid,Ename,Esalary,Eaddress FROM Employee WHERE Esalary<=8000;
SELECT empid,Ename,Esalary,Eaddress FROM Employee WHERE empid<=107;

-- ( <> )
SELECT empid,Ename,Esalary,Eaddress  FROM Employee WHERE Eaddress <> 'Pahari' AND Esalary <> 5000;
SELECT empid,Ename,Esalary,Eaddress  FROM Employee WHERE Eaddress <> 'Pahari' AND Esalary <> 5000 AND empid>=103;
-----------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------------------------


---- Finding minimum salary
SELECT MIN(Esalary) AS Minimum_Sal FROM Employee;

-- Find 2nd heighest salary
SELECT MAX(Esalary) AS Sec_Heighest_Sal FROM Employee
		WHERE Esalary < (SELECT MAX(Esalary) FROM Employee);

		