<?php
	include("session.php");
	include("config.php");
	$id = $_GET['Email'];
?>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/mystyle1.css" /> 
</head>
<body style="background-color: hsla(0,0%,100%,0.8)">


<form action="credential_update.php" method="POST">
  <div class="container">
  <?php
	$result = mysqli_query($mysqli,"SELECT * FROM SYS_ADMIN WHERE Email ='$id'");
	while($row = mysqli_fetch_array($result))
	{
	echo"<label><b>First Name</b>";			
    echo"<input type='text' placeholder='First name' name='firstname' value='{$row['Fname']}' required>";
	echo"<label><b>Last Name</b>";
    echo"<input type='text' placeholder='Last name' name='lastname' value='{$row['Lname']}' required>";
	echo"<label><b>Address</b>";
	echo"<input type='text' placeholder='Address' name='address' value='{$row['Address']}' required>";
	echo"<label><b>Email</b>";
    echo"<input type='text' placeholder='Email' name='email' value='{$row['Email']}' readonly>";
	echo"<label><b>Change Password</b>";
    echo"<input type='text' placeholder='New Password' name='password' value='{$row['Password']}' required>";
	
	echo"<div class='clearfix'>";
    echo"<button type='submit' class='signupbtn'>Update</button>";
	echo"</div>";
	}
	
	?>
  </div>
</form>