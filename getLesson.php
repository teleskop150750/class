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
teachers_disciplines_groups.teacher_login	
FROM teachers_disciplines_groups, teachers
WHERE teachers_disciplines_groups.teacher_login = teachers.teacher_login
AND teachers.teacher_name = ?
");
$stmt->execute([$teacher_name]);
$teachers_disciplines_groups = $stmt->fetch(PDO::FETCH_ASSOC);
$teacher_login = $teachers_disciplines_groups['teacher_login'];
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

// оценки
foreach ($student_name_mark as $key => $value) {
  $stmt = $dbh->prepare("INSERT INTO 
  `students_lessons`
  (`student_id`, `lesson_mark`, `lesson_date`, `teacher_login`, `discipline_name`, `group_name`) 
  VALUES (?, ?, ?, ?, ?, ?)
  ");
  $stmt->execute([$value['student_id'], $value['lesson_mark'], $lesson_date, $teacher_login, $discipline_name, $group_name]);
}
// =====================================================================

