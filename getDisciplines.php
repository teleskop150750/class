<?php
require_once('connect.php');

$json = file_get_contents('php://input');
$data = json_decode($json, true);
$teacher_name = $data;

$stmt = $dbh->prepare("SELECT 
teachers_disciplines.discipline_name
FROM teachers_disciplines, teachers
WHERE teachers_disciplines.teacher_login = teachers.teacher_login
AND teachers.teacher_name = ?
");
$stmt->execute([$teacher_name]);
$groups = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($groups);
