create database AIvsStudent;
use AIvsStudent;
select * from AI_Impact_Student;

-- 1. Average GPA Improvement by Major
SELECT 
    Major,
    ROUND(AVG(GPA_Post_AI - GPA_Baseline),2) AS avg_gpa_improvement
FROM AI_Impact_Student
GROUP BY Major
ORDER BY avg_gpa_improvement DESC;

-- 2. Top 3 Most Used AI Tools
SELECT 
    Primary_AI_Tool,
    COUNT(*) AS total_users
FROM AI_Impact_Student
GROUP BY Primary_AI_Tool
ORDER BY total_users DESC
LIMIT 3;

-- 3. Students With Above Average GPA After AI
SELECT 
    Student_ID,
    GPA_Post_AI
FROM AI_Impact_Student
WHERE GPA_Post_AI >
(
    SELECT AVG(GPA_Post_AI)
    FROM AI_Impact_Student
);

-- 4. Average Time Saved by AI Tool
SELECT 
    Primary_AI_Tool,
    ROUND(AVG(Time_Saved_Hours_Weekly),2) AS avg_time_saved
FROM AI_Impact_Student
GROUP BY Primary_AI_Tool
ORDER BY avg_time_saved DESC;

-- 5. Daily AI Usage Frequency Category

SELECT 
    Student_ID,
    Task_Frequency_Daily,
    CASE
        WHEN Task_Frequency_Daily >= 15 THEN 'Heavy User'
        WHEN Task_Frequency_Daily >= 8 THEN 'Moderate User'
        ELSE 'Low User'
    END AS usage_category
FROM AI_Impact_Student;

-- 6. Highest GPA Improvement
SELECT 
    Student_ID,
    Major,
    ROUND((GPA_Post_AI - GPA_Baseline),2) AS improvement
FROM AI_Impact_Student
ORDER BY improvement DESC
LIMIT 5;

-- 7. Ethics Concern Percentage
SELECT 
    AI_Ethics_Concern,
    ROUND(COUNT(*) * 100.0 / 
    (SELECT COUNT(*) FROM AI_Impact_Student),2) AS percentage
FROM AI_Impact_Student
GROUP BY AI_Ethics_Concern;

-- 8. Average Career Confidence by Major

SELECT 
    Major,
    ROUND(AVG(Career_Confidence_Score),2) AS avg_confidence
FROM AI_Impact_Student
GROUP BY Major
ORDER BY avg_confidence DESC;

-- 9. Students Saving Less Than Average Time

SELECT 
    Student_ID,
    Time_Saved_Hours_Weekly
FROM AI_Impact_Student
WHERE Time_Saved_Hours_Weekly <
(
    SELECT AVG(Time_Saved_Hours_Weekly)
    FROM AI_Impact_Student
);

-- 10. Most Common Usage Case Per Major
SELECT 
    Major,
    Main_Usage_Case,
    COUNT(*) AS total_usage
FROM AI_Impact_Student
GROUP BY Major, Main_Usage_Case
ORDER BY Major, total_usage DESC;

-- 11. GPA Improvement Percentage

SELECT 
    Student_ID,
    ROUND(
        ((GPA_Post_AI - GPA_Baseline) / GPA_Baseline) * 100,
        2
    ) AS improvement_percentage
FROM AI_Impact_Student;

-- 12. Average GPA by Ethics Concern
SELECT 
    AI_Ethics_Concern,
    ROUND(AVG(GPA_Post_AI),2) AS avg_gpa
FROM AI_Impact_Student
GROUP BY AI_Ethics_Concern;

-- 13. Students Using AI More Than 10 Times Daily

SELECT 
    Student_ID,
    Major,
    Task_Frequency_Daily
FROM AI_Impact_Student
WHERE Task_Frequency_Daily > 10;

-- 14. AI Tool With Highest Career Confidence

SELECT 
    Primary_AI_Tool,
    ROUND(AVG(Career_Confidence_Score),2) AS avg_confidence
