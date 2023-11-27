<?php
	include("session.php");
	include("config.php");
	$id = $_GET['Emp_ID'];
?>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="assets/css/mystyle1.css" /> 
</head>
<body style="background-color: hsla(0,0%,100%,0.8)">


<form action="credential_update.php" method="POST">
  <div class="container">
  <?php
	$result = mysqli_query($mysqli,"SELECT * FROM EMPLOYEE WHERE Emp_ID ='$id'");
	while($row = mysqli_fetch_array($result))
	{
	echo"<label><b>First Name</b>";			
    echo"<input type='text' placeholder='First name' name='firstname' value='{$row['Fname']}' required>";
	echo"<label><b>Last Name</b>";
    echo"<input type='text' placeholder='Last name' name='lastname' value='{$row['Lname']}' required>";
	echo"<label><b>Address</b>";
	echo"<input type='text' placeholder='Address' name='address' value='{$row['Address']}' required>";
	echo"<label><b>Service ID</b>";
    echo"<input type='number' placeholder='Service ID' name='serid' value='{$row['Emp_ID']}' readonly>";
	echo"<label><b>Change Password</b>";
    echo"<input type='text' placeholder='New Password' name='password' value='{$row['Password']}' required>";
	
	echo"<div class='clearfix'>";
    echo"<button type='submit' class='signupbtn'>Update</button>";
	echo"</div>";
	}
	
	?>
  </div>
</form>