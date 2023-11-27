<?php
	include("session.php");
	include("config.php");
	$id = $_GET['Cus_ID'];
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
	$result = mysqli_query($mysqli,"SELECT * FROM CUSTOMER WHERE Cus_ID ='$id'");
	while($row = mysqli_fetch_array($result))
	{
	echo"<label><b>Customer ID</b>";			
    echo"<input type='text' placeholder='Customer ID' name='cusid' value='{$row['Cus_ID']}' readonly>";
	echo"<label><b>Request ID - (Act as your Password)</b>";
    echo"<input type='text' placeholder='Request ID' name='reqid' value='{$row['Req_ID']}' readonly>";
	echo"<label><b>First Name</b>";
	echo"<input type='text' placeholder='First Name' name='firstname' value='{$row['Fname']}' required>";
	echo"<label><b>Last Name</b>";
    echo"<input type='text' placeholder='Last Name' name='lastname' value='{$row['Lname']}' required>";
	echo"<label><b>Address</b>";
    echo"<input type='text' placeholder='Address' name='address' value='{$row['Address']}' required>";
	echo"<label><b>Phone</b>";
    echo"<input type='number' placeholder='Phone Number' name='phone' value='{$row['Phone']}' required>";
	
	echo"<div class='clearfix'>";
    echo"<button type='submit' class='signupbtn'>Update</button>";
	echo"</div>";
	}
	
	?>
  </div>
</form>