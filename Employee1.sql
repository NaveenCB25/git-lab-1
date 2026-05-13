-- Login as System Admin first
CREATE USER UName IDENTIFIED BY password;
GRANT ALL PRIVILEGES TO UName;
-- Logout and login with the new user credentials

CREATE TABLE Employee1 (
    EMPNO INT,
    ENAME VARCHAR(20),
    JOB VARCHAR(20),
    MANAGER_NO INT,
    SAL DECIMAL(10,2),
    COMMISSION DECIMAL(10,2)
);

-- Verify table structure
DESC Employee1;

-- Inserting records
BEGIN
    INSERT INTO Employee1 VALUES(1, 'John Doe', 'Manager', NULL, 50000.00, 1000.00);
    INSERT INTO Employee1 VALUES(2, 'Jane Smith', 'Developer', 1, 40000.00, 500.00);
    INSERT INTO Employee1 VALUES(3, 'Alice Johnson', 'Analyst', 1, 35000.00, NULL);
END;
/

COMMIT;

-- Verification and Rollback Test
SELECT * FROM Employee1;

DELETE FROM Employee1 WHERE ename = 'John Doe';
SELECT * FROM Employee1;

ROLLBACK;

SELECT * FROM Employee1;

-- Adding Primary Key
ALTER TABLE Employee1 ADD CONSTRAINT PK_EMPNO PRIMARY KEY (EMPNO);

-- Adding Not Null constraint
ALTER TABLE Employee1 MODIFY ENAME VARCHAR(20) NOT NULL;

-- Test Primary Key violation (Duplicate ID)
INSERT INTO Employee1 VALUES (1, 'Test Employee', 'Tester', 1, 35000.00, 1000.00);

-- Test Not Null violation (Null Name)
INSERT INTO Employee1 VALUES (4, NULL, 'Tester', 1, 35000.00, 1000.00);

-- ok--