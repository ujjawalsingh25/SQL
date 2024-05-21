CREATE DATABASE p1;
USE p1;

CREATE TABLE student (
Roll INT PRIMARY KEY, 
Name VARCHAR(25),
Marks INT,
Subject VARCHAR(25)
);

INSERT INTO student (roll,name,marks,subject) VALUES
			(1,'Ujjawal',89,'Sci'),
			(2,'Rohit',79,'Sci'),
			(3,'Mohit',64,'Math'),
			(4,'Vishal',95,'Hindi'),
			(5,'Narayan',85,'Math');
INSERT INTO student (roll,name,marks,subject) VALUES (6,'Varun',NULL,'English');

SELECT * FROM student;
-- DROP TABLE student;

----------SELECT--------------------------------
-- 1. SELECT name,marks FROM student;
-- 2. SELECT 23+2;
-- 3. SELECT now();
-- 4. SELECT lcase('UJJAWAL');		ucase('ujjawal');

---------------WHERE---------- 
-- 1. SELECT * FROM student WHERE marks>=85;
-- 2. SELECT * FROM student WHERE subject='Math';
-- 3. SELECT name,marks FROM student WHERE marks>80;

--------------BETWEEN--------------
 -- 1. SELECT * FROM student WHERE marks BETWEEN 60 AND 79;
 -- 2. SELECT name,marks FROM student WHERE marks BETWEEN 60 AND 79;

------------IN-----------------
-- 1. SELECT * FROM student WHERE subject IN('Math','Hindi');
-- 2. SELECT name,marks FROM student WHERE subject IN('Math','Sci');

---------AND---------------
SELECT * FROM student WHERE marks BETWEEN 80 AND 90 AND subject='Math';

-------------------OR----------------
SELECT * FROM student WHERE marks BETWEEN 80 AND 90 OR subject='Hindi';

-----------NOT--------------
SELECT * FROM student WHERE subject NOT IN('Math');
SELECT name,marks FROM student WHERE subject NOT IN('Math');

-----------IS NULL---------------
SELECT * FROM student WHERE marks IS NULL;

------<<LIKE>>--Pattern Searching/ Wildcard ('%','_')----------
SELECT * FROM student WHERE name LIKE'%a%';
SELECT name,marks FROM student WHERE name LIKE'_a%';

--------ORDER BY (Sorting)-----//ASC,DESC--------
SELECT * FROM student ORDER BY marks;
SELECT * FROM student ORDER BY marks DESC;

-------DISTINCT-------
SELECT DISTINCT subject FROM student;

---------GROUP BY (COMMA must be given)----------
----COUNT()---SUM()----AVG()-----MIN()----MAX()-------
SELECT subject, COUNT(marks) FROM student GROUP BY subject;
SELECT subject, AVG(marks) FROM student GROUP BY subject;
SELECT subject, SUM(marks) FROM student GROUP BY subject;
SELECT subject, MAX(marks) FROM student GROUP BY subject;  -----O/P MATHS=85-----
SELECT subject, MIN(marks) FROM student GROUP BY subject;  -----O/P MATHS=64-----

------------GROUP BY HAVING-------
SELECT subject, COUNT(marks) FROM student GROUP BY subject HAVING COUNT(marks)>=2;
-------------Max marks---------------------------------------Max Subject-----------
SELECT subject, COUNT(marks) FROM student WHERE marks>70 GROUP BY subject HAVING COUNT(marks)>=2; --only one count of math having more than 70
select * from student WHERE marks>70;
SELECT name,subject, COUNT(marks) FROM student WHERE marks>70 GROUP BY name,subject HAVING COUNT(marks)>=1;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
---------X------------X--------------X-----------X---------X---------X-----------X---------X--------X---------X-----------
---------X------------X--------------X-----------X---------X---------X-----------X---------X--------X---------X-----------
---------X------------X--------------X-----------X---------X---------X-----------X---------X--------X---------X-----------
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CREATE TABLE Customer(
id INT PRIMARY KEY,
Name VARCHAR(55),
Address VARCHAR(55)
);
SELECT * FROM Customer;

INSERT INTO Customer(id,Name,Address) VALUES
			(101,'Vishnu','Patna'),
			(102,'Prahlad','Dhanbad'),
			(103,'Saurav','Bihta'),
			(104,'Anmol','Kankarbagh'),
			(105,'Rajveer','Punjab');
SELECT * FROM Customer;

