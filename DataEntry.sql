use academicperformancemonitoringsystem;

-- inserting into the users table


-- Inserting into Admins table
INSERT INTO Users (UserID, Name, Email, Password, Role, Contact)
VALUES
('U001', 'Solomy Sanyu', 'solomy.sanyu@gmail.com', 'hashedpassword123', 'Admin', '+256701234567'),
('U002', 'Dorcus Kaggoya', 'dorcus.kaggoya@gmail.com', 'hashedpassword456', 'Admin', '+256702345678');

-- Insert Teachers
INSERT INTO Users (UserID, Name, Email, Password, Role, Contact)
VALUES
('U003', 'James Okello', 'james.okello@gmail.com', 'hashedpassword111', 'Teacher', '+256703456789'),
('U004', 'Grace Nabwire', 'grace.nabwire@gmail.com', 'hashedpassword222', 'Teacher', '+256704567890'),
('U005', 'Daniel Mugisha', 'daniel.mugisha@gmail.com', 'hashedpassword333', 'Teacher', '+256705678901'),
('U006', 'Harriet Namubiru', 'harriet.namubiru@gmail.com', 'hashedpassword444', 'Teacher', '+256706789012'),
('U007', 'Robert Ssenyonga', 'robert.ssenyonga@gmail.com', 'hashedpassword555', 'Teacher', '+256707890123'),
('U008', 'Brenda Nakato', 'brenda.nakato@gmail.com', 'hashedpassword666', 'Teacher', '+256708901234');

-- Insert Students
INSERT INTO Users (UserID, Name, Email, Password, Role, Contact)
VALUES
('U009', 'Travis Lufene', 'travis.lufene@gmail.com', 'hashedpassword777', 'Student', '+256709012345'),
('U010', 'Lynn Amoit', 'lynn.amoit@gmail.com', 'hashedpassword888', 'Student', '+256710123456'),
('U011', 'Humphrey Mubiru', 'humphrey.mubiru@gmail.com', 'hashedpassword999', 'Student', '+256711234567'),
('U012', 'Denise Priscilla', 'denise.priscilla@gmail.com', 'hashedpassword101', 'Student', '+256712345678'),
('U013', 'Allan Ssebatta', 'allan.ssebatta@gmail.com', 'hashedpassword202', 'Student', '+256713456789'),
('U014', 'Nicole Mbabazi', 'nicole.mbabazi@gmail.com', 'hashedpassword303', 'Student', '+256714567890'),
('U015', 'Emmanuel Kizito', 'emmanuel.kizito@gmail.com', 'hashedpassword404', 'Student', '+256715678901');

-- Insert Parents
INSERT INTO Users (UserID, Name, Email, Password, Role, Contact)
VALUES
('U016', 'Margaret Tumwine', 'margaret.tumwine@gmail.com', 'hashedpassword505', 'Parent', '+256716789012'),
('U017', 'Joseph Lwanga', 'joseph.lwanga@gmail.com', 'hashedpassword606', 'Parent', '+256717890123'),
('U018', 'Beatrice Namaganda', 'beatrice.namaganda@gmail.com', 'hashedpassword707', 'Parent', '+256718901234'),
('U019', 'Fredrick Mugerwa', 'fredrick.mugerwa@gmail.com', 'hashedpassword808', 'Parent', '+256719012345'),
('U020', 'Annet Nakiyingi', 'annet.nakiyingi@gmail.com', 'hashedpassword909', 'Parent', '+256720123456'),
('U021', 'John Kateregga', 'john.kateregga@gmail.com', 'hashedpassword010', 'Parent', '+256721234567');

select * from users;

-- inserting into the teachers table

INSERT INTO Teachers (TeacherID, UserID, Department)
VALUES
('T001', 'U003', 'Computing'),
('T002', 'U004', 'Engineering'),
('T003', 'U005', 'Business'),
('T004', 'U006', 'Journalism'),
('T005', 'U007', 'Medicine'),
('T006', 'U008', 'Social Work');

select * from teachers; 

-- Inserting Parents into the Parents table
INSERT INTO Parents (ParentID, UserID, Occupation, ContactInfo)
VALUES
('P001', 'U016', 'Business Owner', '+256716789012'),
('P002', 'U017', 'Engineer', '+256717890123'),
('P003', 'U018', 'Teacher', '+256718901234'),
('P004', 'U019', 'Doctor', '+256719012345'),
('P005', 'U020', 'Journalist', '+256720123456'),
('P006', 'U021', 'Social Worker', '+256721234567');

