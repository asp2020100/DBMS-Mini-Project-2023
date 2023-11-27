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
<form action="staff_register.php" method="POST">
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
	<label for="area">Area : </label>
  <select name="area" id="area">
   
  <option value="Ampara">Ampara</option>
  <option value="Anuradhapura">Anuradhapura</option>
  <option value="Badulla">Badulla</option>
  <option value="Batticaloa">Batticaloa</option>
  <option value="Colombo">Colombo</option>
  <option value="Galle">Galle</option>
  <option value="Gampaha">Gampaha</option>
  <option value="Hambantota">Hambantota</option>
  <option value="Jaffna">Jaffna</option>
  <option value="Kalutara">Kalutara</option>
  <option value="Kandy">Kandy</option>
  <option value="Kegalle">Kegalle</option>
  <option value="Kilinochchi">Kilinochchi</option>
  <option value="Kurunegala">Kurunegala</option>
  <option value="Mannar">Mannar</option>
  <option value="Matale">Matale</option>
  <option value="Matara">Matara</option>
  <option value="Monaragala">Monaragala</option>
  <option value="Mullaitivu">Mullaitivu</option>
  <option value="Nuwara Eliya">Nuwara Eliya</option>
  <option value="Polonnaruwa">Polonnaruwa</option>
  <option value="Puttalam">Puttalam</option>
  <option value="Ratnapura">Ratnapura</option>
  <option value="Trincomalee">Trincomalee</option>
  <option value="Vavuniya">Vavuniya</option>


  </select>
    <div class="clearfix">
      <button type="submit" class="signupbtn">Add Account</button>
    </div>
  </div>
</form>