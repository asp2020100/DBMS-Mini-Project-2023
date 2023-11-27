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
<form action="feedback_create.php" method="POST">
  <div class="container">
	<label>Description : </label>
	<input type="text" placeholder="Description" name="desc" required>

    <div class="clearfix">
      <button type="submit" class="signupbtn">Add Feedback</button>
    </div>
  </div>
</form>