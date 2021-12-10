-- clear tables
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS professors;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS sections;
DROP TABLE IF EXISTS encrollment_record;

-- creating tables --
CREATE TABLE students (
    CampusID TEXT,
    Fname TEXT,
    Lname TEXT,
    Student_Address TEXT,
    Student_Phone TEXT,
    Major TEXT
);

CREATE TABLE professors (
    SSN TEXT,
    Professor_Name TEXT,
    Address TEXT,
    Telephone TEXT,
    Sex TEXT,
    Title TEXT,
    Salary TEXT,
    Degree TEXT
);

CREATE TABLE departments (
    Department_Number TEXT,
    Department_Name TEXT,
    Telephone TEXT,
    Office_Location TEXT,
    Chairperson_SSN TEXT
);

CREATE TABLE courses (
    Course_Number TEXT,
    Title TEXT,
    Textbook TEXT,
    Units TEXT,
    Prereq TEXT,
    Department TEXT
);

CREATE TABLE sections (
    CNum TEXT,
    Section_Number TEXT,
    Classroom TEXT,
    Seats TEXT,
    Meeting_Time TEXT,
    Professor_SSN TEXT
);

CREATE TABLE enrollment_record (
    CampusID TEXT,
    Course_Number TEXT,
    Section_Number TEXT,
    Grade TEXT
);

-- inserting data into tables --
-- students data
INSERT INTO students VALUES ('393616710', 'Spike', 'Spiegel', '1923  Buffalo Creek Road Hendersonville, TN 37075', '615-826-9110', 'PSYC');
INSERT INTO students VALUES ('754073777', 'Joseph', 'Joestar', '547  Green Street Delavan, WI 53115', '615-579-8495', 'CPSC');
INSERT INTO students VALUES ('17870138', 'Naomi', 'Misora', '4296 Eastland Avenue Jackon, MS 39201', '601-355-7975', 'WGST');
INSERT INTO students VALUES ('230332796', 'Amelia', 'Camelia', '1298 Langtown Road Bettendorf, IA 52722', '563-742-9457', 'PSYC');
INSERT INTO students VALUES ('649383486', 'Patricia', 'Martin', '4190 Elm Drive Satin, TX 76685', '214-868-2991', 'CPSC');
INSERT INTO students VALUES ('709582224', 'Sarah ', 'McDougal', '2161 Hilltop Haven Drive Los Angeles, 90001', '973-878-1530', 'WGST');
INSERT INTO students VALUES ('7248858017', 'Chiharu', 'Aoki', '2056 Timber Ridge Road Greensboro, NC 27410', '916-835-1891', 'PSYC');
INSERT INTO students VALUES ('8770960811', 'Terry', 'Bogard', '2540 Paradise Lane San Diego, CA 92103', '909-706-1805', 'CPSC');

-- professors data
INSERT INTO professors VALUES ('475-01-8605', 'Danny Gold', '3137  Doctors Drive Los Angeles, CA 90017', '310-341-3115', 'Non-binary', 'Associate Professor', '$70,939', 'Bachelor of Arts: Women and Gender Studies');
INSERT INTO professors VALUES ('648-12-6373', 'Penelope Archer', '2890  Zimmerman Lane Los Angeles, CA 90026', '562-418-8558', 'Female', 'Full Professor', '$81,330', 'Master of Arts: Psycology');
INSERT INTO professors VALUES ('420-67-8433', 'Fawn Coyote', '4713  Liberty Avenue Buena Park, CA 90621', '714-521-5258', 'Female', 'Adjunct Professor', '$75,580', 'Doctor of Veterinary Medicine');
INSERT INTO professors VALUES ('625-35-5831', 'Alan Turning', '2580  Hillcrest Lane Irvine, CA 92714', '949-794-2187', 'Male', 'Full Professor', '$113,190', 'Doctorate of Philosophy: Computer Science');

