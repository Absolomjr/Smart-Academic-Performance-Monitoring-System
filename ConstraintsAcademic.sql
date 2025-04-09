use academicperformancemonitoringsystem;

-- APPLICATION OF CONSTRAINTS 

-- Ensuring emails contain '@' symbol
ALTER TABLE Users ADD CONSTRAINT users_email_format CHECK (Email LIKE '%@%');

-- Ensuring emails are unique
ALTER TABLE Users ADD CONSTRAINT users_email_unique UNIQUE (Email);

-- Ensuring contact numbers are unique
ALTER TABLE Users ADD CONSTRAINT users_contact_unique UNIQUE (Contact);

-- name should be in capital letters
alter table Users add constraint users_name check (name=upper(name))

-- Ensuring user roles are valid (Admin, Teacher, Student, Parent)
ALTER TABLE Users ADD CONSTRAINT users_role_check CHECK (Role IN ('Admin', 'Teacher', 'Student', 'Parent'));

-- Ensuring department names are not empty
ALTER TABLE Teachers ADD CONSTRAINT teachers_department_not_empty CHECK (Department <> '');

-- Ensuring parent occupations are not empty
ALTER TABLE Parents ADD CONSTRAINT parents_occupation_not_empty CHECK (Occupation <> '');

-- Ensuring parent contact info is unique
ALTER TABLE Parents ADD CONSTRAINT parents_contact_unique UNIQUE (ContactInfo);


-- Ensuring subject names are unique and not empty
ALTER TABLE Subjects ADD CONSTRAINT subjects_name_unique UNIQUE (Name);
ALTER TABLE Subjects ADD CONSTRAINT subjects_name_not_empty CHECK (Name <> '');

-- Ensuring grade scores are between 0 and 100
ALTER TABLE Grades ADD CONSTRAINT grades_score_range CHECK (Score BETWEEN 0 AND 100);

-- Ensuring attendance status is either 'Present' or 'Absent'
ALTER TABLE Attendance ADD CONSTRAINT attendance_status_check CHECK (Status IN ('Present', 'Absent'));

-- Ensuring alert type is either 'Low Performance' or 'Absenteeism'
ALTER TABLE Alerts ADD CONSTRAINT alerts_type_check CHECK (Type IN ('Low Performance', 'Absenteeism'));

-- Ensuring alert messages are at least 5 characters long
ALTER TABLE Alerts ADD CONSTRAINT alerts_message_length CHECK (LENGTH(Message) > 5);

-- Ensuring performance summary is at least 5 characters long
ALTER TABLE Reports ADD CONSTRAINT reports_performance_summary_length CHECK (LENGTH(PerformanceSummary) > 5);
