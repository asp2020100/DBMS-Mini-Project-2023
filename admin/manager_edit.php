<?php
	include("session.php");
	include("config.php");
	$id = $_GET['Emp_ID'];
?>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/mystyle1.css" /> 
</head>
<body style="background-color: hsla(0,0%,100%,0.8)">


<form action="manager_update.php" method="POST">
  <div class="container">
  <?php
	$result = mysqli_query($mysqli,"SELECT * FROM EMPLOYEE WHERE Emp_ID ='$id'");
	while($row = mysqli_fetch_array($result))
	{	
    echo"<input type='text' placeholder='First name' name='firstname' value='{$row['Fname']}' required>";
    echo"<input type='text' placeholder='Last name' name='lastname' value='{$row['Lname']}' required>";
	echo"<input type='text' placeholder='Address' name='address' value='{$row['Address']}' required>";
  	echo"<label><b>DoB</b>";
    echo"<input type='date' name='birthdate' value='{$row['DoB']}'required>";
    echo"</label>";
	echo"<input type='text' placeholder='Emp_ID' name='id' value='{$row['Emp_ID']}' readonly>";
    echo"<input type='text' placeholder='New Password' name='password' value='{$row['Password']}' required>";
	}
	
	$result2 = mysqli_query($mysqli,"SELECT * FROM MANAGER WHERE Emp_ID ='$id'");
	while($row2 = mysqli_fetch_array($result2))
	{
  	echo"<label><b>Grade</b>";
    echo"<input type='text' name='grade' value='{$row2['Grade']}'required>";
    echo"</label>";
	echo"<div class='clearfix'>";
    echo"<button type='submit' class='signupbtn'>Update</button>";
	echo"</div>";
	}
	?>
  </div>
</form>