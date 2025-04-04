use academicperformancemonitoringsystem; 

-- DATA RETRIVAL VIEWS 

-- View to count the total users in the system
CREATE VIEW Total_Users AS
SELECT COUNT(UserID) AS total_users
FROM Users;

select * from Total_Users;

-- Counting  Users by Role (Admin, Teacher, Student, Parent)
CREATE VIEW User_Role_Count AS
SELECT Role, COUNT(UserID) AS total_users
FROM Users
GROUP BY Role;

select * from User_Role_Count;

-- View to List All Students with Their Class and Enrollment Year
CREATE VIEW StudentDetails AS
SELECT StudentID, UserID, Class, EnrollmentYear
FROM Students;

select * from StudentDetails; 

-- View to List All Teachers and Their Departments 
CREATE VIEW TeacherDetails AS
SELECT TeacherID, UserID, Department
FROM Teachers;

select * from TeacherDetails; 

-- View to List All Parents and Their Contact Information 
CREATE VIEW ParentDetails AS
SELECT ParentID, UserID, ContactInfo, Occupation
FROM Parents;

select * from ParentDetails;

-- View to Retrieve All Student Grades
CREATE VIEW StudentGrades AS
SELECT GradeID, StudentID, SubjectID, Score, ExamDate
FROM Grades;

select * from StudentGrades;

-- View to Count Students per Class
CREATE VIEW Students_Per_Class AS
SELECT Class, COUNT(StudentID) AS total_students
FROM Students
GROUP BY Class;

select * from Students_Per_Class;

-- View to Retrieve All Attendance Records
CREATE VIEW AttendanceRecords AS
SELECT AttendanceID, StudentID, Date, Status
FROM Attendance;

select * from AttendanceRecords;

-- View to Count Students with Low Performance (Score < 50)
CREATE VIEW Low_Performance_Students AS
SELECT COUNT(StudentID) AS total_low_performance_students
FROM Grades
WHERE Score < 50;

select * from Low_Performance_Students; 

-- View to Count Students with High Absenteeism (More Absences than Presence) 
CREATE VIEW High_Absenteeism_Students AS
SELECT StudentID, COUNT(AttendanceID) AS total_absences
FROM Attendance
WHERE Status = 'Absent'
GROUP BY StudentID
HAVING COUNT(AttendanceID) > (
    SELECT COUNT(AttendanceID) / 2 FROM Attendance WHERE Status = 'Present'
);
select * from High_Absenteeism_Students;

-- CREATE VIEW Alert_Type_Count AS
CREATE VIEW Alert_Type_Count AS
SELECT Type, COUNT(AlertID) AS total_alerts
FROM Alerts
GROUP BY Type;

select * from Alert_Type_Count; 

-- View to Summarize Reports Generated by Admins
CREATE VIEW Reports_Per_Admin AS
SELECT GeneratedBy, COUNT(ReportID) AS total_reports
FROM Reports
GROUP BY GeneratedBy;

select * from Reports_Per_Admin; 


-- View to Get the Highest and Lowest Scores in the System
CREATE VIEW Score_Stats AS
SELECT 
    MAX(Score) AS highest_score, 
    MIN(Score) AS lowest_score
FROM Grades;

select * from Score_Stats; 

-- View to Retrieve the Average Score per Subject
CREATE VIEW Subject_Avg_Score AS
SELECT SubjectID, AVG(Score) AS avg_score
FROM Grades
GROUP BY SubjectID;

select * from Subject_Avg_Score;

-- View to Retrieve the Number of Distinct Subjects Taught 
CREATE VIEW Total_Subjects AS
SELECT COUNT(DISTINCT SubjectID) AS distinct_subjects
FROM Subjects;

select * from Total_Subjects;   distinct_subjects

-- View to List All Subjects and Their Teachers 
CREATE VIEW SubjectTeacherDetails AS
SELECT 
    s.SubjectID, 
    s.Name AS SubjectName, 
    t.TeacherID, 
    u.Name AS TeacherName
FROM Subjects s
JOIN Teachers t ON s.TeacherID = t.TeacherID
JOIN Users u ON t.UserID = u.UserID;

select * from SubjectTeacherDetails;