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
<form action="complaint_create.php" method="POST">
  <div class="container">
	
	<label for="complaint_nature">Select a Complaint : </label>
	<select name="complaint_nature" id="complaint_nature">
   
		<option value="Low water pressure">Low water pressure</option>
		<option value="Water leak">Water leak</option>
		<option value="Unreliable water supply">Unreliable water supply</option>
		<option value="Discoloration of water">Discoloration of water</option>
		<option value="Foul taste and odor">Foul taste and odor</option>

	</select>

	<label>Other : </label>
	<input type="text" placeholder="Please Specify (Leave empty if you selected an option from list)" name="desc">

    <div class="clearfix">
      <button type="submit" class="signupbtn">Add Complaint</button>
    </div>
  </div>
</form>