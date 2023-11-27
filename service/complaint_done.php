
<?php

include("session.php");
include("config.php");
$compid = $_GET['Comp_ID'];

if(isset($_GET['Comp_ID'])) {
	$query2 = "INSERT INTO SOLVES (Emp_ID, Comp_ID, Date) VALUES (?, ?, CURDATE());";
	$stmt2 = $mysqli->prepare($query2);
	$stmt2->bind_param("ii", $_SESSION['user_5'], $compid);
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
                    title: "Done!",
                    text: "Complaint completed!",
                    icon: "success",
                    confirmButtonText: "OK",
                    closeOnConfirm: true
                  }).then((result) => {
                    if (result.isConfirmed) {
                      window.location="complaints.php";
                    }
                  });';
            echo '</script>';
        
?>
</body>
