/*SETUP*/

CREATE TABLE Professor (
    SSN varchar(11) NOT NULL,
    P_Title varchar(20),
    P_Addr varchar(255),
    P_Name varchar(70),
    Sex ENUM('M', 'F'),
    Salary int,
    P_Tel varchar(20),
    PRIMARY KEY (SSN)
);

CREATE TABLE P_Degrees (
    SSN varchar(11) NOT NULL,
    Degree varchar(25) NOT NULL,
    CONSTRAINT PRIMARY KEY (SSN, Degree),
    FOREIGN KEY (SSN) REFERENCES Professor(SSN)
);

CREATE TABLE Department (
    DNum varchar(10) NOT NULL,
    D_Name varchar(70),
    Office varchar(20),
    D_Tel varchar(20),
    Chair_SSN varchar(11),
    PRIMARY KEY (DNum),
    FOREIGN KEY (Chair_SSN) REFERENCES Professor(SSN) 
);

CREATE TABLE Course (
    CNum varchar(12) NOT NULL,
    C_Title varchar(70),
    TextB varchar(70),
    Units tinyint,
    Dep varchar(10),
    PRIMARY KEY (CNum),
    FOREIGN KEY (Dep) REFERENCES Department(DNum)
);

CREATE TABLE Course_Pre_Req (
    Pre_CNum varchar(12) NOT NULL,
    Crse varchar(12) NOT NULL,
    CONSTRAINT PRIMARY KEY (Pre_CNum, Crse),
    FOREIGN KEY (Pre_CNum) REFERENCES Course(CNum),
    FOREIGN KEY (Crse) REFERENCES Course(CNum)
);

CREATE TABLE Student (
    CWID varchar(20) NOT NULL,
    St_Fname varchar(40),
    St_Lname varchar(40),
    Street varchar(40),
    City varchar(40),
    St_State char(2),
    Zip varchar(20),
    Tel_Area varchar(6),
    Tel_Num varchar(15),
    Major_Dep varchar(10),
    PRIMARY KEY (CWID),
    FOREIGN KEY (Major_Dep) REFERENCES Department(DNum)
);

CREATE TABLE Course_Section (
    SecNum varchar(15) NOT NULL,
    CNum varchar(12) NOT NULL,
    Room varchar(10),
    MDays SET('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'),
    BegTime Time,
    EndTime Time,
    cap smallint,
    Teacher varchar(11),
    CONSTRAINT PRIMARY KEY (SecNum, CNum),
    FOREIGN KEY (CNum) REFERENCES Course(CNum),
    FOREIGN KEY (Teacher) REFERENCES Professor(SSN)
);

CREATE TABLE Student_Course_Grade (
    SecNum varchar(15) NOT NULL,
    CNum varchar(12) NOT NULL,
    CWID varchar(20) NOT NULL,
    Grade ENUM('A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D+', 'D', 'D-', 'F'),
    CONSTRAINT PRIMARY KEY (SecNum, CNum, CWID),
    FOREIGN KEY (SecNum) REFERENCES Course_Section(SecNum),
    FOREIGN KEY (CNum) REFERENCES Course(CNum),
    FOREIGN KEY (CWID) REFERENCES Student(CWID)
);

CREATE TABLE Student_Minors (
    CWID varchar(20) NOT NULL,
    DNum varchar(10) NOT NULL,
    CONSTRAINT PRIMARY KEY (CWID, DNum),
    FOREIGN KEY (CWID) REFERENCES Student(CWID),
    FOREIGN KEY (DNum) REFERENCES Department(DNum)
);

/*INSERT DATA*/

# Professor Info --------------------------------------------------------------------------------------------------------------------#
INSERT INTO Professor (SSN, P_Title, P_Addr, P_Name, Sex, Salary, P_Tel)
VALUES ('123-45-6789', 'Associate', '123 College Lane College Town, CA 12345', 'Billy Jean', 'M', 25000, '909-999-9876');

INSERT INTO Professor (SSN, P_Title, P_Addr, P_Name, Sex, Salary, P_Tel)
VALUES ('234-56-7891', 'Professor', '800 N State College Blvd, Fullerton, CA 92831', 'Shawn Wang', 'M', 50000, '657-278-7258');

INSERT INTO Professor (SSN, P_Title, P_Addr, P_Name, Sex, Salary, P_Tel)
VALUES ('368-72-2498', 'University', '642 Mini Street, Anaheim, CA 92462', 'Larry Lost', 'F', 40000, '782-657-9825');


# Department Info -------------------------------------------------------------------------------------------------------------------#
INSERT INTO Department (DNum, D_Name, Office, D_Tel, Chair_SSN)
VALUES ('CPSC', 'Computer Science', 'CS452', '714-235-3654', '234-56-7891');

INSERT INTO Department (DNum, D_Name, Office, D_Tel, Chair_SSN)
VALUES ('MATH', 'Mathematics', 'MH487', '714-672-4823', '123-45-6789');