select * from parents;

-- Insert Students into the Students table 
INSERT INTO Students (StudentID, UserID, Class, ParentID, EnrollmentYear)
VALUES
('ST001', 'U009', 'Year 1 - Computer Science', 'P001', 2024),
('ST002', 'U010', 'Year 1 - Engineering', 'P002', 2024),
('ST003', 'U011', 'Year 1 - Business', 'P003', 2024),
('ST004', 'U012', 'Year 1 - Journalism', 'P004', 2024),
('ST005', 'U013', 'Year 2 - Medicine', 'P005', 2023),
('ST006', 'U014', 'Year 2 - Social Work', 'P006', 2023),
('ST007', 'U015', 'Year 1 - Computing', 'P001', 2024);

select * from students;
-- Insert Admins into the Admins table
INSERT INTO Admins (AdminID, UserID, RoleDescription)
VALUES
('A001', 'U001', 'Responsible for overseeing the entire academic management system and ensuring smooth operations.'),
('A002', 'U002', 'Responsible for coordinating academic policies and handling administrative functions for students and staff.');

select * from admins;

-- Insert Subjects into the Subjects table 
INSERT INTO Subjects (SubjectID, Name, TeacherID)
VALUES
('S001', 'Introduction to Computing', 'T001'),
('S002', 'Advanced Engineering Mathematics', 'T002'),
('S003', 'Principles of Business', 'T003'),
('S004', 'Journalism and Media Studies', 'T004'),
('S005', 'Medical Terminology', 'T005'),
('S006', 'Social Work and Welfare', 'T006');

-- Inserting Grades into the Grades table
INSERT INTO Grades (GradeID, StudentID, SubjectID, Score, ExamDate)
VALUES
('G001', 'ST001', 'S001', 85.50, '2024-06-15'),
('G002', 'ST002', 'S002', 35.00, '2024-06-16'),  
('G003', 'ST003', 'S003', 78.20, '2024-06-17'),
('G004', 'ST004', 'S004', 82.30, '2024-06-18'),
('G005', 'ST005', 'S005', 88.50, '2023-06-15'),
('G006', 'ST006', 'S006', 91.00, '2023-06-16'),
('G007', 'ST007', 'S001', 34.50, '2024-06-19');  

-- Inserting values into the Attendance table
INSERT INTO Attendance (AttendanceID, StudentID, Date, Status)
VALUES
('AT001', 'ST001', '2024-06-15', 'Present'),
('AT002', 'ST002', '2024-06-15', 'Absent'),
('AT003', 'ST003', '2024-06-16', 'Present'),
('AT004', 'ST004', '2024-06-16', 'Absent'),
('AT005', 'ST005', '2024-06-17', 'Present'),
('AT006', 'ST006', '2024-06-17', 'Present'),
('AT007', 'ST007', '2024-06-18', 'Absent');

select * from attendance;

-- Insert values into the Alerts table
INSERT INTO Alerts (AlertID, StudentID, Type, Message)
VALUES
('AL001', 'ST001', 'Low Performance', 'Student has scored below the required threshold for the exam.'),
('AL002', 'ST002', 'Absenteeism', 'Student has missed several classes without proper justification.'),
('AL003', 'ST003', 'Low Performance', 'Student needs to improve performance in the upcoming exam.'),
('AL004', 'ST004', 'Absenteeism', 'Student has not attended classes for over a week.'),
('AL005', 'ST005', 'Low Performance', 'Student is showing signs of struggling in course assessments.'),
('AL006', 'ST006', 'Absenteeism', 'Student has been absent for 3 consecutive classes.'),
('AL007', 'ST007', 'Low Performance', 'Student is at risk of failing the course based on performance.'); 

select * from alerts;

-- Insert values into the Reports table
INSERT INTO Reports (ReportID, StudentID, GeneratedBy, PerformanceSummary)
VALUES
('RP001', 'ST001', 'A001', 'Student has shown excellent performance in all subjects.'),
('RP002', 'ST002', 'A002', 'Student needs improvement in mathematics and science.'),
('RP003', 'ST003', 'A001', 'Student has been consistent with good performance.'),
('RP004', 'ST004', 'A002', 'Student has been absent frequently, affecting performance.'),
('RP005', 'ST005', 'A001', 'Student is improving but requires extra attention in physics.'),
('RP006', 'ST006', 'A002', 'Student has outstanding grades and great participation in class.'),
('RP007', 'ST007', 'A001', 'Student is at risk of failing due to poor performance in multiple subjects.');

select * from reports;