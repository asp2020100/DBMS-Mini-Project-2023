<?php
include("config.php");
include("session.php");
?>
<head>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.all.min.js"></script>
</head>
<?php

$firstname = $_POST['firstname'];
$lastname = $_POST['lastname'];
$address = $_POST['address'];
$phone = $_POST['phone'];

$sql = "UPDATE CUSTOMER SET Fname='$firstname', Lname='$lastname', Address='$address', Phone='$phone' 
WHERE Cus_ID = '{$_SESSION['user_2']}'";

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