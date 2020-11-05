<?php

require_once('connect.php');

$json = file_get_contents('php://input');
$data = json_decode($json, true);
$group_name = $data;

$stmt = $dbh->prepare("SELECT 
students.student_name
FROM students
WHERE  students.group_name = ?");
$stmt->execute([$group_name]);
$students = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($students);