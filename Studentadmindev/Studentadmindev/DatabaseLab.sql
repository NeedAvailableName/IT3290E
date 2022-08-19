CREATE SCHEMA seedschool;
-- DROP DATABASE SeedSchool;
CREATE TABLE Teachers(
	teacher_id nchar(4) NOT NULL ,
	full_name nvarchar(30) NOT NULL,
	gender char(1) NOT NULL,
	phone_number nvarchar(25) NOT NULL UNIQUE,
	email nvarchar(50) NOT NULL UNIQUE,
	account_login nvarchar(20) NOT NULL UNIQUE,
	password_login nvarchar(20),
	CONSTRAINT pkTeachers PRIMARY KEY (teacher_id)
)

-- DROP TABLE Teachers
-- DROP TABLE Classes

CREATE TABLE Classes(
	class_id nchar(4) NOT NULL ,
	name nvarchar(4) NOT NULL,
	teacher_id nchar(4) NOT NULL,
	CONSTRAINT pkClasses PRIMARY KEY (class_id),
	CONSTRAINT fk1 FOREIGN KEY (teacher_id) REFERENCES Teachers (teacher_id)
)


CREATE TABLE Acivities(
	day_full DATE,
	morning_act nvarchar(20),
	afternoon_act nvarchar(20),
	class_id nchar(4),
	CONSTRAINT pkActivities PRIMARY KEY (day_full, class_id),
	CONSTRAINT fkActivities FOREIGN KEY (class_id) REFERENCES Classes (class_id)
)

-- DROP TABLE Activities

CREATE TABLE parents(
	parent_id nchar(4) NOT NULL ,
	father_name nvarchar(30) NOT NULL ,
	mother_name nvarchar(30),
	father_phone nvarchar(30) NOT NULL UNIQUE, 
	mother_phone nvarchar(30) NOT NULL UNIQUE,
	account_login nvarchar(30) NOT NULL UNIQUE,
	password_login nvarchar(30),
	CONSTRAINT pkParents PRIMARY KEY (parent_id)
)

CREATE TABLE students(
	student_id nchar(4) NOT NULL ,
	full_name nvarchar(30) NOT NULL,
	gender char(1) CHECK( gender = 'M' OR gender = 'F'),
	address nvarchar(30),
	parent_id nchar(4),
	class_id nchar(4) NOT NULL,
	CONSTRAINT pkStudents PRIMARY KEY (student_id),
	CONSTRAINT fkParents FOREIGN KEY (parent_id) REFERENCES Parents (parent_id),
	CONSTRAINT fkClass FOREIGN KEY (class_id) REFERENCES Classes (class_id)
)

	
CREATE TABLE Menu(
	the_date DATE PRIMARY KEY,
	breakfast nvarchar(30),
	lunch nvarchar(30),
	tea nvarchar(30),
)
--Drop TABLE Menu

CREATE TABLE Manage_Student(
	student_id nchar(4) NOT NULL,
	the_date DATE NOT NULL,
	student_status bit,
	care_after_school char(4) 
	CHECK(care_after_school = 'L' OR -- l low
		  care_after_school ='M' OR --m mid
		  care_after_school = 'H'), --h high
	
	teacher_comment nvarchar(50),
	CONSTRAINT pkManage1 PRIMARY KEY (the_date, student_id),
	CONSTRAINT fkStudents FOREIGN KEY (student_id) REFERENCES Students (student_id),
	CONSTRAINT fkMenu FOREIGN KEY (the_date) REFERENCES Menu (the_date),
)
--DROP TABLE Manage_Student
set dateformat dmy;

INSERT INTO Teachers
VALUES 
( 'GV01', N'Trương Tú Quỳnh', 'F' , '0981 347 522', 'quynh.ttGV01@gmail.com', 'quynh.ttGV01', 'msgv0001'),
( 'GV02', N'Trương Thúy Quỳnh', 'F' , '0981 567 522', 'quynh.ttGV02@gmail.com', 'quynh.ttGV02', 'msgv0002');

INSERT INTO Classes
VALUES
( '5A1', '5A1', 'GV01' ),
( '5A2', '5A2', 'GV02' );


