<?php

session_start();

if (empty($_SESSION['teacher_name'])) {
  header("Location: /index.php");
  die();
}

$teacherName = $_SESSION['teacher_name'];
?>

<!DOCTYPE html>
<html class="h-100" lang="ru">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="icon" type="image/png" sizes="512x512" href="favicon.png">
  <link rel="stylesheet" href="./bootstrap.min.css">
</head>

<body class="pb-5 pt-5">
  <div class="container pt-5">
    <div class="row d-flex align-items-end mb-5">
      <div class="col-4">
        <div class="alert alert-primary mb-0" id="teacher"><?= $teacherName; ?></div>
      </div>

      <div class="col-4">
        <label for="selectDiscipline">Выбрать дисциплину</label>
        <select class="form-control" id="selectDiscipline" name="discipline">
        </select>
      </div>
      <div class="col-4">
        <label for="selectGroup">Выбрать группу</label>
        <select class="form-control" id="selectGroup" name="discipline">
        </select>
      </div>
    </div>
  </div>

  <div class="container mb-5">
    <div class="row mb-3">
      <div class="col-2">
        <input type="date" class="form-control" id="date" name="date">
      </div>
      <div class="col-8">
        <input type="text" class="form-control" id="desc" name="desc" placeholder="Тема урока">
      </div>
      <div class="col-2">
        <button type="button" class="btn btn-danger" id="add">Заполнить</button>
      </div>
    </div>
    <div id="studentsWrap">
    </div>
  </div>

  <div class="container mb-5" id="lessenAll">
    <div class="table-responsive">
      <table class="table table-striped">
        <thead>
          <tr id="tableHead">
          </tr>
        </thead>
        <tbody id="tableBody">
        </tbody>
        <tfoot>
          <tr id="tableFooter">
          </tr>
        </tfoot>
      </table>
    </div>
  </div>

  <div class="container">
    <div class="row mb-3">
      <div class="col-2">
        <input type="date" class="form-control" id="dateUp" name="date">
      </div>
      <div class="col-5">
        <button type="button" class="btn btn-danger" id="update">Реактировать</button>
      </div>
    </div>
    <div id="studentsUpWrap">
    </div>
  </div>

  <script src="./jquery-3.5.1.slim.min.js"></script>
  <script src="./bootstrap.bundle.min.js"></script>
  <script src="./index.js"></script>
</body>

</html>