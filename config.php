<?php
$servername = "140.238.243.244";
$username = "dbmsadmin";
$password = "dbmspass";
$dbname = "dbmsminiproject";

$mysqli = new mysqli('140.238.243.244', 'dbmsadmin', 'dbmspass', 'dbmsminiproject');
$mysqli_2 = new mysqli('140.238.243.244', 'dbmsadmin', 'dbmspass', 'dbmsminiproject');
$mysqli_3 = new mysqli('140.238.243.244', 'dbmsadmin', 'dbmspass', 'dbmsminiproject');
$conn = mysqli_connect($servername, $username, $password, $dbname);
?>