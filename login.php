<?php

session_start();
require_once('connect.php');
// Находим учителя
$log = $_POST['log'];
// $pas = $_POST['pas'];
$stmt = $dbh->prepare("SELECT
teachers.teacher_name
FROM teachers 
WHERE teachers.teacher_login = ? ");
$stmt->execute([$log]);
$teacher = $stmt->fetch(PDO::FETCH_ASSOC);;

if(!empty($teacher)){
  $_SESSION['teacher_name'] = $teacher['teacher_name'];
  header("Location: /class.php");
  exit();
}
header("Location: /index.php");
// print_r(__DIR__  . "/class.php");
