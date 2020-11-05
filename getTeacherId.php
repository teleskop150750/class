<?php

require_once('connect.php');

$json = file_get_contents('php://input');
$data = json_decode($json, true);

$teacher_name = $data['teacher_name'];

// Находим учителя
$stmt = $dbh->prepare("SELECT teachers.teacher_id FROM teachers WHERE teachers.teacher_name = ?");
$stmt->execute([$teacher_name]);
$teacher = $stmt->fetch(PDO::FETCH_ASSOC);
$teacher_id = $teacher['teacher_id'];

echo json_encode($teacher_id);