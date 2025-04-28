
use academicperformancemonitoringsystem;

-- Trigger to automatically Generate Alert for Low Grades
-- If a student's score is below 40%, an alert is generated
DELIMITER //
CREATE TRIGGER Generate_Alert_Low_Performance
AFTER INSERT ON Grades
FOR EACH ROW
BEGIN
    IF NEW.Score < 40 THEN
        INSERT INTO Alerts (AlertID, StudentID, Type, Message)
        VALUES (UUID(), NEW.StudentID, 'Low Performance', 'Student scored below 40%. Immediate attention required.');
    END IF;
END /

-- Trigger to insert Absenteeism Alert
-- If a student is marked absent, an alert is automatically generated.
CREATE TRIGGER Generate_Alert_Absenteeism
AFTER INSERT ON Attendance
FOR EACH ROW
BEGIN
    IF NEW.Status = 'Absent' THEN
        INSERT INTO Alerts (AlertID, StudentID, Type, Message)
        VALUES (UUID(), NEW.StudentID, 'Absenteeism', 'Student was absent on ' || NEW.Date);
    END IF;
END /

-- Trigger to Prevent Deletion of Admin Accounts
-- If a user is an Admin, deletion is blocked. 

CREATE TRIGGER Prevent_Admin_Deletion
BEFORE DELETE ON Users
FOR EACH ROW
BEGIN
    IF OLD.Role = 'Admin' THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Admins cannot be deleted!';
    END IF;
END /

-- Trigger to automatically Update Report Date When Modified 
-- If a report is modified, the date is automatically updated.

CREATE TRIGGER Update_Report_Date
BEFORE UPDATE ON Reports
FOR EACH ROW
BEGIN
    SET NEW.ReportDate = CURDATE();
END /

-- Trigger to assign Default Password on New User Creation
-- If a new user is created without a password, a default hashed password is assigned.

CREATE TRIGGER Default_User_Password
BEFORE INSERT ON Users
FOR EACH ROW
BEGIN
    IF NEW.Password IS NULL OR NEW.Password = '' THEN
        SET NEW.Password = SHA2('ChangeMe123', 256);
    END IF;
END /
