 

use AcademicPerformanceMonitoringSystem; 

-- Case_Job_Postings_With_Category view:

CREATE VIEW Case_Student_Performance AS
SELECT 
    g.GradeID, 
    g.StudentID, 
    g.SubjectID, 
    g.Score,
    CASE 
        WHEN g.Score >= 85 THEN 'Excellent'
        WHEN g.Score >= 70 THEN 'Good'
        WHEN g.Score >= 50 THEN 'Average'
        WHEN g.Score >= 40 THEN 'Needs Improvement'
        ELSE 'Fail'
    END AS PerformanceCategory
FROM Grades g;

select * from Case_Student_Performance;   

-- Categorizing Alerts by Urgency Level

CREATE VIEW Case_Alerts_Urgency AS
SELECT 
    AlertID, 
    StudentID, 
    Type, 
    Message, 
    Timestamp,
    CASE 
        WHEN Type = 'Low Performance' THEN 'High Urgency'
        WHEN Type = 'Absenteeism' THEN 'Medium Urgency'
        ELSE 'Unknown'
    END AS UrgencyLevel
FROM Alerts;

select * from Case_Alerts_Urgency; 

-- Updating Alert Messages Based on Alert Type

UPDATE Alerts 
SET Message = CASE 
    WHEN Type = 'Low Performance' THEN 'Student is underperforming. Immediate academic support needed.'
    WHEN Type = 'Absenteeism' THEN 'Student has been absent frequently. Parent intervention required.'
    ELSE Message  
END;

