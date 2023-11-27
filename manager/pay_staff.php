
<?php

include("session.php");
include("config.php");
$empid = $_GET['Emp_ID'];

if(isset($_GET['Emp_ID'])) {
	$query2 = "INSERT INTO SALARY (Mgr_ID, Emp_ID, Date, Amount_Paid) VALUES (?, ?, CURDATE(), 60000.00);";
	$stmt2 = $mysqli->prepare($query2);
	$stmt2->bind_param("ii", $_SESSION['user_3'], $empid);
	$stmt2->execute();
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
                    text: "Rs. 60,000/= has been paid for this month!",
                    icon: "success",
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
