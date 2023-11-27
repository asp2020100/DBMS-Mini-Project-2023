<?php
include("config.php");
include("session.php");

$id = $_GET['Emp_ID'];
?>

<head>
    <script src="js/sweetalert2.all.min.js"></script>
</head>

<body>
<?php
       
            echo '<script>';
            echo 'Swal.fire({
                    title: "Success!",
                    text: "Data has been deleted.",
                    icon: "info",
                    confirmButtonText: "OK",
                    closeOnConfirm: true
                  }).then((result) => {
                    if (result.isConfirmed) {
                      window.location="staff.php";
                    }
                  });';
            echo '</script>';
        
?>
</body>
<?php
$sql = "DELETE FROM EMPLOYEE WHERE Emp_ID='$id'";
if(mysqli_query($mysqli, $sql)){
    
	
}
?>