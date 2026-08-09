CREATE DATABASE Company;
USE Company;
 
CREATE TABLE Employee (
    Emp_no     INT PRIMARY KEY,
    E_name     VARCHAR(50),
    E_address  VARCHAR(100),
    E_ph_no    VARCHAR(15),
    Dept_no    INT,
    Dept_name  VARCHAR(30),
    Job_id     INT,
    Salary     DECIMAL(10,2)
);

SELECT * FROM Employee;

INSERT INTO Employee (Emp_no, E_name, E_address, E_ph_no, Dept_no, Dept_name, Job_id, Salary)
VALUES
 (1, 'Tehreem Rana',   'Korangi, Karachi',  '0301-1111111', 10, 'HR',         101, 55000.00),
 (2, 'Sana Khan',   'North Nazimabad',   '0301-2222222', 20, 'Finance',    102, 62000.00),
 (3, 'Kinza Muzaffar',  'Korangi',           '0301-3333333', 10, 'HR',         101, 50000.00),
 (4, 'Hina Aslam',  'Malir',             '0301-4444444', 30, 'IT',         103, 70000.00),
 (5, 'Eesha Arif', 'Gulberg',           '0301-5555555', 20, 'Finance',    102, 64000.00),
 (6, 'Ayesha Noor', 'Johar',             '0301-6666666', 30, 'IT',         103, 72000.00),
 (7, 'Hamza Arif','Bahadurabad',       '0301-7777777', 40, 'Marketing',  104, 48000.00),
 (8, 'Fatima Ali',  'Nazimabad',         '0301-8888888', 10, 'HR',         101, 52000.00),
 (9, 'Shumail Arif',   'Gulshan, Karachi',  '0301-9999999', 40, 'Marketing',  104, 46000.00),
(10, 'Maria Javed', 'DHA',               '0301-1010101', 30, 'IT',         103, 75000.00);


SELECT *
FROM   Employee
WHERE  Dept_no = 10;

SELECT E_name   AS [Employee Name],
       Dept_no  AS [Department Number],
       Dept_name AS [Department]
FROM   Employee;


SELECT DISTINCT Dept_name
FROM   Employee;


ALTER TABLE Employee
ADD Dep_Head VARCHAR(50);

UPDATE Employee SET Dep_Head = 'Mr. Adnan'  WHERE Dept_name = 'HR';
UPDATE Employee SET Dep_Head = 'Mr. Farhan' WHERE Dept_name = 'Finance';
UPDATE Employee SET Dep_Head = 'Ms. Saba'   WHERE Dept_name = 'IT';
UPDATE Employee SET Dep_Head = 'Mr. Kamran' WHERE Dept_name = 'Marketing';

SELECT Dep_Head FROM  Employee;


UPDATE Employee
SET    Dep_Head = 'Mr. Tahir'
WHERE  Dept_name = 'HR';

SELECT * FROM Employee;

DELETE FROM Employee
WHERE  Emp_no = 5;


ALTER TABLE Employee
ADD Hire_date DATE;
 
UPDATE Employee SET Hire_date = '2022-01-15' WHERE Emp_no = 1;
UPDATE Employee SET Hire_date = '2022-03-10' WHERE Emp_no = 2;
UPDATE Employee SET Hire_date = '2022-05-21' WHERE Emp_no = 3;
UPDATE Employee SET Hire_date = '2022-06-01' WHERE Emp_no = 4;
UPDATE Employee SET Hire_date = '2022-07-18' WHERE Emp_no = 6;
UPDATE Employee SET Hire_date = '2022-09-02' WHERE Emp_no = 7;
UPDATE Employee SET Hire_date = '2022-10-12' WHERE Emp_no = 8;
UPDATE Employee SET Hire_date = '2022-11-25' WHERE Emp_no = 9;
UPDATE Employee SET Hire_date = '2022-12-05' WHERE Emp_no = 10;


SELECT CONCAT(E_name, ' - ', Dept_name) AS [Employee & Department]
FROM   Employee;

SELECT E_name + ' works in ' + Dept_name AS [Employee Detail]
FROM   Employee;

TRUNCATE TABLE Employee;
SELECT * FROM Employee;

DROP TABLE Employee;
SELECT * FROM Employee;

USE master;
DROP DATABASE Company;