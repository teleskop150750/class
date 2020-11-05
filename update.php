<?php

require_once('connect.php');

$json = file_get_contents('php://input');
$data = json_decode($json, true);

$teacher_name = $data['teacher_name'];
$discipline_name = $data['discipline_name'];
$student_name = $data['student_name'];
$group_name = $data['group_name'];
$lesson_date = $data['lesson_date'];
$lesson_mark = $data['lesson_mark'];
// print_r($data);

// teacher_login
$stmt = $dbh->prepare("SELECT 
teachers.teacher_login
FROM teachers
WHERE teacher_name = ?
");
$stmt->execute([$teacher_name]);
$teacher_login = $stmt->fetch(PDO::FETCH_ASSOC)['teacher_login'];
// --------------------------------------------
// print_r($teacher_login);

// student_id
$stmt = $dbh->prepare("SELECT 
students.student_id
FROM students
WHERE student_name = ?
");
$stmt->execute([$student_name]);
$student_id = $stmt->fetch(PDO::FETCH_ASSOC)['student_id'];
// --------------------------------------------
// print_r($student_id);

// update
$stmt = $dbh->prepare("UPDATE students_lessons
SET students_lessons.lesson_mark = ?
WHERE students_lessons.teacher_login = ?
AND students_lessons.discipline_name = ?
AND students_lessons.lesson_date = ?
AND students_lessons.student_id = ?
AND students_lessons.group_name = ?
");
$stmt->execute([$lesson_mark, $teacher_login, $discipline_name, $lesson_date, $student_id, $group_name]);
$count = $stmt->rowCount();
// print_r($count);
echo json_encode($count);
