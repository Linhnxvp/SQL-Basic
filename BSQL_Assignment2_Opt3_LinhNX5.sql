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

INSERT INTO Movie(movie_Name, duration, genre, director, money_At_Office, image_Link, comment) VALUES				
				('Eternals',140,2,'Chloe Zhao',100000,'google',null),
				('The Power of the dog',126,1,'Jane Campion',208000,'google1',null),
				('Red notice',117,4,'Rawson Marshall Thurber',500000,'google2',null),
				('Kingdom: Ashin of the North',92,6,'Kim Sung Hoon',150000,'google3',null),
				('Alive',100,1,'II Cho',100000,'google4',null),
				('Eternals',140,2,'Chloe Zhao',100000,'google5',null)
				
INSERT INTO Actor(actor_name,age,average_Salary,nationality) VALUES
				('Salma Hayek',60,10000,'Americian'),
				('Angelina Jolie',28,12000,'Americian'),
				('Richard Madden',55,20000,'Korean'),
				('Dwayne Johnson',32,30000,'Americian'),
				('Reynolds',31,25000,'Americian')

INSERT INTO Actedln(idM, idA, number_Of_View, evaluate) VALUES
				(1,2,100000,4),
				(2,1,200000,3),
				(3,4,300000,1),
				(4,5,400000,4),
				(5,3,500000,5),
				(1,1,500000,5),
				(1,3,500000,5),
				(1,4,500000,5)

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
WHERE a.actor_name = 'Dwayne Johnson'

--f
SELECT m.idM, movie_Name
FROM Movie m INNER JOIN Actedln ac ON m.idM=ac.idM
				INNER JOIN Actor a ON ac.idA=a.idA
GROUP BY m.idM,m.movie_Name
HAVING COUNT(a.idA) > 3