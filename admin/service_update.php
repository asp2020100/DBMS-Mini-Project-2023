<?php
include("config.php");
include("session.php");
?>
<head>
    <script src="js/sweetalert2.all.min.js"></script>
</head>
<?php
$id = $_POST['id'];
$firstname = $_POST['firstname'];
$middlename = $_POST['lastname'];
$lastname = $_POST['address'];
$birthdate = $_POST['birthdate'];
$area = $_POST['area'];
$type = $_POST['type'];
$password = $_POST['password'];

$sql = "UPDATE EMPLOYEE SET Fname='$firstname', Lname='$middlename', Address='$lastname', DoB='$birthdate', Password='$password' 
WHERE Emp_ID='$id'";
$sql2 = "UPDATE SERVICE_PERSONNAL SET Area='$area', Type='$type'
WHERE Emp_ID='$id'";

if(mysqli_query($mysqli, $sql)){
	
    
	if(mysqli_query($mysqli, $sql2)){
		
	}
	
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
                      window.location="service.php";
                    }
                  });';
            echo '</script>';
        
?>
</body>