INSERT INTO [Acivities]
VALUES
('1-6-2022', N'Tập thể dục', N'Chơi xích đu', '5A1'),
('1-6-2022', N'Tập thể dục', N'Chơi xích đu', '5A2'),
('2-6-2022', N'Tập thể dục', N'Trốn tìm', '5A1'),
('2-6-2022', N'Tập thể dục', N'Trốn tìm', '5A2')

INSERT INTO [Menu]
VALUES
('6-1-2022', N'Bánh Pizza', N'Cơm suất', N'Nước lọc'),
('6-2-2022', N'Bánh pate', N'Cơm heo chiên', N'Nước suối'),
('6-3-2022', N'Bánh trôi nước', N'Cơm rang thập cẩm', N'Trà sữa'),
('6-4-2022', N'Bánh gạo', N'Bún bò Huế', N'Bánh chocolate'),
('6-5-2022', N'Phở gà', N'Bún cá', N'Bánh tráng'),
('6-6-2022', N'Phở bò', N'Cơm rang trứng luộc', N'Cháo sườn'),
('6-7-2022', N'Bún riêu', N'Cơm canh cua rau muống', N'Cháo yến mạch')

INSERT INTO [Students]
VALUES
('S001', N'Nguyễn Văn A', 'M', N'Đống Đa, Hà Nội', 'P001', '5A1'),
('S002', N'Trần Thị Vân Anh', 'F', N'Hai Bà Trưng, Hà Nội', 'P002', '5A1'),
('S003', N'Vương Tuấn Anh', 'M', N'Đống Đa, Hà Nội', 'P003', '5A1'),
('S004', N'Nguyễn Yến Bình', 'F', N'Long Biên, Hà Nội', 'P004', '5A1'),
('S005', N'Phạm Văn Bàng', 'M', N'Cầu Giấy, Hà Nội', 'P005', '5A1'),
('S006', N'Trần Xuân Công', 'M', N'Thanh Xuân, Hà Nội', 'P006', '5A1'),
('S007', N'Lê Tú Dương',  'M', N'Đống Đa, Hà Nội', 'P007', '5A1'),
('S008', N'Triệu Văn Đăng', 'M', N'Ba Đình, Hà Nội', 'P008', '5A1'),
('S009', N'Trương Xuân Đồng',  'M', N'Hà Đông, Hà Nội', 'P009', '5A1'),
('S010', N'Lương Văn Huy',  'M', N'Hoàn Kiếm, Hà Nội', 'P010', '5A1'),
('S011', N'Trần Diệu Linh',  'F', N'Hoàng Mai, Hà Nội', 'P011', '5A1'),
('S012', N'Phan Anh Tú',  'M', N'Đống Đa, Hà Nội', 'P012', '5A1'),
('S013', N'Nguyễn Thị Vân',  'F', N'Ba Đình, Hà Nội', 'P013', '5A1'),
('S014', N'Lê Xuân Vũ',  'M', N'Hai Bà Trưng, Hà Nội', 'P014', '5A1'),

('S015',N'Ngô Mạnh Cường','M',N'Hà Nội','P015','5A2'),
('S016',N'Ngô Mạnh Cường','M',N'Hà Nội','P016','5A2'),
('S017',N'Nguyễn Quốc Đạt','M',N'Hà Nội','P017','5A2'),
('S018',N'Phan Quốc Huy','M',N'Hà Nội','P018','5A2'),
('S019',N'Nguyễn Quốc Khang','M',N'Hà Nội','P019','5A2'),
('S020',N'Đậu Đức Khuyên','M',N'Hà Nội','P020','5A2'),
('S021',N'Vũ Hoàng Kiên','M',N'Hà Nội','P021','5A2'),
('S022',N'Nguyễn Thị Phương Linh','F',N'Hà Nội','P022','5A2'),
('S023',N'Bùi Thị Ngọc','F',N'Hà Nội','P023','5A2'),
('S024',N'Nguyễn Thị Thảo Nguyên','F',N'Hà Nội','P024','5A2'),
('S025',N'Nguyễn Huỳnh Như','F',N'Hà Nội','P025','5A2'),
('S026',N'Nguyễn Thị Thu Thảo','M',N'Hà Nội','P026','5A2'),
('S027',N'Lê Anh Thư','M',N'Hà Nội','P027','5A2')