FROM AI_Impact_Student
GROUP BY Primary_AI_Tool
ORDER BY avg_confidence DESC;

-- 15. Count Students by Major
SELECT 
    Major,
    COUNT(*) AS total_students
FROM AI_Impact_Student
GROUP BY Major
ORDER BY total_students DESC;

-- 16. Average Daily Usage by Usage Case
SELECT 
    Main_Usage_Case,
    ROUND(AVG(Task_Frequency_Daily),2) AS avg_daily_usage
FROM AI_Impact_Student
GROUP BY Main_Usage_Case
ORDER BY avg_daily_usage DESC;

-- 17. Students With Low Ethics Concern and High GPA

SELECT 
    Student_ID,
    GPA_Post_AI,
    AI_Ethics_Concern
FROM AI_Impact_Student
WHERE AI_Ethics_Concern = 'Low'
AND GPA_Post_AI > 3.5;

-- 18. Rank Students by Time Saved

SELECT 
    Student_ID,
    Time_Saved_Hours_Weekly,
    RANK() OVER(
        ORDER BY Time_Saved_Hours_Weekly DESC
    ) AS ranking
FROM AI_Impact_Student;

-- 19. Average GPA Before vs After AI

SELECT 
    ROUND(AVG(GPA_Baseline),2) AS avg_before_ai,
    ROUND(AVG(GPA_Post_AI),2) AS avg_after_ai
FROM AI_Impact_Student;

-- 20. Students With Career Confidence Above 8

SELECT 
    Student_ID,
    Major,
    Career_Confidence_Score
FROM AI_Impact_Student
WHERE Career_Confidence_Score > 8
ORDER BY Career_Confidence_Score DESC;

-- 21. Rank AI Tools by GPA Improvement

SELECT 
    Primary_AI_Tool,
    ROUND(AVG(GPA_Post_AI - GPA_Baseline),2) AS avg_improvement,
    DENSE_RANK() OVER(
        ORDER BY AVG(GPA_Post_AI - GPA_Baseline) DESC
    ) AS tool_rank
FROM AI_Impact_Student
GROUP BY Primary_AI_Tool;

-- 22. Major Contribution to Total Time Saved

SELECT 
    Major,
    ROUND(SUM(Time_Saved_Hours_Weekly),2) AS total_hours,
    ROUND(
        SUM(Time_Saved_Hours_Weekly) * 100.0 /
        (SELECT SUM(Time_Saved_Hours_Weekly)
         FROM AI_Impact_Student),
    2) AS contribution_percentage
FROM AI_Impact_Student
GROUP BY Major
ORDER BY contribution_percentage DESC;

-- 23. Detect Students Performing Below Major Average

SELECT 
    s.Student_ID,
    s.Major,
    s.GPA_Post_AI
FROM AI_Impact_Student s
JOIN
(
    SELECT 
        Major,
        AVG(GPA_Post_AI) AS avg_major_gpa
    FROM AI_Impact_Student
    GROUP BY Major
) m
ON s.Major = m.Major
WHERE s.GPA_Post_AI < m.avg_major_gpa;

-- 24. Running Total of Time Saved

SELECT 
    Student_ID,
    Time_Saved_Hours_Weekly,
    SUM(Time_Saved_Hours_Weekly)
    OVER(
        ORDER BY Time_Saved_Hours_Weekly
    ) AS running_total
FROM AI_Impact_Student;

-- 25. Correlation Style Analysis Between Usage and GPA

SELECT 
    CASE
        WHEN Task_Frequency_Daily >= 15 THEN 'High Usage'
        WHEN Task_Frequency_Daily >= 8 THEN 'Medium Usage'
        ELSE 'Low Usage'
    END AS usage_group,
    
    ROUND(AVG(GPA_Post_AI),2) AS avg_gpa,
    ROUND(AVG(Time_Saved_Hours_Weekly),2) AS avg_time_saved
FROM AI_Impact_Student
GROUP BY usage_group
ORDER BY avg_gpa DESC;

