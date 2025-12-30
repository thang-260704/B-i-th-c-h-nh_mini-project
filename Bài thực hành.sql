create database SS04;
use SS04;

CREATE TABLE Student (
    student_id VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE
);
CREATE TABLE Teacher (
    teacher_id VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);
CREATE TABLE Course (
    course_id VARCHAR(20) PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    description TEXT,
    total_sessions INT CHECK (total_sessions > 0),
    teacher_id VARCHAR(20),
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);
CREATE TABLE Enrollment (
    student_id VARCHAR(20),
    course_id VARCHAR(20),
    enrollment_date DATE NOT NULL,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);
CREATE TABLE Score (
    student_id VARCHAR(20),
    course_id VARCHAR(20),
    mid_score DECIMAL(4,2) CHECK (mid_score BETWEEN 0 AND 10),
    final_score DECIMAL(4,2) CHECK (final_score BETWEEN 0 AND 10),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

INSERT INTO Student (student_id, full_name, date_of_birth, email) VALUES
('S01', 'Nguyen Van A', '2003-05-10', 'a@gmail.com'),
('S02', 'Tran Thi B', '2003-08-21', 'b@gmail.com'),
('S03', 'Le Van C', '2002-12-01', 'c@gmail.com'),
('S04', 'Pham Thi D', '2004-02-14', 'd@gmail.com'),
('S05', 'Hoang Van E', '2003-11-30', 'e@gmail.com');

INSERT INTO Teacher (teacher_id, full_name, email) VALUES
('T01', 'Nguyen Van GV1', 'gv1@gmail.com'),
('T02', 'Tran Thi GV2', 'gv2@gmail.com'),
('T03', 'Le Van GV3', 'gv3@gmail.com'),
('T04', 'Pham Thi GV4', 'gv4@gmail.com'),
('T05', 'Hoang Van GV5', 'gv5@gmail.com');

INSERT INTO Course (course_id, course_name, description, total_sessions, teacher_id) VALUES
('C01', 'Lap trinh C', 'Khoa hoc C co ban', 30, 'T01'),
('C02', 'Lap trinh Java', 'Java tu co ban den nang cao', 40, 'T02'),
('C03', 'Co so du lieu', 'MySQL va thiet ke CSDL', 35, 'T03'),
('C04', 'Cau truc du lieu', 'Danh sach, Stack, Queue', 45, 'T04'),
('C05', 'Lap trinh Web', 'HTML, CSS, JS', 25, 'T05');

INSERT INTO Enrollment (student_id, course_id, enrollment_date) VALUES
('S01', 'C01', '2024-01-10'),
('S01', 'C02', '2024-01-12'),
('S02', 'C03', '2024-01-11'),
('S03', 'C01', '2024-01-15'),
('S04', 'C04', '2024-01-20');

INSERT INTO Score (student_id, course_id, mid_score, final_score) VALUES
('S01', 'C01', 7.5, 8.0),
('S01', 'C02', 6.0, 7.0),
('S02', 'C03', 8.0, 8.5),
('S03', 'C01', 5.5, 6.5),
('S04', 'C04', 7.0, 7.8);

UPDATE Student
SET email = 'new_email@gmail.com'
WHERE student_id = 'S01';

UPDATE Course
SET description = 'Khoa hoc Java nang cao, lap trinh OOP'
WHERE course_id = 'C02';

UPDATE Score
SET final_score = 9.0
WHERE student_id = 'S01' AND course_id = 'C01';

DELETE FROM Enrollment
WHERE student_id = 'S03' AND course_id = 'C01';

DELETE FROM Score
WHERE student_id = 'S03' AND course_id = 'C01';

SELECT * FROM Student;

SELECT * FROM Teacher;

SELECT * FROM Course;

SELECT * FROM Enrollment;

SELECT * FROM Score;
