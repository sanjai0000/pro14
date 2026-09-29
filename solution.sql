CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Create Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Create Course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

-- Create Enrollment table
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Insert sample values into Department
INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Electronics');

-- Insert sample values into Student
INSERT INTO Student VALUES
(101, 'Arun', 1),
(102, 'Priya', 2),
(103, 'Karthik', 1);

-- Insert sample values into Course
INSERT INTO Course VALUES
(201, 'Database Management'),
(202, 'Operating Systems'),
(203, 'Computer Networks');

-- Insert sample values into Enrollment
INSERT INTO Enrollment VALUES
(1, 101, 201),
(2, 101, 202),
(3, 102, 203),
(4, 103, 201);

-- Create the view
CREATE VIEW StudentDetails AS
SELECT
    S.StudentName,
    C.CourseName,
    D.DepartmentName
FROM Student S
JOIN Enrollment E
    ON S.StudentID = E.StudentID
JOIN Course C
    ON E.CourseID = C.CourseID
JOIN Department D
    ON S.DepartmentID = D.DepartmentID;

-- Display the view
SELECT * FROM StudentDetails;
