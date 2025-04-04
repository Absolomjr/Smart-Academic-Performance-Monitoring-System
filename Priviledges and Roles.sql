use academicPerformanceMonitoringSystem; 

-- -- Create Admin User
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'AdminPass123';

-- Create Teacher User
CREATE USER 'teacher_user'@'localhost' IDENTIFIED BY 'TeacherPass123';

-- Create Student User
CREATE USER 'student_user'@'localhost' IDENTIFIED BY 'StudentPass123';

-- Create Parent User
CREATE USER 'parent_user'@'localhost' IDENTIFIED BY 'ParentPass123';



-- GRANTING PRIVILEGES TO THE USERS

-- Granting all privileges to the admin user
GRANT ALL PRIVILEGES ON AcademicPerformanceMonitoringSystem.* TO 'admin_user'@'localhost';

-- Teacher Role (Manage Grades & Attendance)
-- Teachers should be able to view and insert grades, attendance, but not delete users or modify alerts.

GRANT SELECT, INSERT, UPDATE ON Grades TO 'teacher_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Attendance TO 'teacher_user'@'localhost';
GRANT SELECT ON Students TO 'teacher_user'@'localhost';
GRANT SELECT ON Subjects TO 'teacher_user'@'localhost';


-- Student Role (View Own Performance)
-- Students should only view their own reports, grades, and attendance. 
GRANT SELECT ON Grades TO 'student_user'@'localhost';
GRANT SELECT ON Reports TO 'student_user'@'localhost';
GRANT SELECT ON Attendance TO 'student_user'@'localhost';


-- Parent Role (View Child’s Performance)
-- Parents should only view their child’s records. 
GRANT SELECT ON Students TO 'parent_user'@'localhost';
GRANT SELECT ON Grades TO 'parent_user'@'localhost';
GRANT SELECT ON Attendance TO 'parent_user'@'localhost';
GRANT SELECT ON Alerts TO 'parent_user'@'localhost';


-- Enforce Security
-- Prevent Users from Granting More Privileges 
REVOKE GRANT OPTION ON *.* FROM 'admin_user'@'localhost';
REVOKE GRANT OPTION ON *.* FROM 'teacher_user'@'localhost';
REVOKE GRANT OPTION ON *.* FROM 'student_user'@'localhost';
REVOKE GRANT OPTION ON *.* FROM 'parent_user'@'localhost';


FLUSH PRIVILEGES;