# Student Info -----------------------------------------------------------------------------------------------------------------------# 
INSERT INTO Student (CWID, St_Fname, St_Lname, Street, City, St_State, Zip, Tel_Area, Tel_Num, Major_Dep)
VALUES ('123456789', 'Cristopher', 'Hernandez', '925 Nutwood Ave', 'Fullerton', 'CA', '92831', '714', '123-4567', 'CPSC');

INSERT INTO Student (CWID, St_Fname, St_Lname, Street, City, St_State, Zip, Tel_Area, Tel_Num, Major_Dep)
VALUES ('234567890', 'Daniel', 'Domingo', '813 Commonwealth Ave', 'Fullerton', 'CA', '92831', '714', '234-5678', 'CPSC');

INSERT INTO Student (CWID, St_Fname, St_Lname, Street, City, St_State, Zip, Tel_Area, Tel_Num, Major_Dep)
VALUES ('345678901', 'Scott', 'Ng', '1024 Yorba Linda Blvd', 'Fullerton', 'CA', '92831', '714', '345-6789', 'CPSC');

INSERT INTO Student (CWID, St_Fname, St_Lname, Street, City, St_State, Zip, Tel_Area, Tel_Num, Major_Dep)
VALUES ('456789012', 'Michael', 'Shafae', '522 N Placentia Ave', 'xFullerton', 'CA', '92831', '714', '456-7890', 'MATH');

INSERT INTO Student (CWID, St_Fname, St_Lname, Street, City, St_State, Zip, Tel_Area, Tel_Num, Major_Dep)
VALUES ('567890123', 'Rachael', 'Greene', '24 E Chapman Ave', 'Fullerton', 'CA', '92831', '714', '567-8901', 'MATH');

INSERT INTO Student (CWID, St_Fname, St_Lname, Street, City, St_State, Zip, Tel_Area, Tel_Num, Major_Dep)
VALUES ('678901234', 'Louis', 'Baldwin', '811 Harmony Ln', 'Fullerton', 'CA', '92831', '714', '678-9012', 'MATH');

INSERT INTO Student (CWID, St_Fname, St_Lname, Street, City, St_State, Zip, Tel_Area, Tel_Num, Major_Dep)
VALUES ('789012345', 'Barry', 'Hammond', '459 Skyline Dr', 'Fullerton', 'CA', '92831', '714', '789-0123', 'CPSC');

INSERT INTO Student (CWID, St_Fname, St_Lname, Street, City, St_State, Zip, Tel_Area, Tel_Num, Major_Dep)
VALUES ('890123456', 'Matthew', 'Jackson', '349 Quartz Ln', 'Fullerton', 'CA', '92831', '714', '901-1234', 'MATH');

INSERT INTO Student (CWID, St_Fname, St_Lname, Street, City, St_State, Zip, Tel_Area, Tel_Num, Major_Dep)
VALUES ('901234567', 'Kenneth', 'Patrick', '847 Garnet Ln', 'Fullerton', 'CA', '92831', '714', '012-3456', 'CPSC');

INSERT INTO Student (CWID, St_Fname, St_Lname, Street, City, St_State, Zip, Tel_Area, Tel_Num, Major_Dep)
VALUES ('012345678', 'Tammy', 'Waters', '340 Topaz Ln', 'Fullerton', 'CA', '92831', '714', '098-7654', 'MATH');



# Degree Info -----------------------------------------------------------------------------------------------------------------------#
INSERT INTO P_Degrees (SSN, Degree)
VALUES ((SELECT SSN FROM Professor WHERE P_Name = 'Billy Jean'), 'Phd Computer Science');

INSERT INTO P_Degrees (SSN, Degree)
VALUES ((SELECT SSN FROM Professor WHERE P_Name = 'Shawn Wang'), 'Phd Computer Science');

INSERT INTO P_Degrees (SSN, Degree)
VALUES ((SELECT SSN FROM Professor WHERE P_Name = 'Larry Lost'), 'Associates Math');


# Course Info -----------------------------------------------------------------------------------------------------------------------#
INSERT INTO Course (CNum, C_Title, TextB, Units, Dep)
VALUES ('CPSC-332', 'Database Design', '478974982374298', 3, (SELECT DNum FROM Department WHERE D_Name = 'Computer Science'));

INSERT INTO Course (CNum, C_Title, TextB, Units, Dep)
VALUES ('CPSC-481', 'AI', '278435582474292', 3, (SELECT DNum FROM Department WHERE D_Name = 'Computer Science'));

INSERT INTO Course (CNum, C_Title, TextB, Units, Dep)
VALUES ('MATH-125', 'Pre-Calculus', '178434556474831', 3, (SELECT DNum FROM Department WHERE D_Name = 'Mathematics'));

INSERT INTO Course (CNum, C_Title, TextB, Units, Dep)
VALUES ('CPSC-301', 'Programming Lab Practicum', '932169836201674', 2, (SELECT DNum FROM Department WHERE D_Name = 'Computer Science'));


