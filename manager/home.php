<?php
	include("session.php");
	
?>
<!DOCTYPE html>
<html>
<head>
<title>  | Manager Portal</title>
<link rel="icon" type="image/x-icon" href="assets/icon.ico">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
  
	.logobar {
      position: absolute;
      z-index: 1;
      top: 3%;
      left: 40px;
      background-color: #FCF7FF;
      padding-top: 1px;
	  border-radius: 25px;
	  width:270px;
	  height:80px; 
	  
	  
    }
	
	.logobar img {
	  display: block;
	  margin-top:3%;
	  width: 100%;
	}
	
	.titlebar {
      height:80px; //change
	  width:100%;
      min-width: 800px;
      position: absolute;
      top: 3%;
      left: 330px;
      background-color: hsla(0,0%,100%,0.9);
	  border-radius: 25px;
	  font-family:Montserrat; 
	  text-align: center;
	  font-size: 50px;
	  line-height: 85px;
	  
    }
	
	.bodybar {
      height:79%;
      width: 980px;
      position: absolute;
      z-index: 1;
      top: 130px;
      left: 330px;
      background-color: hsla(0,0%,100%,0);
      padding-top: 1px;
	  border-radius: 25px;
    }
	
	.homebtnbar {
      height:80px; 
      width: 80px;
      position: absolute;
      top: 3%;
      left: 1145px;
      background-color: hsla(0,0%,100%,0.1);
	  border-radius: 25px;
    }
	
	.homebtn{
	  background-color: hsla(0,0%,100%,0.8);
	  border: none;
	  color: black;
	  text-align: center;
	  text-decoration: none;
	  font-size: 70px;
	  border-radius: 25px;
	  height: 100%;
      width: 80px;
	  font-family:Montserrat; 
	}
	
	.homebtn:hover {
      background-color: darkred;
	  color: white;
    }
	
	.logoutbtnbar {
      height:80px; 
      width: 80px;
      position: absolute;
      top: 3%;
      left: 1240px;
      background-color: hsla(0,0%,100%,0.1);
	  border-radius: 25px;
    }
	
	.logoutbtn{
	  background-color: hsla(0,0%,100%,0.8);
	  border: none;
	  color: black;
	  text-align: center;
	  text-decoration: none;
	  font-size: 70px;
	  border-radius: 25px;
	  height: 100%;
      width: 80px;
	  font-family:Montserrat; 
	}
	
	.logoutbtn:hover {
      background-color: darkred;
	  color: white;
    }
	
    .sidebar {
	  height:79%;
      width: 270px;
      position: absolute;
      z-index: 1;
      top: 130px;
      left: 40px;
      background-color: hsla(0,0%,100%,0.8);
      overflow-x: hidden;
      padding-top: 1px;
	  border-radius: 25px;
	  
    }
    
    .sidebar a {
      padding: 6px 8px 6px 16px;
      text-decoration: none;
      font-size: 20px;
      color: Blue;
      display: block;
    }
    
    .round-button {
      background-color: #33cccc;
	  border: none;
	  color: black;
	  padding: 10px;
	  text-align: left;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 25px;
	  margin: 4px 2px;
	  border-radius: 12px;
	  width: 210px;
	  font-family:Montserrat; 
	  
    }
	
	.round-button:hover {
      background-color: darkred;
	  color: white;
    }
	
	.html {
		height: 100%;
		
	}
	body {
		
		background-image: url('assets/BG1.jpg');
        background-size: cover;
		
	}
	
	@font-face {
		font-family: "Montserrat";
		src: url("assets/fonts/Montserrat.ttf") format("truetype");
	}
	
  </style>
  
</head>
<body onload="displaysummary();">

<script>
	
	function displaysummary() {
	var div = document.getElementById("body_container");
	div.innerHTML = '<iframe style="width:100%;height:100%;border-radius: 25px;margin-left:10px;margin-right:10px" frameborder="0" src="' + "Summary.php" + '" />';
	}
	
	function display_approvals() {
	var div = document.getElementById("body_container");
	div.innerHTML = '<iframe style="width:100%;height:100%;border-radius: 25px;margin-left:10px;margin-right:10px" frameborder="0" src="' + "approvals.php" + '" />';
	
	}
	
	function profile() {
	var div = document.getElementById("body_container");
	div.innerHTML = '<iframe style="width:100%;height:100%;border-radius: 25px;margin-left:10px;margin-right:10px" frameborder="0" src="' + "profile_view.php" + '" />';
	
	}
	
	function credentials() {
	var div = document.getElementById("body_container");
	div.innerHTML = '<iframe style="width:100%;height:100%;border-radius: 25px;margin-left:10px;margin-right:10px" frameborder="0" src="' + "credential_view.php" + '" />';
	
	}
	
	function service_view() {
	var div = document.getElementById("body_container");
	div.innerHTML = '<iframe style="width:100%;height:100%;border-radius: 25px;margin-left:10px;margin-right:10px" frameborder="0" src="' + "service.php" + '" />';
	
	}
	
	function staff_view() {
	var div = document.getElementById("body_container");
	div.innerHTML = '<iframe style="width:100%;height:100%;border-radius: 25px;margin-left:10px;margin-right:10px" frameborder="0" src="' + "staff.php" + '" />';
	
	}
	
	function cus_view() {
	var div = document.getElementById("body_container");
	div.innerHTML = '<iframe style="width:100%;height:100%;border-radius: 25px;margin-left:10px;margin-right:10px" frameborder="0" src="' + "customers.php" + '" />';
	
	}
	
</script>


<div class="logobar">
  <img src="assets/Trasparent_logo_Title.png" />
</div>

<div class="titlebar">Manager Portal</div>

<div class="homebtnbar">
<a href="#home"><div class="homebtn"onclick="displaysummary()"><i class="fa fa-home"></i></div></a>
</div>

<div class="logoutbtnbar">
<a href="logout.php"><div class="logoutbtn"><i class="fa fa-power-off"></i></div></a>
</div>

<div class="bodybar" id="body_container"></div>

<div class="sidebar">
  <a href="#Summary"><div class="round-button"onclick="displaysummary()"><i class="fa fa-newspaper-o"></i> | Summary</div></a>
  <a href="#approval"><div class="round-button"onclick="display_approvals()"><i class="fa fa-check-square-o"></i> | Approvals</div></a>
  <a href="#customer"><div class="round-button"onclick="cus_view()"><i class="fa fa-group"></i> | Customers</div></a>
  <a href="#staff"><div class="round-button"onclick="staff_view()"><i class="fa fa-group"></i> | Staff</div></a>
  <a href="#service"><div class="round-button"onclick="service_view()"><i class="fa fa-group"></i> | Service</div></a>
  <a href="#account"><div class="round-button"onclick="profile()"><i class="fa fa-address-card-o"></i> | My Account</div></a>
  <a href="#password"><div class="round-button"onclick="credentials()"><i class="fa fa-key"></i> | Credentials</div></a>

</div>
<p id="demo"></p>

</body>
</html>

<font-awesome-icon icon="fa-sharp fa-solid fa-house" />
