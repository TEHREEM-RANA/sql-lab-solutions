CREATE DATABASE Lab2;
USE Lab2;

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

INSERT INTO Boats VALUES (101,'Interlake','blue');
INSERT INTO Boats VALUES (102,'Opus','red');
INSERT INTO Boats VALUES (103,'Clipper','green');

INSERT INTO Reserves VALUES (1,101,'2025-01-15');
INSERT INTO Reserves VALUES (2,102,'2025-02-20');
INSERT INTO Reserves VALUES (1,103,'2025-03-10');
INSERT INTO Reserves VALUES (3,101,'2025-04-05');

SELECT S.*
FROM Sailors S
INNER JOIN Reserves R ON S.sid = R.sid
WHERE R.bid = 101;

SELECT B.bname
FROM Sailors S
INNER JOIN Reserves R ON S.sid = R.sid
INNER JOIN Boats B ON R.bid = B.bid
WHERE S.sname = 'Bob';

SELECT S.sname
FROM Sailors S
INNER JOIN Reserves R ON S.sid = R.sid
INNER JOIN Boats B ON R.bid = B.bid
WHERE B.color = 'red'
ORDER BY S.age;

SELECT DISTINCT S.sid
FROM Sailors S
INNER JOIN Reserves R ON S.sid = R.sid
INNER JOIN Boats B ON R.bid = B.bid
WHERE B.color = 'red' OR B.color = 'green';

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

SELECT P.P_id, P.Pro_name, D.Dep_name
FROM Projects P
INNER JOIN Department D ON P.Dep_id = D.Dep_id
WHERE D.Dep_name = 'HR';

INSERT INTO Projects VALUES (5,'Data Analytics',NULL);

SELECT P.Pro_name, D.Dep_name
FROM Projects P
LEFT OUTER JOIN Department D ON P.Dep_id = D.Dep_id;


CREATE TABLE Teacher (
    Id INT PRIMARY KEY,
    T_name VARCHAR(50)
);

CREATE TABLE Student (
    Id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE Course (
    Id INT PRIMARY KEY,
    course_name VARCHAR(50),
    teacher_id INT FOREIGN KEY REFERENCES Teacher(Id)
);

CREATE TABLE Student_Course (
    student_id INT FOREIGN KEY REFERENCES Student(Id),
    course_id INT FOREIGN KEY REFERENCES Course(Id)
);

INSERT INTO Teacher VALUES (1,'Dr. Ahmed');
INSERT INTO Teacher VALUES (2,'Prof. Bilal');
INSERT INTO Teacher VALUES (3,'Dr. Sara');

INSERT INTO Student VALUES (1,'Ali','Khan');
INSERT INTO Student VALUES (2,'Sara','Raza');
INSERT INTO Student VALUES (3,'Ahmed','Ali');

INSERT INTO Course VALUES (1,'DBMS',1);
INSERT INTO Course VALUES (2,'OOP',2);
INSERT INTO Course VALUES (3,'Data Structures',3);

SELECT C.course_name, T.T_name
FROM Course C
INNER JOIN Teacher T ON C.teacher_id = T.Id;

INSERT INTO Student_Course VALUES (1,1);
INSERT INTO Student_Course VALUES (2,1);
INSERT INTO Student_Course VALUES (1,2);
INSERT INTO Student_Course VALUES (3,3);

SELECT S.Id, S.first_name, C.course_name
FROM Student S
INNER JOIN Student_Course SC ON S.Id = SC.student_id
INNER JOIN Course C ON SC.course_id = C.Id
WHERE C.course_name = 'DBMS';

SELECT S.Id, S.first_name, C.course_name, T.T_name
FROM Student S
INNER JOIN Student_Course SC ON S.Id = SC.student_id
INNER JOIN Course C ON SC.course_id = C.Id
INNER JOIN Teacher T ON C.teacher_id = T.Id;

CREATE TABLE Teachers (
    t_id INT PRIMARY KEY,
    t_name VARCHAR(50),
    c_coordinator_id INT
);

INSERT INTO Teachers VALUES (1,'John Smith',NULL);
INSERT INTO Teachers VALUES (2,'Alice Johnson',1);
INSERT INTO Teachers VALUES (3,'Bob Williams',1);
INSERT INTO Teachers VALUES (4,'Charlie Brown',2);
INSERT INTO Teachers VALUES (5,'Diana Evans',1);

SELECT T1.t_name AS Teacher, T2.t_name AS Coordinator
FROM Teachers T1
INNER JOIN Teachers T2 ON T1.c_coordinator_id = T2.t_id
WHERE T2.t_name = 'John Smith';