# Section Info ---------------------------------------------------------------------------------------------------------------------#
INSERT INTO Course_Section (SecNum, CNum, Room, MDays, BegTime, EndTime, cap, Teacher)
VALUES ('01', 'MATH-125', 'MH126', ('Mon,Wed'), '10:00:00', '11:15:00', 30, (SELECT SSN FROM Professor WHERE P_Name = 'Larry Lost'));

INSERT INTO Course_Section (SecNum, CNum, Room, MDays, BegTime, EndTime, cap, Teacher)
VALUES ('02', 'MATH-125', 'MH256', ('Tue'), '10:00:00', '12:50:00', 25, (SELECT SSN FROM Professor WHERE P_Name = 'Larry Lost'));

INSERT INTO Course_Section (SecNum, CNum, Room, MDays, BegTime, EndTime, cap, Teacher)
VALUES ('01', 'CPSC-332', 'CS105', ('Mon,Wed'), '12:00:00', '13:15:00', 28, (SELECT SSN FROM Professor WHERE P_Name = 'Billy Jean'));

INSERT INTO Course_Section (SecNum, CNum, Room, MDays, BegTime, EndTime, cap, Teacher)
VALUES ('04', 'CPSC-332', 'CS210', ('Fri'), '09:00:00', '11:50:00', 27, (SELECT SSN FROM Professor WHERE P_Name = 'Shawn Wang'));

INSERT INTO Course_Section (SecNum, CNum, Room, MDays, BegTime, EndTime, cap, Teacher)
VALUES ('02', 'CPSC-332', 'CS105', ('Tue,Thu'), '14:30:00', '15:45:00', 28, (SELECT SSN FROM Professor WHERE P_Name = 'Shawn Wang'));

INSERT INTO Course_Section (SecNum, CNum, Room, MDays, BegTime, EndTime, cap, Teacher)
VALUES ('03', 'CPSC-332', 'CS201', ('Tue,Thu'), '19:00:00', '20:15:00', 31, (SELECT SSN FROM Professor WHERE P_Name = 'Billy Jean'));


# Enrollment Records --------------------------------------------------------------------------------------------------------------#

# 125
INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('01', 'MATH-125', '123456789', 'B');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('01', 'MATH-125', '234567890', 'A');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('01', 'MATH-125', '345678901', 'B+');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('01', 'MATH-125', '456789012', 'B+');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('01', 'MATH-125', '567890123', 'A');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('01', 'MATH-125', '678901234', 'C+');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('01', 'MATH-125', '789012345', 'D');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('01', 'MATH-125', '890123456', 'D+');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('01', 'MATH-125', '901234567', 'A-');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('01', 'MATH-125', '012345678', 'A+');

# 332

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('04', 'CPSC-332', '123456789', 'A-');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('04', 'CPSC-332', '890123456', 'C');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('04', 'CPSC-332', '901234567', 'B');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('04', 'CPSC-332', '456789012', 'B+');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('04', 'CPSC-332', '678901234', 'B+');


# Minor Section --------------------------------------------------------------------------------------------------------------#
INSERT INTO Student_Minors (CWID, DNum)
VALUES ((SELECT CWID FROM Student WHERE St_Fname = 'Rachael' AND St_Lname = 'Greene'), (SELECT DNum FROM Department WHERE D_Name = 'Computer Science'));

INSERT INTO Student_Minors (CWID, DNum)
VALUES ((SELECT CWID FROM Student WHERE St_Fname = 'Louis' AND St_Lname = 'Baldwin'), (SELECT DNum FROM Department WHERE D_Name = 'Computer Science'));

/*QUERIES*/

#Professor queries

SELECT c.C_Title, CS.CNum, CS.MDays, CS.BegTime, CS.EndTime
FROM Professor
INNER JOIN Course_Section CS ON Professor.SSN = CS.Teacher
INNER JOIN Course c ON c.CNum = Course_Section.CNum
WHERE Professor.SSN = '123-45-6789'

	
SELECT Grade, COUNT(*) 
FROM Course c, Course_Section CS, Student_Course_Grade CSG 
WHERE c.CNum = 'MATH-125' 
	AND CS.CNum = c.CNum 
  AND CS.SecNum = '01' 
  AND CSG.CNum = 'MATH-125' 
  AND CSG.SecNum = '01' 
GROUP BY Grade;

#Student Queries

SELECT CS.SecNum, CS.Room, CS.MDays, CS.BegTime, CS.EndTime, COUNT(CSG.CWID)
FROM Course C, Course_Section CS
LEFT JOIN Student_Course_Grade CSG ON CSG.SecNum = CS.SecNum AND CSG.CNum = CS.CNum
WHERE C.CNum = 'MATH-125' AND C.CNum = CS.CNum
  GROUP BY CS.SecNum;

SELECT       
	c.C_Title,
	g.Grade
FROM         
	Student s
	INNER JOIN   Student_Course_Grade g ON g.CWID = s.CWID
	INNER JOIN   Course c ON c.CNUM = g.CNum
WHERE        
	s.CWID = 'cwid'  



