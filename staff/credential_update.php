<?php
include("config.php");
include("session.php");
?>
<head>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.all.min.js"></script>
</head>
<?php

$firstname = $_POST['firstname'];
$middlename = $_POST['lastname'];
$lastname = $_POST['address'];
$password = $_POST['password'];

$sql = "UPDATE EMPLOYEE SET Fname='$firstname', Lname='$middlename', Address='$lastname', Password='$password' 
WHERE Emp_ID = '{$_SESSION['user_4']}'";


if(mysqli_query($mysqli, $sql)){
	
	
} else {
	
}
?>

<body>
<?php
       
            echo '<script>';
            echo 'Swal.fire({
                    title: "Success!",
                    text: "Data has been modified!",
                    icon: "success",
                    confirmButtonText: "OK",
                    closeOnConfirm: true
                  }).then((result) => {
                    if (result.isConfirmed) {
                      window.location="credential_view.php";
                    }
                  });';
            echo '</script>';
        
?>
</body>