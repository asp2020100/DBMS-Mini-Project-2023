<?php
	include("session.php");
	include("config.php");
	$id = $_GET['Notice_ID'];
?>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/mystyle1.css" /> 
</head>
<body style="background-color: hsla(0,0%,100%,0.8)">


<form action="notices_update.php" method="POST">
  <div class="container">
  <?php
	$result = mysqli_query($mysqli,"SELECT * FROM NOTICE_BOARD WHERE Notice_ID = '$id'");
	
	while($row = mysqli_fetch_array($result))
	{	
    echo"<input type='text' placeholder='Notice ID' name='noticeid' value='{$row['Notice_ID']}' readonly>";
	echo"<label><b>Description</b>";
    echo"<input type='text' placeholder='Description' name='desc' value='{$row['Description']}' required>";
	echo"</label>";
	echo"<div class='clearfix'>";
    echo"<button type='submit' class='signupbtn'>Update</button>";
	echo"</div>";
	}
	
	?>
  </div>
</form>