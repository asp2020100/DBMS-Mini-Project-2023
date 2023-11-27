
<?php

include("session.php");
include("config.php");
$empid = $_GET['Emp_ID_2'];

if(isset($_GET['Emp_ID_2'])) {
	$query = "INSERT INTO SALARY (Mgr_ID, Emp_ID, Date, Amount_Paid) VALUES (?, ?, CURDATE(), 45000.00);";
	$stmt = $mysqli->prepare($query);
	$stmt->bind_param("ii", $_SESSION['user_3'], $empid);
	$stmt->execute();
}

?>

<head>
    <script src="js/sweetalert2.all.min.js"></script>
</head>

<body>
<?php
       
            echo '<script>';
            echo 'Swal.fire({
                    title: "Paid!",
                    text: "Rs. 45,000/= has been paid for this month!",
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
