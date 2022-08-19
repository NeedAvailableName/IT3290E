CREATE TABLE Company(
CompanyID char(4) NOT NULL,
Name nchar(30) NOT NULL,
NumberofEmployee integer NOT NULL,
Address nvarchar(50) NOT NULL,
Telephone char(10) NOT NULL,
EstablishmentDay date NOT NULL,
CONSTRAINT pkCompanyID PRIMARY KEY (CompanyID)
)

CREATE TABLE Product(
ProductID char(4) NOT NULL,
Name nchar(30) NOT NULL,
Color nchar(20),
Price nvarchar(15),
CONSTRAINT pkProduct PRIMARY KEY (ProductID),
)

CREATE TABLE Supply(
CompanyID char(4) NOT NULL,
productID char(4) NOT NULL,
Quantity integer NOT NULL,
CONSTRAINT pkSupply PRIMARY KEY (CompanyID, ProductID),
CONSTRAINT fk1 FOREIGN KEY (CompanyID) REFERENCES Company (CompanyID),
CONSTRAINT fk2 FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
)

INSERT INTO Product(Name, Color, Price)
VALUES('Lexus ES 250','black',15000)
INSERT INTO Product(Name, Color, Price)
VALUES('Lexus GS Turbo','red',22000),
('Lexus ES 350','black',20000),
('Lexus LS 500h','blue',30000)
INSERT INTO Supply
VALUES(1,29,3000),
(2,30,2500),
(14,31,4000)