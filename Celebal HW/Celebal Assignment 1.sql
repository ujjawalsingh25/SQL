-- Ujjawal Kuamar
-- Techno Main Salt Lake
-- Assignment 1


----Questions-----------------------------------------------------------------------
-- Create a database with your name.							
-- In each table you need to insert at least 10 records.
-- Perform all operations (DML, DDL, DQL)
------------------------------------------------------------------------------------

CREATE DATABASE Ujjawal_Kumar;
USE Ujjawal_Kumar;

CREATE TABLE Sport ( 
Name VARCHAR(50),
Sport VARCHAR(25)
);

INSERT INTO Sport (Name,Sport) VALUES
			('Ujjawal','Volleyball'),
			('Rohit','Cricket'),
			('Mohit', 'Football'),
			('Vishal','Cricket'),
			('Narayan','Cricket'),
			('Vishnu','Volleyball'),
			('Gaurav','Badminton'),
			('Ankit','Volleyball'),
			('Vikram','Cricket'),
			('Aman','Football');

SELECT * FROM Sport;

CREATE TABLE Subject (
Name VARCHAR(25),
Subject VARCHAR(25)
);

INSERT INTO Subject (Name,Subject) VALUES
			('Ujjawal','Sci'),
			('Rohit','Math'),
			('Mohit', 'Math'),
			('Vishal','English'),
			('Narayan','Bio'),
			('Vishnu','English'),
			('Gaurav','Math'),
			('Ankit','Sci'),
			('Vikram','Bio'),
			('Aman','Math');

SELECT * FROM Subject;
SELECT * FROM Sport;

UPDATE Subject 

TRUNCATE TABLE Subject;

DELETE FROM Subject WHERE Name='Rohit'

DROP TABLE Subject;
DROP TABLE Sport;


