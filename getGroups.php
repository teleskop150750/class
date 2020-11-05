<?php

require_once('connect.php');

$json = file_get_contents('php://input');
$data = json_decode($json, true);
$teacher_name = $data['teacher_name'];
$discipline_name = $data['discipline_name'];

$stmt = $dbh->prepare("SELECT 
teachers_disciplines_groups.group_name
FROM teachers_disciplines_groups, teachers
WHERE  teachers_disciplines_groups.teacher_login = teachers.teacher_login
AND teachers_disciplines_groups.discipline_name = ?
AND teachers.teacher_name = ?
ORDER BY teachers_disciplines_groups.group_name DESC
");
$stmt->execute([$discipline_name, $teacher_name]);
$groups = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($groups);