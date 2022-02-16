CREATE DATABASE Assignment2
USE Assignment2

USE master Drop database Assignment2

CREATE TABLE Department(
	deptNo int identity primary key,
	deptName varchar(50),
	note text
)

CREATE TABLE Employee(
	empNo varchar(20) primary key,
	empName varchar(50),
	birthDay date,
	deptNo int,
	mgrNo int NOT NULL,
	startDate date,
	salary money,
	level int CHECK(level BETWEEN 1 AND 7),
	status int CHECK(status BETWEEN 0 AND 2),
	note text
)

CREATE TABLE Skill(
	skillNo int identity primary key,
	skillName varchar(30),
	note text
)

CREATE TABLE Emp_Skill(
	skillNo int,
	empNo varchar(20),
	skillLevel int CHECK(skillLevel BETWEEN 1 AND 3),
	regDate date,
	description text,
	PRIMARY KEY (skillNo, empNo),
	CONSTRAINT fk_skillNo FOREIGN KEY (skillNo) REFERENCES Skill(skillNo),
	CONSTRAINT fk_empNo FOREIGN KEY (empNo) REFERENCES Employee(empNo)
)
-----Q2
--a
ALTER TABLE Employee
ADD email varchar(30) UNIQUE (email)

--b
ALTER TABLE Employee
ADD DEFAULT 0 FOR mgrNo

ALTER TABLE Employee
ADD DEFAULT 0 FOR status

-----Q3
--a
ALTER TABLE Employee
ADD CONSTRAINT fk_deptNo FOREIGN KEY (deptNo) REFERENCES Department(deptNo)

--b
ALTER TABLE Emp_Skill
DROP COLUMN description

-----Q4
--a


SELECT * FROM Department
SELECT * FROM Employee
SELECT * FROM Skill
SELECT * FROM Emp_Skill

---b

CREATE VIEW Employee_Tracking
AS
SELECT empNo, empName, level FROM Employee
WHERE level >= 3 AND level <= 5

SELECT * FROM Employee_Tracking