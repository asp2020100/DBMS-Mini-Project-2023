<head>
    <script src="assets/js/sweetalert2.all.min.js"></script>
</head>
<body>
<?php
include("config.php");
session_start();

$username = $_POST['admin_username'];
$password = $_POST['admin_password'];

$username_2 = $_POST['cus_username'];
$password_2 = $_POST['cus_password'];

$username_3 = $_POST['emp_username'];
$password_3 = $_POST['emp_password'];
 
$username = $mysqli->real_escape_string($username);
$username_2 = $mysqli_2->real_escape_string($username_2);
$username_3 = $mysqli_3->real_escape_string($username_3);
 
$query = "SELECT Email, Password FROM SYS_ADMIN WHERE Email = '$username' AND Address='$password';";
$result = $mysqli->query($query);

$query_2 = "SELECT Cus_ID, Req_ID FROM CUSTOMER WHERE Cus_ID = '$username_2' AND Address='$password_2';";
$result_2 = $mysqli_2->query($query_2);

$query_3 = "SELECT Emp_ID, Password FROM EMPLOYEE WHERE Emp_ID = '$username_3' AND Address='$password_3';";
$result_3 = $mysqli_3->query($query_3);


if($result->num_rows == 1) 
{
	
	$admin_query = "SELECT * FROM SYS_ADMIN WHERE Email = '$username'";
	$admin_result = mysqli_query($conn, $admin_query);
	$admin_row = mysqli_fetch_assoc($admin_result);
	$admin_pass = $admin_row['Password'];
	
	echo '<script>';
	echo 'Swal.fire({
		title: "Found!",
		text: "Your Password is '.$admin_pass.'!",
		icon: "success",
		confirmButtonText: "OK",
		closeOnConfirm: true
	}).then((result) => {
		if (result.isConfirmed) {
			window.location="login.php";
		}
	});';
	echo '</script>';

	 
}

else if($result_2->num_rows == 1) 
{
	$cus_query = "SELECT * FROM CUSTOMER WHERE Cus_ID = '$username_2'";
	$cus_result = mysqli_query($conn, $cus_query);
	$cus_row = mysqli_fetch_assoc($cus_result);
	$cus_pass = $cus_row['Req_ID'];
	
	echo '<script>';
	echo 'Swal.fire({
		title: "Found!",
		text: "Your Request ID is '.$cus_pass.'!",
		icon: "success",
		confirmButtonText: "OK",
		closeOnConfirm: true
	}).then((result) => {
		if (result.isConfirmed) {
			window.location="login.php";
		}
	});';
	echo '</script>';
	
	
}
else if($result_3->num_rows == 1) 
{
	$emp_query = "SELECT * FROM EMPLOYEE WHERE Emp_ID = '$username_3'";
	$emp_result = mysqli_query($conn, $emp_query);
	$emp_row = mysqli_fetch_assoc($emp_result);
	$emp_pass = $emp_row['Password'];
	
	echo '<script>';
	echo 'Swal.fire({
		title: "Found!",
		text: "Your Password is '.$emp_pass.'!",
		icon: "success",
		confirmButtonText: "OK",
		closeOnConfirm: true
	}).then((result) => {
		if (result.isConfirmed) {
			window.location="login.php";
		}
	});';
	echo '</script>';
	
	
}
else{ 
	echo '<script>';
		echo 'Swal.fire({
                    title: "No Data!",
                    text: "No match records found!",
                    icon: "error",
                    confirmButtonText: "OK",
                    closeOnConfirm: true
                  }).then((result) => {
                    if (result.isConfirmed) {
                      window.location="forgotCredentials.php";
                    }
                  });';
        echo '</script>';
	
}
?>
</body>