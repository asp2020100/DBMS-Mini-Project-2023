<!DOCTYPE html>
<html>
<head>
	<title>Database Operations</title>
	<link href="css/icon.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		.round-button {
	      background-color: #0a8a01;
		  border: none;
		  color: white;
		  padding: 10px;
		  text-align: left;
		  text-decoration: none;
		  display: inline-block;
		  font-size: 25px;
		  margin: 4px 2px;
		  margin-left : 50px;
		  margin-top : 20px;
		  margin-bottom : 25px;
		  border-radius: 12px;
		  width: 400px;
		  font-family: Montserrat;
		}
		
		.round-button:hover {
	      background-color: #33cccc;
		  color: white;
	    }
		
		.round-button_2 {
	      background-color: darkred;
		  border: none;
		  color: white;
		  padding: 10px;
		  text-align: left;
		  text-decoration: none;
		  display: inline-block;
		  font-size: 25px;
		  margin: 4px 2px;
		  margin-left : 50px;
		  margin-bottom : 25px;
		  border-radius: 12px;
		  width: 400px;
		  font-family: Montserrat;
		}
		
		.round-button_2:hover {
	      background-color: #33cccc;
		  color: white;
	    }
		
		@font-face {
			font-family: "Montserrat";
			src: url("assets/fonts/Montserrat.ttf") format("truetype");
		}
		
		button {
			width: 400px;
			height: 50px;
		}
	</style>
</head>
<body style="background-color: hsla(0,0%,100%,0.8)">
	<h3 style="font-family:Montserrat;margin-left:5%;font-size:25px;">Critical Site Settings are available here!</h3>
	
	<!-- Button to backup database -->
	<form action="site_backup.php" method="post">
		<button class="round-button" type="submit" name="backup"><i class="material-icons">backup</i> | Backup Database</button>
	</form>
	
	<!-- Button to reset database -->
	<form action="reset_employee.php" method="post">
		<button class="round-button_2" type="submit" name="reset"><i class="material-icons">delete</i> | Clear Employee Records</button>
	</form>
	
	<p style="font-family:Montserrat;margin-left:5%;font-size:15px;">Please Note :<br><br> The Backup option provides a copy of Diyaluma database to your local disk as "diyaluma.sql". You can find it on your "Downloads" folder.</p>
	<p style="font-family:Montserrat;margin-left:5%;font-size:15px;">If you clear the Employee records, all the details of Managers, Staff and Service persons are removed from the database.<br>That can't be undone.</p>
</body>
</html>
