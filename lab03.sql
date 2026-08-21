CREATE DATABASE Lab3;
USE Lab3;

CREATE TABLE Students_GPA (
    Student_id INT PRIMARY KEY,
    batch INT,
    semester INT,
    GPA DECIMAL(3,2)
);

INSERT INTO Students_GPA VALUES (1, 2021, 1, 3.50);
INSERT INTO Students_GPA VALUES (2, 2021, 1, 3.20);
INSERT INTO Students_GPA VALUES (3, 2021, 2, 3.80);
INSERT INTO Students_GPA VALUES (4, 2022, 1, 2.90);
INSERT INTO Students_GPA VALUES (5, 2022, 1, 3.60);
INSERT INTO Students_GPA VALUES (6, 2022, 2, 3.10);
INSERT INTO Students_GPA VALUES (7, 2023, 1, 3.70);
INSERT INTO Students_GPA VALUES (8, 2023, 1, 2.80);
INSERT INTO Students_GPA VALUES (1, 2021, 2, 3.60);
INSERT INTO Students_GPA VALUES (2, 2021, 2, 3.40);
INSERT INTO Students_GPA VALUES (4, 2022, 2, 3.30);
INSERT INTO Students_GPA VALUES (5, 2022, 2, 3.50);

SELECT * FROM Students_GPA;

SELECT batch, AVG(GPA) AS Average_GPA
FROM Students_GPA
GROUP BY batch
ORDER BY batch DESC;

CREATE VIEW HighGPA_Students AS
SELECT Student_id, AVG(GPA) AS Average_GPA
FROM Students_GPA
GROUP BY Student_id
HAVING AVG(GPA) >= 3;

SELECT * FROM HighGPA_Students;

CREATE PROC StudentGPA_Stats
AS
BEGIN
    SELECT Student_id,
           MAX(GPA) AS Maximum_GPA,
           MIN(GPA) AS Minimum_GPA,
           AVG(GPA) AS Average_GPA
    FROM Students_GPA
    GROUP BY Student_id;
END;

EXEC StudentGPA_Stats;


CREATE TABLE Sailors (
    sid INT PRIMARY KEY,
    sname VARCHAR(50),
    rating INT,
    age INT
);

CREATE TABLE Boats (
    bid INT PRIMARY KEY,
    bname VARCHAR(50),
    color VARCHAR(30)
);

CREATE TABLE Reserves (
    sid INT FOREIGN KEY REFERENCES Sailors(sid),
    bid INT FOREIGN KEY REFERENCES Boats(bid),
    day DATE
);

INSERT INTO Sailors VALUES (1,'Bob',7,35);
INSERT INTO Sailors VALUES (2,'Alice',8,28);
INSERT INTO Sailors VALUES (3,'Charlie',6,42);
INSERT INTO Sailors VALUES (4,'David',9,33);
INSERT INTO Sailors VALUES (5,'Eve',7,29);
INSERT INTO Sailors VALUES (6,'Frank',8,31);
INSERT INTO Sailors VALUES (7,'Grace',9,26);

INSERT INTO Boats VALUES (101,'Interlake','blue');
INSERT INTO Boats VALUES (102,'Opus','red');
INSERT INTO Boats VALUES (103,'Clipper','green');
INSERT INTO Boats VALUES (104,'Mariner','blue');

INSERT INTO Reserves VALUES (1,101,'2025-01-15');
INSERT INTO Reserves VALUES (2,102,'2025-02-20');
INSERT INTO Reserves VALUES (1,103,'2025-03-10');
INSERT INTO Reserves VALUES (3,101,'2025-04-05');
INSERT INTO Reserves VALUES (4,104,'2025-05-12');
INSERT INTO Reserves VALUES (5,101,'2025-06-01');
INSERT INTO Reserves VALUES (6,102,'2025-07-18');
INSERT INTO Reserves VALUES (7,104,'2025-08-22');

CREATE VIEW AvgAge_ByRating AS
SELECT rating, AVG(age) AS Average_Age
FROM Sailors
GROUP BY rating;

SELECT * FROM AvgAge_ByRating;

CREATE VIEW BlueBoat_Reservations AS
SELECT S.sname, R.day
FROM Sailors S
INNER JOIN Reserves R ON S.sid = R.sid
INNER JOIN Boats B ON R.bid = B.bid
WHERE B.color = 'blue';

SELECT * FROM BlueBoat_Reservations;

CREATE PROC BoatColor_Reservations
    @boat_color VARCHAR(30)
AS
BEGIN
    SELECT S.sname, R.day, B.bname, B.color
    FROM Sailors S
    INNER JOIN Reserves R ON S.sid = R.sid
    INNER JOIN Boats B ON R.bid = B.bid
    WHERE B.color = @boat_color;
END;

EXEC BoatColor_Reservations 'blue';


CREATE TABLE Department (
    Dep_id INT PRIMARY KEY,
    Dep_name VARCHAR(50)
);

CREATE TABLE Projects (
    P_id INT PRIMARY KEY,
    Pro_name VARCHAR(50),
    Dep_id INT FOREIGN KEY REFERENCES Department(Dep_id)
);

INSERT INTO Department VALUES (1,'HR');
INSERT INTO Department VALUES (2,'IT');
INSERT INTO Department VALUES (3,'Finance');

INSERT INTO Projects VALUES (1,'Recruitment System',1);
INSERT INTO Projects VALUES (2,'Payroll System',3);
INSERT INTO Projects VALUES (3,'Training Portal',1);
INSERT INTO Projects VALUES (4,'Network Upgrade',2);
INSERT INTO Projects VALUES (5,'Budget App',3);

-- Direct Query for HR department
SELECT P.P_id, P.Pro_name, D.Dep_name
FROM Projects P
INNER JOIN Department D ON P.Dep_id = D.Dep_id
WHERE D.Dep_name = 'HR';

-- Stored Procedure with Parameter
CREATE PROC Dept_Projects
    @dept_name VARCHAR(50)
AS
BEGIN
    SELECT P.P_id, P.Pro_name, D.Dep_name
    FROM Projects P
    INNER JOIN Department D ON P.Dep_id = D.Dep_id
    WHERE D.Dep_name = @dept_name;
END;

EXEC Dept_Projects 'HR';