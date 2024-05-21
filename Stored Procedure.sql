
SELECT * FROM Employee;

CREATE PROCEDURE sp_procedure1
@id INT, @name VARCHAR(55)
--@employee_high_sal INT OUTPUT		-- OUTPUT parameter or store procedure returns employee_high_sal
AS
	BEGIN
		SELECT * FROM Employee 
			WHERE empid = @id OR Ename = @name
	END

EXECUTE sp_procedure1 101, 'Ankit';

ALTER PROCEDURE sp_procedure1
@id INT, @name VARCHAR(55),
@employee_high_sal INT OUTPUT		-- OUTPUT parameter or store procedure returns employee_high_sal
AS
	BEGIN
		SELECT @employee_high_sal = MAX(Esalary) FROM Employee 
			WHERE empid = @id OR Ename = @name
	END

DECLARE @max_sal INT
EXECUTE sp_procedure1 101, 'Ankit', @max_sal OUTPUT; 
SELECT @max_sal

sp_helptext sp_procedure1;

DROP PROCEDURE sp_procedure1;
---------------------------------------------------------------------


CREATE PROCEDURE sp_procedure1
@id INT, @name VARCHAR(55)
--@employee_high_sal INT OUTPUT		-- OUTPUT parameter or store procedure returns employee_high_sal
AS
	BEGIN
		SELECT * FROM Employee 
			WHERE empid = @id OR Ename = @name
	END

EXECUTE sp_procedure1 101, 'Ankit';

CREATE PROCEDURE sp_procedure_2
    @id1 int,
    @id2 INT
AS
BEGIN
    SELECT * INTO new_table FROM Employee
			WHERE empid BETWEEN @id1 AND @id2;
END;

EXECUTE sp_procedure_2 101, 105;
SELECT * FROM new_table;


