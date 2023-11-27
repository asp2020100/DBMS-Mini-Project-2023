<?php
session_start();
include("config.php");

if(isset($_GET['Req_ID']))
{
	$Req_ID = $_GET['Req_ID'];
	$query = "SELECT c.*, nc.Date AS NC_Date, a.Date AS A_Date, e.Date AS E_Date
	FROM Customer c
	INNER JOIN NEW_CONNECTION nc ON c.Req_ID = nc.Req_ID
	INNER JOIN APPROVES a ON nc.Req_ID = a.Req_ID
	INNER JOIN ESTABLISHES e ON nc.Req_ID = e.Req_ID
	WHERE c.Req_ID = '$Req_ID';
	";
	$result = mysqli_query($mysqli, $query);
	$row = mysqli_fetch_array($result);
}
?>

<!DOCTYPE html>
<html>
<head>
	<title>Customer Profile</title>
	<link type="text/css" href="assets/css/bootstrap.min.css" rel="stylesheet">	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>

	@font-face {
		font-family: "Montserrat";
		src: url("assets/fonts/Montserrat.ttf") format("truetype");
	}

	.profile-card {
		border: 2px solid #33cccc;
		border-radius: 10px;
		padding: 20px;
		margin: 5% auto;
		max-width: 800px;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
		background-color: white;
	}

	.profile-image {
		margin-bottom: 10px;
		text-align: center;
	}

	.profile-image img {
		border-radius: 50%;
		width: 200px;
		height: 200px;
	}

	.profile-details {
		text-align: center;
		font-family: Montserrat;
	}

	.profile-details h2 {
		margin: 0;
		font-size: 30px;
		color: #33cccc;
	}

	.profile-details p {
		font-size: 20px;
		margin: 5px 0;
		color: #333333;
	}

	.profile-details ul {
		list-style: none;
		padding: 0;
		margin: 0;
		font-size: 18px;
	}

	.profile-details ul li {
		margin: 10px 0;
		color: #333333;
	}

	.custom-button {
		font-family: Montserrat;
		background-color: #33cccc;
		color: black;
		border: none;
		border-radius: 20px;
		padding: 8px 16px;
		transition: background-color 0.3s ease;
	}

	.custom-button:hover {
		background-color: #2196f3;
		color: white;
	}

	</style>
</head>

<body style="background-color: hsla(0,0%,100%,0.8)">
	<div class="profile-card">
		<div class="profile-details">
			<h2><?php echo $row['Fname']." ".$row['Lname']; ?></h2>
			<p><?php echo $row['Address']; ?></p>
			<p><?php echo $row['Phone']; ?></p>
			<ul>
				<li><b>Customer ID:</b> <?php echo $row['Cus_ID']; ?></li>
				<li><b>Request ID:</b> <?php echo $row['Req_ID']; ?></li>
				<p><strong>Date Requested:</strong> <?php echo $row['NC_Date']; ?></p>
				<p><strong>Date Approved:</strong> <?php echo $row['A_Date']; ?></p>
				<p><strong>Date Established:</strong> <?php echo $row['E_Date']; ?></p>

			</ul>
			<a href="customer_report.php?Req_ID=<?php echo $Req_ID; ?>" class="custom-button">View a Detailed Report</a>

		</div>
	</div>
</body>
</html>
