
use AcademicPerformanceMonitoringSystem;


-- Users Table
CREATE TABLE Users (
    UserID VARCHAR(30) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Role ENUM('Admin', 'Teacher', 'Student', 'Parent') NOT NULL,
    Contact VARCHAR(50)
);


desc Users;

-- Students Table
CREATE TABLE Students (
    StudentID VARCHAR(30) PRIMARY KEY,
    UserID VARCHAR(30),
    Class VARCHAR(50) NOT NULL,
    ParentID VARCHAR(30),
    EnrollmentYear YEAR NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (ParentID) REFERENCES Parents(ParentID) ON DELETE CASCADE
);


desc Students;

-- Teachers Table
CREATE TABLE Teachers (
    TeacherID VARCHAR(30) PRIMARY KEY,
    UserID VARCHAR(30),
    Department VARCHAR(100) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);




desc Teachers;

-- Parents Table
CREATE TABLE Parents (
    ParentID VARCHAR(30) PRIMARY KEY,
    UserID VARCHAR(30),
    Occupation VARCHAR(100),
    ContactInfo VARCHAR(100),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

;
desc parents;

-- Admins Table
CREATE TABLE Admins (
    AdminID VARCHAR(30) PRIMARY KEY,
    UserID VARCHAR(30),
    RoleDescription TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE 
);



desc admins;

-- Subjects Table
CREATE TABLE Subjects (
    SubjectID VARCHAR(30) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    TeacherID VARCHAR(30),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID) ON DELETE CASCADE
);

desc subjects;

-- Grades Table
CREATE TABLE Grades (
    GradeID VARCHAR(30) PRIMARY KEY,
    StudentID VARCHAR(30),
    SubjectID VARCHAR(30),
    Score DECIMAL(5,2) CHECK (Score BETWEEN 0 AND 100),
    ExamDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID) ON DELETE CASCADE
);



desc grades;

-- Attendance Table
CREATE TABLE Attendance (
    AttendanceID VARCHAR(30) PRIMARY KEY,
    StudentID VARCHAR(30),
    Date DATE NOT NULL,
    Status ENUM('Present', 'Absent') NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE
);



desc attendance;

-- Alerts Table
CREATE TABLE Alerts (
    AlertID VARCHAR(30) PRIMARY KEY,
    StudentID VARCHAR(30),
    Type ENUM('Low Performance', 'Absenteeism') NOT NULL,
    Message TEXT,
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE
);



desc alerts;

-- Reports Table
CREATE TABLE Reports (
    ReportID VARCHAR(30) PRIMARY KEY,
    StudentID VARCHAR(30),
    GeneratedBy VARCHAR(30),
    ReportDate DATE DEFAULT (CURRENT_DATE),
    PerformanceSummary TEXT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (GeneratedBy) REFERENCES Admins(AdminID) ON DELETE CASCADE
);




desc reports;

-- Triggers & Stored Procedures
-- DELIMITER //
-- CREATE TRIGGER Generate_Alert 
-- AFTER INSERT ON Grades
-- FOR EACH ROW
-- BEGIN
--     IF NEW.Score < 40 THEN
--         INSERT INTO Alerts (StudentID, Type, Message)
--         VALUES (NEW.StudentID, 'Low Performance', 'Student scored below 40%. Immediate attention required.');
--     END IF;
-- END //
-- DELIMITER ;

-- DELIMITER //
-- CREATE PROCEDURE Generate_Report(IN student_id INT)
-- BEGIN
--     INSERT INTO Reports (StudentID, GeneratedBy, PerformanceSummary)
--     VALUES (student_id, (SELECT AdminID FROM Admins LIMIT 1), 'Performance analysis generated.');
-- END //
-- DELIMITER ;
