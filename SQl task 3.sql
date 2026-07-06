USE studentmanagement;
SELECT
    c.name,
    s.Name,
    e.grade
FROM enrollments e
JOIN students s
ON e.student_id = s.StudentID
JOIN courses c
ON e.course_id = c.id
WHERE e.grade = (
    SELECT MAX(e2.grade)
    FROM enrollments e2
    WHERE e2.course_id = e.course_id
);
-- Pass rate per score
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
-- Overall Topper
SELECT
    s.StudentID,
    s.Name,
    SUM(e.grade) AS Total_Marks
FROM students s
JOIN enrollments e
ON s.StudentID = e.student_id
GROUP BY s.StudentID, s.Name
ORDER BY Total_Marks DESC
LIMIT 1;
-- Students Enrolled in Multiple Courses

SELECT
    s.StudentID,
    s.Name,
    COUNT(e.course_id) AS Total_Courses
FROM students s
JOIN enrollments e
ON s.StudentID= e.student_id
GROUP BY s.StudentID, s.Name
HAVING COUNT(e.course_id) > 1;
