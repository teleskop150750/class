<?php
require_once('connect.php');

$json = file_get_contents('php://input');
$data = json_decode($json, true);

$teacher_name = $data['teacher_name'];
$discipline_name = $data['discipline_name'];
$group_name = $data['group_name'];
$lesson_desc = $data['lesson_desc'];
$lesson_date = $data['lesson_date'];

$student_name_mark = $data['student_name_mark'];

// teacher_login
$stmt = $dbh->prepare("SELECT 
teachers.teacher_login	
FROM teachers
WHERE teachers.teacher_name = ?
");
$stmt->execute([$teacher_name]);
$teacher = $stmt->fetch(PDO::FETCH_ASSOC);
$teacher_login = $teacher['teacher_login'];
// =====================================================================

// урок
$stmt = $dbh->prepare("INSERT
`lessons`
(`lesson_desc`, `lesson_date`, `teacher_login`, `discipline_name`, `group_name`)
VALUES (?, ?, ?, ?, ?)
");
$stmt->execute([$lesson_desc, $lesson_date, $teacher_login, $discipline_name, $group_name]);
// =====================================================================

// id студента
foreach ($student_name_mark as $k => &$v) {
  $stmt = $dbh->prepare("SELECT 
    students.student_id
    FROM students
    WHERE students.student_name = ?
  ");
  $stmt->execute([$v['student_name']]);
  $v['student_id'] = $stmt->fetch(PDO::FETCH_ASSOC)['student_id'];
}
// =====================================================================


$query = 'INSERT 
`students_lessons`
(`student_id`, `lesson_mark`, `lesson_date`, `teacher_login`, `discipline_name`, `group_name`) 
VALUES ';

$paramsArray = [];

for ($i = 0; $i < count($student_name_mark); $i++) {
  $query .= '(?, ?, ?, ?, ?, ?), ';
  $paramsArray[] = $student_name_mark[$i]['student_id'];
  $paramsArray[] = $student_name_mark[$i]['lesson_mark'];
  $paramsArray[] = $lesson_date;
  $paramsArray[] = $teacher_login;
  $paramsArray[] = $discipline_name;
  $paramsArray[] = $group_name;
}

$query = rtrim($query, ', ');
// print_r($query);
// print_r($paramsArray);

$stmt = $dbh->prepare($query);
$stmt->execute($paramsArray);

echo json_encode($stmt->rowCount());
// // =====================================================================
