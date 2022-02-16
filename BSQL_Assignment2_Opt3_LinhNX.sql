CREATE DATABASE Assignment2_Opt3
USE Assignment2_Opt3

CREATE TABLE Movie(
	idM int identity PRIMARY KEY,
	movie_Name varchar(50) NOT NULL,
	duration int CHECK(duration >= 60),
	genre int NOT NULL CHECK(genre BETWEEN 1 AND 8),
	director varchar(50) NOT NULL,
	money_At_Office money NOT NULL,
	comment text
)

CREATE TABLE Actor(
	idA int identity PRIMARY KEY,
	actor_name varchar(30) NOT NULL,
	age int NOT NULL,
	average_Salary money NOT NULL,
	nationality varchar(30) NOT NULL
)

CREATE TABLE Actedln(
	idM int NOT NULL,
	idA int NOT NULL,
	number_Of_View int,
	evaluate int CHECK(evaluate BETWEEN 0 AND 5),
	PRIMARY KEY (idM, idA),
	CONSTRAINT fk_Movie FOREIGN KEY (idM) REFERENCES Movie(idM),
	CONSTRAINT fk_Actor FOREIGN KEY (idA) REFERENCES Actor(idA)
)

---Q2
--a
ALTER TABLE Movie
ADD image_Link varchar(50) UNIQUE (image_Link)

--b



SELECT * FROM Movie
SELECT * FROM Actor
SELECT * FROM Actedln

UPDATE Actor
SET actor_name = 'Ryan Reynolds'
WHERE idA = 5
GO
SELECT * FROM Actor

----Q3
--c
SELECT * FROM Actor
Where age > 50

--d
SELECT actor_Name, average_Salary
FROM Actor
ORDER BY average_Salary

--e
SELECT movie_Name
FROM Movie m INNER JOIN Actedln ac ON m.idM=ac.idM
				INNER JOIN Actor a ON ac.idA=a.idA
WHERE a.actor_name = ''

--f
SELECT m.idM, movie_Name
FROM Movie m INNER JOIN Actedln ac ON m.idM=ac.idM
				INNER JOIN Actor a ON ac.idA=a.idA
GROUP BY m.idM,m.movie_Name
HAVING COUNT(a.idA) > 3