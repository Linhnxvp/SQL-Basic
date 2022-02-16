CREATE DATABASE FresherTrainManagement
GO 
USE FresherTrainManagement

Drop database FresherTrainManagement

CREATE TABLE Trainee(
	traineeID int identity primary key,
	full_name varchar(30),
	birth_date date,
	gender bit,
	et_iq int,
	CHECK(et_iq BETWEEN 0 AND 20),
	et_gmath int,
	CHECK(et_gmath BETWEEN 0 AND 20),
	et_english int,
	CHECK(et_english BETWEEN 0 AND 50),
	training_class varchar(20),
	evaluation_notes text
)

INSERT INTO Trainee(full_name, birth_date, gender, et_iq, et_gmath, et_english, training_class, evaluation_notes) VALUES


SELECT * FROM Trainee

Delete from Trainee
----b
ALTER TABLE Trainee
ADD fsoft_account varchar(30) not null unique
SELECT * FROM Trainee

----c
CREATE VIEW etPassed
AS
SELECT * FROM Trainee
WHERE (et_iq + et_english) >= 20 AND et_iq >= 8 AND et_gmath >= 8 AND et_english >= 18

SELECT * FROM etPassed

----d
SELECT full_name, MONTH(birth_date) AS 'month'
FROM etPassed
ORDER BY etPassed.birth_date ASC

--e
SELECT TOP 1 * FROM Trainee
ORDER BY LEN(full_name) DESC
