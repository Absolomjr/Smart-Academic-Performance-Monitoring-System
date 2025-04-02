use academicperformancemonitoringsystem; 

-- NATURAL JOINS
-- Retrieve All Students with Their User Information

CREATE VIEW StudentUserView AS
SELECT 
    StudentID, 
    Name AS StudentName, 
    Email, 
    Contact, 
    Class, 
    EnrollmentYear
FROM Students
NATURAL JOIN Users;

select * from StudentUserView;

-- View for Teachers and Their Departments 
CREATE VIEW TeacherDepartmentView AS
SELECT 
    TeacherID, 
    Name AS TeacherName, 
    Department
FROM Teachers
NATURAL JOIN Users;

select * from TeacherDepartmentView;  

-- LEFT JOINS:
-- View for Students and Their Parents 
CREATE VIEW StudentParentView AS
SELECT 
    s.StudentID, 
    u.Name AS StudentName, 
    p.ParentID, 
    pu.Name AS ParentName, 
    p.ContactInfo AS ParentContact
FROM Students s
LEFT JOIN Users u ON s.UserID = u.UserID
LEFT JOIN Parents p ON s.ParentID = p.ParentID
LEFT JOIN Users pu ON p.UserID = pu.UserID;

select * from StudentParentView;

 
-- View for Students and Their Attendance Records 
CREATE VIEW StudentAttendanceView AS
SELECT 
    s.StudentID, 
    u.Name AS StudentName, 
    a.AttendanceID, 
    a.Date, 
    a.Status
FROM Students s
LEFT JOIN Users u ON s.UserID = u.UserID
LEFT JOIN Attendance a ON s.StudentID = a.StudentID;

select * from StudentAttendanceView;


-- View for Students and Their Grades
CREATE VIEW StudentGradesView AS
SELECT 
    s.StudentID, 
    u.Name AS StudentName, 
    g.GradeID, 
    g.SubjectID, 
    g.Score, 
    g.ExamDate
FROM Students s
LEFT JOIN Users u ON s.UserID = u.UserID
LEFT JOIN Grades g ON s.StudentID = g.StudentID;

select * from StudentGradesView;


-- RIGHT JOIN: 
-- View for Subjects and Their Teachers 
CREATE VIEW SubjectTeacherView AS
SELECT 
    t.TeacherID, 
    u.Name AS TeacherName, 
    s.SubjectID, 
    s.Name AS SubjectName
FROM Subjects s
RIGHT JOIN Teachers t ON s.TeacherID = t.TeacherID
RIGHT JOIN Users u ON t.UserID = u.UserID
WHERE u.Role = 'Teacher';


select * from SubjectTeacherView;

-- View for Admins and Their Reports 
CREATE VIEW AdminReportsView AS
SELECT 
    a.AdminID, 
    u.Name AS AdminName, 
    r.ReportID, 
    r.ReportDate, 
    r.PerformanceSummary
FROM Reports r
RIGHT JOIN Admins a ON r.GeneratedBy = a.AdminID
RIGHT JOIN Users u ON a.UserID = u.UserID;

select * from AdminReportsView;

-- USE OF THE INNER JOINS in Full outer joins
-- View for Parents and Their Assigned Students
CREATE VIEW ParentStudentView AS
SELECT 
    p.ParentID, 
    pu.Name AS ParentName, 
    p.ContactInfo, 
    s.StudentID, 
    u.Name AS StudentName, 
    s.Class
FROM Parents p
INNER JOIN Users pu ON p.UserID = pu.UserID
INNER JOIN Students s ON p.ParentID = s.ParentID
INNER JOIN Users u ON s.UserID = u.UserID;

select * from ParentStudentView;