-- departments data
INSERT INTO departments VALUES ('PSYC', 'Department of Psycology', '657-278-3514', 'Fullerton Campus', '648-12-6373');
INSERT INTO departments VALUES ('CPSC', 'Department of Computer Science', '657-278-5987', 'Irvine Campus', '625-35-5831');
INSERT INTO departments VALUES ('WGST', 'Department of Women and Gender Studies', '657-278-3888', 'Fullerton Campus', '475-01-8605');

-- courses data
INSERT INTO courses VALUES ('CPSC 332', 'File Structures and Database Systems', 'Fundamentals of Database Systems', '3', 'CPSC 131', 'CPSC');
INSERT INTO courses VALUES ('CPSC 131', 'Data Structures', 'Data Structures and Algorithms in C++', '3', '', 'CPSC'); -- no pre-req
INSERT INTO courses VALUES ('PSYC 101', 'Introduction to Psychology', 'Introduction to Psychology', '3', '', 'PSYC'); -- no pre-req
INSERT INTO courses VALUES ('WGST 360 ', 'Politics of Sexuality', 'The Politics of Sexuality', '3', 'WGST 100', 'WGST');

-- sections data
INSERT INTO sections VALUES ('CPSC 332', '1', 'CS-522', '35', 'MW 8:30a - 9:45a', '625-35-5831');
INSERT INTO sections VALUES ('CPSC 332', '2', 'CS-522', '35', 'TTH 8:30a - 9:45a', '625-35-5831');
INSERT INTO sections VALUES ('PSYC 101', '1', 'SOCI-303', '42', 'MW 10:15a - 11:30a', '648-12-6373');
INSERT INTO sections VALUES ('PSYC 101', '2', 'SOCI-303', '42', 'TTH 10:15a - 11:30a', '648-12-6373');
INSERT INTO sections VALUES ('WGST 360', '5', 'HUM-201', '38', 'MW 12:00p - 1:15p', '475-01-8605');
INSERT INTO sections VALUES ('WGST 360', '6', 'HUM-201', '38', 'TTH 12:00p  - 1:15p', '475-01-8605');

-- enrollment_record data
INSERT INTO enrollment_record VALUES ('17870138', 'CPSC 332', '1', 'A+');
INSERT INTO enrollment_record VALUES ('17870138', 'PSYC 101', '1', 'A');
INSERT INTO enrollment_record VALUES ('17870138', 'WGST 360', '5', 'B+');
INSERT INTO enrollment_record VALUES ('230332796', 'CPSC 332', '1', 'A+');
INSERT INTO enrollment_record VALUES ('230332796', 'PSYC 101', '2', 'C');
INSERT INTO enrollment_record VALUES ('230332796', 'WGST 360', '6', 'C-');
INSERT INTO enrollment_record VALUES ('393616710', 'CPSC 332', '2', 'B-');
INSERT INTO enrollment_record VALUES ('393616710', 'PSYC 101', '2', 'B');
INSERT INTO enrollment_record VALUES ('393616710', 'WGST 360', '6', 'A-');
INSERT INTO enrollment_record VALUES ('649383486', 'CPSC 332', '2', 'B+');
INSERT INTO enrollment_record VALUES ('649383486', 'PSYC 101', '1', 'A-');
INSERT INTO enrollment_record VALUES ('709582224', 'PSYC 101', '1', 'A+');
INSERT INTO enrollment_record VALUES ('709582224', 'WGST 360', '6', 'C+');
INSERT INTO enrollment_record VALUES ('754073777', 'CPSC 332', '2', 'A-');
INSERT INTO enrollment_record VALUES ('754073777', 'PSYC 101', '1', 'B-');
INSERT INTO enrollment_record VALUES ('754073777', 'WGST 360', '6', 'C+');
INSERT INTO enrollment_record VALUES ('7248858017', 'CPSC 332', '1', 'A');
INSERT INTO enrollment_record VALUES ('7248858017', 'PSYC 101', '1', 'A');
INSERT INTO enrollment_record VALUES ('8770960811', 'CPSC 332', '2', 'B-');
INSERT INTO enrollment_record VALUES ('8770960811', 'WGST 360', '6', 'C-');






