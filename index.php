<?php
session_start();
?>

<!DOCTYPE html>
<html class="h-100" lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="icon" type="image/png" sizes="512x512" href="favicon.png">
  <link rel="stylesheet" href="./bootstrap.min.css">
</head>

<body class="h-100 d-flex align-items-center pb-5">

  <div class="container">
    <div class="row justify-content-center">
      <div class="col-4">
        <form action="./login.php" method="POST">
          <div class="form-group">
            <label for="exampleInputEmail1">Login</label>
            <input type="text" class="form-control" id="exampleInputEmail1" name="log">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input type="text" class="form-control" id="exampleInputPassword1" name="pas" disabled>
          </div>
          <button type="submit" class="btn btn-primary" name="btn">Submit</button>
        </form>
      </div>
    </div>
  </div>


  <script src="./jquery-3.5.1.slim.min.js"></script>
  <script src="./bootstrap.bundle.min.js"></script>
</body>

</html>