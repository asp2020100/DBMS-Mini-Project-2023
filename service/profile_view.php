<?php
	include("session.php");

?>
<!DOCTYPE html>
<html>
  <head>
    <title>My Profile</title>
    <style>
      body {
        background-color: hsla(0,0%,100%,0.8);
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
      }
      .container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
      }
      .card {
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.15);
        display: flex;
        flex-direction: column;
        height: 400px;
        margin-right: 20px;
        overflow: hidden;
        width: 300px;
      }
      .card img {
        width: 100;
        height: 100;
		display: block;
        object-fit: cover;
      }
      .card-content {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding: 20px;
        flex-grow: 1; /* Added to make the card content take up remaining space */
      }
      .card-title {
        color: #2f2f2f;
        font-size: 28px;
        margin: 0;
        text-align: center;
		font-family: Montserrat;
        flex-grow: 1; /* Added to center the title vertically */
        display: flex; /* Added to make the flex-grow property work */
        justify-content: center; /* Added to center the title horizontally */
      }
      .card-text {
        color: #6c757d;
        font-size: 18px;
        margin: 10px 0 0 0;
        text-align: center;
		font-family: Montserrat;
      }
	  
	
	  
	  .card:first-child .card-title {
		  margin-top: 1px;
		}

      .card-button {
        background-color: #8bc34a;
        border: none;
        border-radius: 5px;
        color: #fff;
        cursor: pointer;
        font-size: 18px;
        margin-top: 20px;
        padding: 10px;
        transition: background-color 0.3s ease;
        width: 100%;
      }
      .card-button:hover {
        background-color: #689f38;
      }
      .line {
        background-color: black;
        height: 350px;
        margin-right: 50px;
		margin-left: 35px;
        width: 1px;
      }
	  @font-face {
		font-family: "Montserrat";
		src: url("assets/fonts/Montserrat.ttf") format("truetype");
	}
    </style>
  </head>
  <body>
    <div class="container">
      <div class="card">
        <img src="assets/Trasparent_logo.png" alt="Profile picture">
        <div class="card-content">
		  <?php
			include("config.php");
			$sql2 = "SELECT e.*, s.*
					FROM employee e
					JOIN service_personnal s ON e.Emp_ID = s.Emp_ID
					WHERE e.Emp_ID = '" . $_SESSION['user_5'] . "'";
			$result2 = $mysqli->query($sql2);
			if (!$result2) {
				// if there was an error executing the query, print the error message
			
			} else if (mysqli_num_rows($result2) > 0) {
				// if the query executed successfully and returned at least one row
				while($rowData2 = mysqli_fetch_array($result2)){
					echo '<h1 class="card-title" >Service</h1>';
					echo '<p3 class ="card-text">Type : '.$rowData2["Type"].' | ID  : '.$_SESSION['user_5'].'</p3>';
					
				}
			}
		  
		  
		  ?>
          
        </div>
      </div>
      <div class="line"></div>
      <div class="card">
        <img src="assets/profile_pc.jpg" alt="Profile picture">
        <div class="card-content">
		
		<?php
			include("config.php");
			$sql = "SELECT * FROM EMPLOYEE WHERE Emp_ID = '" . $_SESSION['user_5'] . "'";
			$result = $mysqli->query($sql);
			if (mysqli_num_rows($result) > 0) {
			while($rowData = mysqli_fetch_array($result)){
				echo '<h1 class="card-title">'.$rowData["Fname"].' '.$rowData["Lname"].'</h1>';
				echo '<p class="card-text">'.$rowData["Address"].'</p>';
				echo '<p class="card-text">'.$rowData["DoB"].' | '.$rowData["Sex"].'</p>';
			}
		}
		?>

        </div>
      </div>
    </div>
  </body>
</html>
