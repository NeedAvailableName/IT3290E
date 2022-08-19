CREATE TABLE Person(
PersonID int,
LastName varchar(255),
FirstName varchar(255),
Age int,
Gender char(1),
City varchar(255)
);

INSERT INTO Person
VALUES(1,'Hiddleston','Tom',23,'F','Florida'),(2,'Watson','Angela',18,'F','Texas'),
(3,'Clooney','Pandora',34,'U','Arizona'),
(4,'Crane','Amory',52,'M','California'),
(5,'Clooney','Bush',67,'M','Arizona'),
(6,'Schwimmer','Geoffrey',19,'U','Hawaii');

ALTER TABLE Person ADD Email varchar(255);
ALTER TABLE Person DROP COLUMN Email;

ALTER TABLE Person ALTER COLUMN LastName varchar(50);
ALTER TABLE Person ALTER COLUMN FirstName varchar(50);

DROP TABLE Person;
CREATE TABLE Person(
PersonID int NOT NULL,
LastName varchar(50) NOT NULL,
FirstName varchar(50) NOT NULL,Age int,
Gender char(1),
City varchar(255)
);

ALTER TABLE Person ALTER COLUMN Age int NOT NULL;

DROP TABLE Person;
CREATE TABLE Person(
PersonID int NOT NULL UNIQUE,
LastName varchar(50) NOT NULL,FirstName varchar(50) NOT NULL,Age int,
Gender char(1),
City varchar(255)
);

DROP TABLE Person;
CREATE TABLE Person(
PersonID int NOT NULL,
LastName varchar(50) NOT NULL,
FirstName varchar(50) NOT NULL,
Age int,
Gender char(1),
City varchar(255),
CONSTRAINT UC_Person UNIQUE (PersonID,LastName));

ALTER TABLE Person ADD CONSTRAINT UC_PersonID UNIQUE (PersonID);

ALTER TABLE Person DROP CONSTRAINT UC_PersonID;

DROP TABLE Person;
CREATE TABLE Person(
PersonID int NOT NULL PRIMARY KEY,
LastName varchar(50) NOT NULL,
FirstName varchar(50) NOT NULL,
Age int,
Gender char(1),
City varchar(255),
);

DROP TABLE Person;
CREATE TABLE Person(
PersonID int NOT NULL,
LastName varchar(50) NOT NULL,
FirstName varchar(50) NOT NULL,
Age int,
Gender char(1),
City varchar(255),
CONSTRAINT PK_Person PRIMARY KEY(PersonID,LastName));

ALTER TABLE Person ADD PRIMARY KEY(PersonID);

ALTER TABLE Person
ADD CONSTRAINT PK_Person PRIMARY KEY(PersonID,LastName);

ALTER TABLE Person DROP CONSTRAINT PK_Person;

DROP TABLE Person
CREATE TABLE Person(
PersonID int NOT NULL PRIMARY KEY,LastName varchar(50) NOT NULL,FirstName varchar(50) NOT NULL,Age int,
Gender char(1),
City varchar(255)
);
CREATE TABLE Orders (
OrderID int NOT NULL PRIMARY KEY,
OrderNumber int NOT NULL,
PersonID int FOREIGN KEY REFERENCES Person(PersonID));

DROP TABLE Orders
CREATE TABLE Orders(
OrderID int NOT NULL,
OrderNumber int NOT NULL,
PersonID int,
PRIMARY KEY(OrderID),
CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)REFERENCES Person(PersonID)
);