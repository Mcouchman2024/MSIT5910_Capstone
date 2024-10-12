<?php
  $serverName = "localhost";
  $dbUser = "root";
  $dbName = "capdata";
  $dbPass = "";
  $conn = mysqli_connect($serverName, $dbUser,$dbPass,$dbName);
  if (!$conn) {
  	die("Connection failed" . msqli_connect_error());
  }
  
?>