CREATE TABLE Ordr(
Order_no INT,
Order_Name Varchar(66) UNIQUE,						-- Or_Name always should be UNIQUE.
Cust_id INT,
Price INT NOT NULL DEFAULT 1000,					-- Default Prise will be 1000 if no input given
CONSTRAINT Price_Chk CHECK(Price>1000),			--To check price always greater than 1000
FOREIGN KEY(Cust_id) REFERENCES Customer(id),	--Foreign Key will be Cust_id whose value is { id (Primary Key) od Customer TABLE) }
PRIMARY KEY(Order_no)							-- Primary Key
);

INSERT INTO Ordr(Cust_id, Order_no, Order_Name, Price) VALUES
				(101, 1001,'Phone',4000),
				(102, 1002,'Laptop',2000),
				(103, 1003,'Fridge',3000),
				(104, 1004,'Bag',1200),
				(105, 1005,'Bike',8000);

DROP TABLE Ordr;
SELECT * FROM Ordr;

----------------------ALTER OPERATION--------------------
------- ( ADD ) --------------
ALTER TABLE Ordr ADD Paid FLOAT NOT NULL DEFAULT 0;
ALTER TABLE Ordr ADD Address VARCHAR(55);

------- ( MODIFY ) --------------
ALTER TABLE Ordr MODIFY Paid DOUBLE NOT NULL DEFAULT 0;			--NOT FOR MS SS
ALTER TABLE Ordr ALTER COLUMN Paid FLOAT NOT NULL;				--- FOR MS SS.

------- ( CHANGE COLUMN ) --------------
ALTER TABLE Ordr CHANGE COLUMN Paid Paid_Amount;

------- ( RENAME TO ) -------------- RENAME A TABLE
ALTER TABLE Ordr RENAME TO Order;



 ///////////////////////////////////////////////////////////
 -------(DML)---------DATA MODIFICATION LANGUAGE-----------
 ///////////////////////////////////////////////////////////

 SELECT * FROM Customer;

 --------INSERT---------------
 ---------UPDATE---------------------------------------------------------------
UPDATE Customer SET Address='Sasaram', Name='Manoj' WHERE id =103;

--------UPDATE MULTIPLE ROW-----------------------
UPDATE Customer SET Address='Patna';		---To Update multiple row or whole column use UPDATE without WHERE---
UPDATE Customer SET id=id+100;				--- To Update with algebric expression.

----------------- (REPLACE) ---------------------------------------------------------------------------
---If data is present already then --->> REPLACE
-------If data is NOT present then --->> INSERT   (UPDATE can't)

REPLACE INTO Customer (id,Address) VALUES (102,'Fatuha');		--REPLACE the Adress and the Name will be NULL-----------
REPLACE INTO Customer (id,Address) VALUES (106,'Mithapur');		--Since data 106 is not present so, it will INSERT.------
REPLACE INTO Customer SET id =104, Address='Colony More';		--REPLACE Data using SET Operation-----------------------
REPLACE INTO Customer (id,Name)									--Except SELECTed Data everthing will be NULL------------
			SELECT id,Name FROM Customer WHERE id=104;			--Here, id & Name will remain and Address will be NULL---

----------------------///// ( DELETE ) //////// --------------------------------------------------------------
 
 SELECT * FROM Customer;
DELETE FROM Customer;
DELETE FROM Customer WHERE id=101;

DROP TABLE Ordr;
-------- ( ON DELETE CASCADE ) -----------------------------------------------------------------------------------------------
CREATE TABLE Ordr(
Order_no INT PRIMARY KEY,
Order_Name Varchar(66) UNIQUE,						
Cust_id INT,
Price INT NOT NULL DEFAULT 1000,							
FOREIGN KEY(Cust_id) REFERENCES Customer(id) ON DELETE CASCADE		----- ON DELETE CASCADE, delete the child table's row also							
);																	------------		 when parent table's row data deleted
SELECT * FROM Ordr;
----------------------------------------------------------------------------------------------------------------------------
-------- ( ON DELETE NULL ) -----------------------------------------------------------------------------------------------
CREATE TABLE Ordr(
Order_no INT PRIMARY KEY,
Order_Name Varchar(66) UNIQUE,						
Cust_id INT,
Price INT NOT NULL DEFAULT 1000,								 ----- ON DELETE NULL, SET the child table's PRIMARY KEY to NULL						
FOREIGN KEY(Cust_id) REFERENCES Customer(id) ON DELETE NULL		   ----------- and Except FOREIGN KEY all data will be there							
);																       ----------      when parent table's row data deleted 
SELECT * FROM Ordr;
-------------------------------------------------------------------------------------------------------------------------


SELECT TOP 5 Ename FROM Employee;
