<?php

require_once('connect.php');

$json = file_get_contents('php://input');
$data = json_decode($json, true);

$teacher_name = $data['teacher_name'];
$discipline_name = $data['discipline_name'];
$group_name = $data['group_name'];

$stmt = $dbh->prepare("SELECT 
teachers_disciplines_groups.*
FROM teachers_disciplines_groups, teachers, disciplines, `groups`
WHERE teachers_disciplines_groups.teacher_login = teachers.teacher_login
AND teachers_disciplines_groups.discipline_id = disciplines.discipline_id
AND teachers_disciplines_groups.group_id = `groups`.group_id
AND teachers.teacher_name = ?
AND disciplines.discipline_name = ?
AND `groups`.group_name = ?
");
$stmt->execute([$teacher_name, $discipline_name, $group_name]);
$teachers_disciplines_groups = $stmt->fetch(PDO::FETCH_ASSOC);

echo json_encode($teachers_disciplines_groups);
