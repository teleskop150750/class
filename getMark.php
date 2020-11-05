<?php
require_once('connect.php');

$json = file_get_contents('php://input');
$data = json_decode($json, true);

$teacher_name = $data['teacher_name'];
$discipline_name = $data['discipline_name'];
$group_name = $data['group_name'];
$student_name = $data['student_name'];

$stmt = $dbh->prepare("SELECT 
students_lessons.lesson_mark
FROM students_lessons, students, teachers
WHERE students_lessons.student_id = students.student_id
AND students_lessons.teacher_login = teachers.teacher_login
AND students.student_name = ?
AND teachers.teacher_name = ?
AND students_lessons.discipline_name = ?
AND students_lessons.group_name = ?
");
$stmt->execute([$student_name, $teacher_name, $discipline_name, $group_name]);
$marks = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($marks);
