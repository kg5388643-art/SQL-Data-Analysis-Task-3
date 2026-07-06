# 📊 SQL Data Analysis Internship – Task 3
## 📌 Objective
This task demonstrates advanced SQL data analysis using **JOIN**, **GROUP BY**, **HAVING**, **Aggregate Functions**, and **Subqueries** on a Student Management System database.
---
## 🛠 Tools Used
- MySQL Workbench
- MySQL
---
## 📂 Database Tables
- Students
- Courses
- Enrollments
---
# 📌 Query 1: Top Student Per Course
### SQL Query
```sql
SELECT
    c.name AS Course_Name,
    s.Name AS Student_Name,
    e.grade
FROM enrollments e
JOIN students s
ON e.student_id = s.student_id
JOIN courses c
ON e.course_id = c.id
WHERE e.grade = (
    SELECT MAX(e2.grade)
    FROM enrollments e2
    WHERE e2.course_id = e.course_id
);
```
### Output
![Top Student Per Course](Screenshots/TopStudentPerCourse.png)
---
# 📌 Query 2: Pass Rate Per Course
### SQL Query
```sql
SELECT
    c.name AS Course_Name,
    COUNT(CASE WHEN e.grade >= 40 THEN 1 END) AS Passed,
    COUNT(*) AS Total_Students,
    ROUND(
        (COUNT(CASE WHEN e.grade >= 40 THEN 1 END) * 100.0) / COUNT(*),
        2
    ) AS Pass_Rate
FROM enrollments e
JOIN courses c
ON e.course_id = c.id
GROUP BY c.name;
```
### Output
![Pass Rate Per Course](Screenshots/PassRate.png)
---
# 📌 Query 3: Overall Topper
### SQL Query
```sql
SELECT
    s.student_id,
    s.Name,
    SUM(e.grade) AS Total_Marks
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id
GROUP BY s.student_id, s.Name
ORDER BY Total_Marks DESC
LIMIT 1;
```
### Output
![Overall Topper](Screenshots/TopPerformer.png)
---
# 📌 Query 4: Students Enrolled in Multiple Courses

### SQL Query

```sql
SELECT
    s.student_id,
    s.Name,
    COUNT(e.course_id) AS Total_Courses
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id
GROUP BY s.student_id, s.Name
HAVING COUNT(e.course_id) > 1;
```
### Output
![Students Enrolled in Multiple Courses](Screenshots/MultipleCourses.png)
---
## 📚 SQL Concepts Used
- INNER JOIN
- GROUP BY
- HAVING
- Aggregate Functions (COUNT, SUM, MAX)
- Subqueries
- ORDER BY
- LIMIT
---
## 🎯 Learning Outcomes

- Performed advanced data analysis using SQL.
- Practiced writing complex queries with JOINs and subqueries.
- Used aggregate functions to generate meaningful insights.
- Improved SQL skills for real-world data analytics scenarios.
---
## 👩‍💻 Author

**Kriti Gupta**

SQL Data Analysis Intern
