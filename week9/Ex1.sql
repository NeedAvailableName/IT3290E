CREATE TABLE Lecturers(
LID char(4) NOT NULL,
FullName nchar(30) NOT NULL,
Address nvarchar(50) NOT NULL,
DOB date NOT NULL,
CONSTRAINT pkLecturers PRIMARY KEY (LID)
)

CREATE TABLE Projects(
PID char(4) NOT NULL,
Title nvarchar(50) NOT NULL,
Level char(1) NOT NULL,
Cost integer,
CONSTRAINT pkProjects PRIMARY KEY (PID)
)

CREATE TABLE Participation(
LID char(4) NOT NULL,
PID char(4) NOT NULL,
Duration smallint,
CONSTRAINT pkParticipation PRIMARY KEY (LID, PID),
CONSTRAINT fk1 FOREIGN KEY (LID) REFERENCES Lecturers (LID),CONSTRAINT fk2 FOREIGN KEY (PID) REFERENCES Projects (PID) 
)

INSERT INTO Lecturers VALUES('GV01','Vu Tuyet Trinh','Hoang Mai, Ha Noi','1975/10/10'), 
('GV02','Nguyen Nhat Quang','Hai Ba Trung, Ha Noi','1976/11/03'),
('GV03','Tran Đuc Khanh','Đong Đa, Ha Noi','1977/06/04'), 
('GV04','Nguyen Hong Phuong','Tay Ho, Ha Noi','1983/12/10'),
('GV05','Le Thanh Huong','Hai Ba Trung, Ha Noi','1976/10/10')

INSERT INTO Projects VALUES ('DT01','Grid Computing','A','700'),
('DT02','Knowledge Discovery','B','300'),
('DT03','Text Classification','B','270'),
('DT04','Automatic English-Vietnamese Translation','C','30')

INSERT INTO Participation VALUES ('GV01','DT01','100'),
('GV01','DT02','80'),
('GV01','DT03','80'),
('GV02','DT01','120'),
('GV02','DT03','140'),
('GV03','DT03','150'),
('GV04','DT04','180')

--1
Select *
from Lecturers
where Lecturers.Address like 'Hai Ba Trung%'
order by FullName desc;

--2
select FullName, Address, DOB
from Lecturers, Participation, Projects
where Lecturers.LID = Participation.LID
and Participation.PID = Projects.PID
and Projects.Title = 'Grid Computing';

--3
select FullName, Address, DOB
from Lecturers, Participation, Projects
where Lecturers.LID = Participation.LID
and Participation.PID = Projects.PID
and (Projects.Title = 'Grid Computing' or Projects.Title = 'Automatic English-Vietnamese Translation');

--4
select FullName, Address, DOB
from Lecturers, Projects, Participation
where Lecturers.LID = Participation.LID
and Participation.PID = Projects.PID
group by FullName, Address, DOB
having COUNT(Projects.PID) >= 2;

--4
select * from Lecturers
where LID in (select LID from Participation group by LID having COUNT(PID) > 1)

--5
select FullName
from Lecturers
where LID in (select LID from Participation
				group by LID having COUNT(PID) >= all(select COUNT(PID)	
					from Participation group by LID))

--6
select *
from Projects
where select min(Cost) from Projects;

--7
select FullName, DOB, Title
from Lecturers, Projects, Participation
where Lecturers.LID = Participation.LID
and Projects.PID = Participation.PID
and Address like '%Tay Ho%';

--8
select FullName
from Lecturers, Projects, Participation
where Lecturers.LID = Participation.LID
and Projects.PID = Participation.PID
and DOB < '1980/1/1'
and Title = 'Text Classification';

--9
select Lecturers.LID, FullName, COUNT(Duration)
from Lecturers, Participation
where Lecturers.LID = Participation.LID
group by Lecturers.LID, FullName;

--10
insert into Lecturers 
values('Ngo Xuan Phong', 'Dong Da, Hanoi', '1986/09/08')

--11
update Lecturers
set Address = 'Tay Ho, Hanoi'
where FullName = 'Vu Tuyet Trinh';
--12
delete
from Participation
where LID = 'GV02'
delete 
from Lecturers
where LID = 'GV02'
