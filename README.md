AI Impact on Student Life — SQL Data Analysis Project
Project Overview

This project analyzes the impact of Artificial Intelligence (AI) tools on students’ academic performance, productivity, and career confidence using SQL.

The dataset contains information about students, their AI tool usage patterns, GPA improvements, time saved, ethics concerns, and confidence in future careers.

This project demonstrates practical SQL skills commonly used in real-world data analyst roles, including:

Data exploration
Aggregation
Filtering
Subqueries
CASE statements
Window functions
Ranking
Analytical queries

Columns
Column Name	Description
Student_ID	Unique student identifier
Age	Student age
Major	Student academic major
Primary_AI_Tool	Most used AI tool
Task_Frequency_Daily	Daily AI usage frequency
Main_Usage_Case	Main purpose of AI usage
GPA_Baseline	GPA before AI usage
GPA_Post_AI	GPA after AI usage
Time_Saved_Hours_Weekly	Weekly hours saved using AI
AI_Ethics_Concern	Ethics concern level
Career_Confidence_Score	Career confidence score

Project Objectives

The main goals of this project are:

Analyze AI usage among students
Measure GPA improvement after AI adoption
Identify productivity gains from AI tools
Compare AI usage patterns by major
Analyze ethics concerns regarding AI
Perform intermediate and advanced SQL analytics

SQL Skills Demonstrated
Intermediate SQL Skills
GROUP BY
ORDER BY
Aggregate Functions
CASE Statements
Subqueries
Filtering with WHERE
LIMIT
Percentage Calculations
Advanced SQL Skills
Window Functions
RANK()
DENSE_RANK()
Running Totals
Analytical Aggregations
Derived Tables
Performance Comparisons
Example Business Questions Solved
Intermediate Level
Which AI tool is most popular among students?
Which major shows the highest GPA improvement?
How much weekly time do students save using AI?
Which students use AI most frequently?
What is the relationship between AI usage and GPA?
Advanced Level
Rank AI tools based on GPA improvement
Calculate running totals of time saved
Detect students performing below major averages
Analyze contribution percentages by major
Compare GPA trends across AI usage groups
Key Insights
AI tools significantly improved student productivity
Higher AI usage often correlated with higher GPA
Some majors benefited more from AI adoption
Students reported substantial weekly time savings
Career confidence increased among frequent AI users
Technologies Used
SQL
MySQL / PostgreSQL / SQLite
GitHub
Project Structure
├── dataset/
│   └── AI_Impact_Student_Life_2026.csv

├── sql_queries/
│   ├── intermediate_queries.sql
│   └── advanced_queries.sql

├── screenshots/
│   └── query_outputs/

└── README.md
Sample SQL Query
SELECT 
    Major,
    ROUND(AVG(GPA_Post_AI - GPA_Baseline),2) AS avg_gpa_improvement
FROM student_ai_impact
GROUP BY Major
ORDER BY avg_gpa_improvement DESC;
Future Improvements
Create interactive dashboards using Power BI or Tableau
Add Python data analysis
Perform predictive analytics
Build machine learning models
Create automated reporting dashboards
Author

Projit Mondol

Connect With Me
GitHub
LinkedIn
