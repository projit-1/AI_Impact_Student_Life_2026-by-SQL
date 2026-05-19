create database AIvsStudent;
use AIvsStudent;
select * from AI_Impact_Student;

-- 1. How many students are in the dataset?
SELECT COUNT(*) AS total_students
FROM AI_Impact_Student;

-- 2. What is the average age of students?
SELECT ROUND(AVG(Age),2) AS average_age
FROM AI_Impact_Student;

-- 3. Which AI tool is used by the highest number of students?

SELECT Primary_AI_Tool, COUNT(*) AS total_users
FROM AI_Impact_Student
GROUP BY Primary_AI_Tool
ORDER BY total_users DESC;


-- 4. How much GPA improvement occurred after using AI tools?

SELECT 
    Student_ID,
    GPA_Baseline,
    GPA_Post_AI,
    ROUND((GPA_Post_AI - GPA_Baseline),2) AS GPA_Improvement
FROM AI_Impact_Student;

-- 5. What is the average number of hours saved weekly by students using AI?

SELECT ROUND(AVG(Time_Saved_Hours_Weekly),2) AS avg_time_saved
FROM AI_Impact_Student;

 