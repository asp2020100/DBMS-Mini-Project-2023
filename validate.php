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
 
$query = "SELECT Email, Password FROM SYS_ADMIN WHERE Email = '$username' AND Password='$password';";
$result = $mysqli->query($query);

$query_2 = "SELECT Cus_ID, Req_ID FROM CUSTOMER WHERE Cus_ID = '$username_2' AND Req_ID='$password_2';";
$result_2 = $mysqli_2->query($query_2);

$query_3 = "SELECT Emp_ID, Password FROM EMPLOYEE WHERE Emp_ID = '$username_3' AND Password='$password_3';";
$result_3 = $mysqli_3->query($query_3);

$query_4 = "SELECT Emp_ID FROM MANAGER WHERE Emp_ID = '$username_3';";
$result_4 = $mysqli_3->query($query_4);
$query_5 = "SELECT Emp_ID FROM STAFF WHERE Emp_ID = '$username_3';";
$result_5 = $mysqli_3->query($query_5);
$query_6 = "SELECT Emp_ID FROM SERVICE_PERSONNAL WHERE Emp_ID = '$username_3';";
$result_6 = $mysqli_3->query($query_6);

 
if($result->num_rows == 1) 
{
	
	$_SESSION['user'] = $username;
		echo '<script>';
            echo 'Swal.fire({
                    title: "Done!",
                    text: "Successfully logged in!",
                    icon: "success",
                    confirmButtonText: "OK",
                    closeOnConfirm: true
                  }).then((result) => {
                    if (result.isConfirmed) {
                      window.location="admin/home.php";
                    }
                  });';
        echo '</script>';
}
else if($result_2->num_rows == 1) 
{
	
	$sql = "SELECT COUNT(*) as total
        FROM ESTABLISHES
        WHERE Req_ID = '$password_2'";

	$result = $conn->query($sql);
	$row = $result->fetch_assoc();

	if ($row['total'] == 1 ) {
		$_SESSION['user_2'] = $username_2;
		echo '<script>';
            echo 'Swal.fire({
                    title: "Done!",
                    text: "Successfully logged in!",
                    icon: "success",
                    confirmButtonText: "OK",
                    closeOnConfirm: true
                  }).then((result) => {
                    if (result.isConfirmed) {
                      window.location="customer/home.php";
                    }
                  });';
        echo '</script>';
	} else { 
		echo '<script>';
		echo 'Swal.fire({
                    title: "Stop!",
                    text: "Your connection is not activated yet!",
                    icon: "error",
                    confirmButtonText: "OK",
                    closeOnConfirm: true
                  }).then((result) => {
                    if (result.isConfirmed) {
                      window.location="login.php";
                    }
                  });';
        echo '</script>';
		
	}
	
}
else if($result_3->num_rows == 1) 
{
	
	if($result_4->num_rows == 1) 
	{
	$_SESSION['user_3'] = $username_3;

		echo '<script>';
            echo 'Swal.fire({
                    title: "Done!",
                    text: "Successfully logged in!",
                    icon: "success",
                    confirmButtonText: "OK",
                    closeOnConfirm: true
                  }).then((result) => {
                    if (result.isConfirmed) {
                      window.location="manager/home.php";
                    }
                  });';
        echo '</script>';
	
	}
	else if($result_5->num_rows == 1) 
	{
	$_SESSION['user_4'] = $username_3;
		echo '<script>';
            echo 'Swal.fire({
                    title: "Done!",
                    text: "Successfully logged in!",
                    icon: "success",
                    confirmButtonText: "OK",
                    closeOnConfirm: true
                  }).then((result) => {
                    if (result.isConfirmed) {
                      window.location="staff/home.php";
                    }
                  });';
        echo '</script>';
	}
	else if($result_6->num_rows == 1) 
	{
	$_SESSION['user_5'] = $username_3;
		echo '<script>';
            echo 'Swal.fire({
                    title: "Done!",
                    text: "Successfully logged in!",
                    icon: "success",
                    confirmButtonText: "OK",
                    closeOnConfirm: true
                  }).then((result) => {
                    if (result.isConfirmed) {
                      window.location="service/home.php";
                    }
                  });';
        echo '</script>';
	}
	
}
else{ 
	echo '<script>';
		echo 'Swal.fire({
                    title: "Wrong credentials!",
                    text: "Try again!",
                    icon: "error",
                    confirmButtonText: "OK",
                    closeOnConfirm: true
                  }).then((result) => {
                    if (result.isConfirmed) {
                      window.location="login.php";
                    }
                  });';
        echo '</script>';
	
}
?>
</body>