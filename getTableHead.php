<?php

require_once('connect.php');

$json = file_get_contents('php://input');
$data = json_decode($json, true);

$discipline_name = $data['discipline_name'];
$group_name = $data['group_name'];
$teacher_name = $data['teacher_name'];

$stmt = $dbh->prepare("SELECT 
lessons.lesson_date,
lessons.lesson_desc
FROM lessons, teachers
WHERE lessons.teacher_login = teachers.teacher_login
AND lessons.discipline_name = ?
AND lessons.group_name = ?
AND teachers.teacher_name = ?
");
$stmt->execute([$discipline_name, $group_name, $teacher_name]);
$dates = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($dates);