INSERT INTO [Parents]
VALUES
('P001', N'Vương Tuấn Anh', N'Trần Thị Vân Anh', '0981 347 522', '0981 347 423', 'P001', 'S001'),
('P002', N'Lê Tú Dương', N'Trần Thị Vân Anh', '0981 347 524', '0981 347 525', 'P002', 'S002'),
('P003', N'Phan Anh Tú', N'Trần Thị Vân Anh', '0981 347 514', '0910 347 512', 'P003', 'S003'),
('P004', N'Lê Xuân Vũ', N'Trần Thị Vân Anh', '0981 347 515', '0981 347 512', 'P004', 'S004'),
('P005', N'Vương Tuấn Anh', N'Trần Thị Vân Anh', '0981 314 123', '0981 512 124', 'P005', 'S005'),
('P006', N'Lương Văn Huy', N'Trần Thị Vân Anh', '0981 124 274', '0981 736 130', 'P006', 'S006'),
('P007', N'Triệu Văn Đăng', N'Trần Thị Vân Anh', '0911 347 522', '0981 123 125', 'P007', 'S007'),
('P008', N'Lê Xuân Vũ', N'Trần Thị Vân Anh', '0981 124 924', '0942 213 241', 'P008', 'S008'),
('P009', N'Vương Tuấn Anh', N'Trần Thị Vân Anh', '0911 487 522', '0978 861 523', 'P009', 'S009'),
('P010', N'Lê Xuân Vũ', N'Trần Thị Vân Anh', '0923 347 522', '0981 347 523', 'P010', 'S010'),
('P011', N'Triệu Văn Đăng', N'Trần Thị Vân Anh', '0914 347 522', '0941 347 523', 'P011', 'S011'),
('P012', N'Vương Tuấn Anh', N'Trần Thị Vân Anh', '0912 347 522', '0916 323 523', 'P012', 'S012'),
('P013', N'Triệu Văn Đăng', N'Trần Thị Vân Anh', '0915 347 522', '0989 313 523', 'P013', 'S013'),
('P014', N'Vương Tuấn Anh', N'Trần Thị Vân Anh', '0919 347 522', '0984 312 523', 'P014', 'S014'),

('P015',N'Hồ Thanh Bình',N'Đỗ Thuỳ Dương','0945881905','0377092166','P015','S015'),
('P016',N'Nguyễn Tấn Lộc',N'Nguyễn Thu Hà','0941237585','0356 853029','P016','S016'),
('P017',N'Khưu Quốc Anh Hào',N'Đặng Thị Thùy Hoa','0365722364','0374799681','P017','S017'),
('P018',N'Vũ Hoàng Kiên',N'Nguyễn Thị Huỳnh Hương','0919723524','0944287082','P018','S018'),
('P019',N'Phan Quang Minh',N'Võ Lương Hoàng Mai','0397008329','0937275479','P019','S019'),
('P020',N'Đặng Hoàng Nam',N'Phạm Lê Trà My','0916768345','0916768345','P020','S020'),
('P021',N'Phùng Thái Sang',N'Trịnh Thị Ngọc','0919988672','0919719444','P021','S021'),
('P022',N'Nguyễn Quốc Thái',N'Nguyễn Thị Quỳnh Nhi','0388337737','0358082341','P022','S022'),
('P023',N'Đặng Anh Tài',N'	Trần Thị Yến Như','0948829762','0933411752','P023','S023'),
('P024',N'Phạm Hữu Toàn',N'Nguyễn Thị Phương Thảo','0989761123','0918433043','P024','S024'),
('P025',N'Nguyễn Văn Thành Trung',N'Nguyễn Hồng Thắm','0914520386','0338313043','P025','S025'),
('P026',N'Nguyễn Thành Công',N'Đinh Thị Phương Trinh','0969015354','0982022236','P026','S026'),
('P027',N'Trương Tùng Lâm',N'Nguyễn Thu Hà','0345936168','0388210374','P027','S027')



