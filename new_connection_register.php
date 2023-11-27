<?php
include("config.php");

?>

<?php
	session_start();
	if(isset($_SESSION['user'])){
		header('location:admin/home.php');
	}
	else if(isset($_SESSION['user_2'])){
		header('location:customer/home.php');
	}
	else if(isset($_SESSION['user_3'])){
		header('location:manager/home.php');
	}
	else if(isset($_SESSION['user_4'])){
		header('location:staff/home.php');
	}
	else if(isset($_SESSION['user_5'])){
		header('location:service/home.php');
	}
	

?>

<?php

$firstname = $_POST['firstname'];
$lastname = $_POST['lastname'];
$address = $_POST['address'];
$phone = $_POST['phone'];
$area = $_POST['area'];

// Insert the new connection into the NEW_CONNECTION table
$sql1 = "INSERT INTO NEW_CONNECTION (Date,Area) VALUES (CURDATE(), '$area')";
mysqli_query($mysqli, $sql1);

// Get the auto-generated Req_ID
$sql3 = "SELECT Req_ID FROM NEW_CONNECTION ORDER BY Req_ID DESC LIMIT 1";
$result = mysqli_query($mysqli, $sql3);
$row = mysqli_fetch_assoc($result);
$req_id = $row['Req_ID'];

// Insert the customer details into the Customer table
$sql2 = "INSERT INTO Customer (Req_ID, Fname, Lname, Address, Phone) VALUES ($req_id, '$firstname', '$lastname', '$address', '$phone')";
mysqli_query($mysqli, $sql2);

// Get the auto-generated Cus_ID
$cus_id = mysqli_insert_id($mysqli);

$query3 = "INSERT INTO ACCOUNT (Month, Cus_ID, Allocated_Units, Used_Units) VALUES (DATE_FORMAT(CURDATE(), '%Y-%m'), '$cus_id', 0, 0)";
$stmt3 = $mysqli->prepare($query3);
$stmt3->execute();
$stmt3->close();


?>
<head>
    <script src="assets/js/sweetalert2.all.min.js"></script>
</head>

<body>
<?php
       
            echo '<script>';
			echo 'Swal.fire({
				title: "Done!",
				html: "You have requested a New Water Connection! <br> Your Request ID : ' . $req_id . '<br> Your Customer ID : ' . $cus_id . '",
				icon: "success",
				confirmButtonText: "OK",
				closeOnConfirm: true
			}).then((result) => {
				if (result.isConfirmed) {
					window.location="index.php";
				}
			});';
			echo '</script>';

        
?>
</body>
