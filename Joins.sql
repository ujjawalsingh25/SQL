CREATE DATABASE Joins;
USE Joins;

CREATE TABLE Employee (
empid INT PRIMARY KEY,
Ename VARCHAR(55),
Eaddress VARCHAR(55),
Esalary INT
);

INSERT INTO Employee (empid,Ename,Eaddress,Esalary) VALUES
			(101,'Rajveer','Patna',1000),
			(102,'Rahul','Kankarbagh',3000),
			(103,'Mohit','Bhootnath',4500),
			(104,'Aman','Pahari',1340),
			(105,'Vikram','Veer',8000),
			(106,'Sunny','Bairia',9500),
			(107,'Anmol','Merchi',3400),
			(108,'Ankit','Alawalpur',5000);

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
			(502,108,'Varun','Patna',1000,54),
			(503,101,'Vishnu','Nawada',1000,23),
			(504,104,'Saurav','Rajgir',1000,34),
			(505,105,'Ashish','Ara',1000,12),
			(506,101,'Saksham','Mokama',1000,45),
			(507,107,'Uddesh','Bihta',1000,32),
			(508,108,'Kishu','Hajipur',1000,23);

CREATE TABLE Project (
Prno INT PRIMARY KEY,
Prid INT ,
Prname VARCHAR(55),
Pcost INT,
FOREIGN KEY(Prid) REFERENCES Employee(empid),
);

INSERT INTO Project (Prno,Prid,Prname,Pcost) VALUES
			(801,101,'Project A',1200),
			(802,102,'Project B',3600),
			(803,101,'Project C',2300),
			(804,104,'Project D',7600),
			(805,101,'Project E',4300),
			(806,103,'Project F',6400),
			(807,108,'Project H',4200),
			(808,108,'Project G',2700);
--DROP TABLE Employee;
--DROP TABLE Client;
--DROP TABLE Project;
SELECT * FROM Employee;
SELECT * FROM Client;
SELECT * FROM Project;

-------------INNER JOIN-----------  (All content intersecting or same content of both Left & Right) ---------
SELECT e.empid,e.Ename,e.Esalary,p.Prid,p.Prname,p.Pcost FROM Employee AS e		---Since empid is FOREIGN KEY as Prid so executed
			INNER JOIN Project AS p ON e.empid=p.Prid;						    		-------- as common between them
SELECT c.clno,c.Cname,c.Cpayment,p.Prid,p.Prname,p.Pcost FROM Client AS c	------Can't show/connect if not same column or dataset
			INNER JOIN Project AS p ON c.clno=p.Prid;			--- if it will be (empid & clid) or (empid & Prid) then will execute
SELECT * FROM Client AS c
	INNER JOIN Project AS p ON c.clno=p.Prid;					---- All data set will be selected

SELECT e.empid,e.Ename,e.Esalary,p.Prid,p.Prname,p.Pcost FROM Employee AS e		  
		INNER JOIN Project AS p ON e.empid=p.Prid WHERE e.Ename='Rajveer' AND p.Prname='Project A';  ----Since empid & clid is same
SELECT e.empid,e.Ename,e.Esalary,c.clid,c.Cname,c.Caddress FROM Employee AS e                  ----- or Foreign key so INNER JOIN worked
INNER JOIN Client AS c ON e.empid=c.clid WHERE e.Ename='Rajveer' AND c.Caddress='Buxar';  

-------------- LEFT JOIN------------  (All content of Left and intersecting or same content of Right)  ---------
SELECT e.empid,e.Ename,e.Esalary,p.Prname,p.Pcost,p.Prid FROM  Employee AS e 	---Left joined to those table written before LEFT JOIN
		LEFT JOIN Project AS p ON e.empid=p.Prid;									---e.empid & p.Prid can be interchange
SELECT e.empid,p.Prid,e.Ename,e.Esalary,p.Prname,p.Pcost FROM Project AS p 
		LEFT JOIN  Employee AS e ON e.empid=p.Prid ORDER BY empid;

-------------- RIGHT JOIN------------  (All content of Right and intersecting or same content of Left)  ---------
SELECT c.Cname,c.Caddress,c.CAge,c.clid,e.empid,e.Ename,e.Esalary FROM Client AS c	---Right joined to those table written before RIGHT JOIN
		RIGHT JOIN Employee AS e ON e.empid=c.clid;		---e.empid & c.clid can be interchange

-------------- CROSS JOIN------------  (All combination possible for the tables that can exist)  ---------
SELECT c.Cname,c.Caddress,c.CAge,c.clid,e.empid,e.Ename,e.Esalary FROM Client AS c	---Right joined to those table written before RIGHT JOIN
		CROSS JOIN Employee AS e;

-----------Without using JOIN Keyword---------------- (Using WHERE )-----------------------------
SELECT e.empid,e.Ename,e.Esalary,p.Prid,p.Prname,p.Pcost FROM Employee AS e, Project AS p WHERE e.empid=p.Prid;


===================================================================================================
///////////////////////////////////////////////////////////////////////////////////////////////////
---------------------------------- ( SET OPERATIONS ) ---------------------------------------------
///////////////////////////////////////////////////////////////////////////////////////////////////
===================================================================================================


CREATE TABLE school(
Roll INT PRIMARY KEY,
Name VARCHAR(55),
Subject VARCHAR(55),
Fee INT,
);

INSERT INTO school(Roll, Name, Subject, Fee) VALUES
				(1,'Piyush', 'Math', 1200),
				(2,'Aryan','Science', 1200),
				(3, 'Shivam','Math', 1200),
				(4,'Ankur','Science', 1200),
				(5,'Vivek', 'Hindi', 1200);

CREATE TABLE tution(
id INT,
Name VARCHAR(55),
Subject VARCHAR(55),
Fee INT
);

INSERT INTO tution(id, Name, Subject, Fee) VALUES
				(101,'Piyush', 'Math', 800),
				(102,'Abhinav','Science', 750),
				(103, 'Ankit','Math', 800),
				(104,'Ankur','Science', 750),
				(105,'Vivek', 'Hindi', 400),
				(106,'Abhishek', 'Science', 750),
				(107,'Rahul', 'Hindi', 400),
				(108,'Pratyush', 'Math', 800);

SELECT * FROM school;
SELECT * FROM tution;
DROP TABLE tution;				

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

SELECT * FROM school WHERE Subject='Science'
	INTERSECT
SELECT * FROM tution WHERE Subject='Science';

		
--------------- (INTERSECTION Through Emulation) ---------------------------------------
-- SELECT school.* FROM school INNER JOIN tution USING(Name);			--(USING COMMAND) NOT FOR MS-SS (For workbench)
SELECT school.* FROM school INNER JOIN tution ON school.Name = tution.Name;
SELECT s.Roll,s.Name,s.Subject,s.Fee,t.Name,t.Subject,t.Fee FROM school AS s INNER JOIN tution AS t ON s.Name=t.Name;


--------------- (MINUS Through Emulation) -------------------------------------
--SELECT school.* FROM school LEFT JOIN tution USING(Roll)			-- (USING COMMAND) NOT FOR MS-SS (For workbench)
--	WHERE tution.Roll is NULL;
SELECT school.* FROM school LEFT JOIN tution ON school.Roll = tution.id WHERE tution.id IS NULL;


