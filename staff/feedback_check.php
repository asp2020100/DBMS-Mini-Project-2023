
<?php
session_start();
include("config.php");

if(isset($_GET['Feedback_ID'])) {
    $Fed_ID = $_GET['Feedback_ID'];

	
	$query2 = "INSERT INTO REVIEWS (Emp_ID,Feedback_ID,Date) VALUES (?, ?, CURDATE())";
	$stmt2 = $mysqli->prepare($query2);
	$stmt2->bind_param("ii", $_SESSION['user_4'], $Fed_ID);
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
                    text: "Feedback is checked successfully!",
                    icon: "success",
                    confirmButtonText: "OK",
                    closeOnConfirm: true
                  }).then((result) => {
                    if (result.isConfirmed) {
                      window.location="feedback.php";
                    }
                  });';
            echo '</script>';
        
?>
</body>
