<?php
	include("session.php");
?>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/mystyle1.css" /> 
</head>

<body style="background-color: hsla(0,0%,100%,0.8)">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<form action="manager_register.php" method="POST">
  <div class="container">
	<input type="text" placeholder="First name" name="firstname" required>
    <input type="text" placeholder="Last Name" name="lastname" required>
    <input type="text" placeholder="Address" name="address" required>
  	<label>DoB</label>
    <input type="date" placeholder="DoB" name="birthdate" required>
    <label for="sex">Gender</label>
  <select name="sex" id="sex">
    <option value="Male">Male</option>
    <option value="Female">Female</option>
  </select>
    <input type="password" placeholder="Password" name="password" required>
	<label for="grade">Grade</label>
  <select name="grade" id="grade">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
  </select>
    <div class="clearfix">
      <button type="submit" class="signupbtn">Add Account</button>
    </div>
  </div>
</form>