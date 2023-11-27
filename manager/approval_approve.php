
<?php
session_start();
include("config.php");

if(isset($_GET['Req_ID'])) {
    $Req_ID = $_GET['Req_ID'];

    $query = "UPDATE NEW_CONNECTION SET Req_Status='Approved' WHERE Req_ID=?";
    $stmt = $mysqli->prepare($query);
    $stmt->bind_param("i", $Req_ID);
    $stmt->execute();

	
	$query2 = "INSERT INTO APPROVES (Mgr_ID,Req_ID,Date) VALUES (?, ?, CURDATE())";
	$stmt2 = $mysqli->prepare($query2);
	$stmt2->bind_param("ii", $_SESSION['user_3'], $Req_ID);
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
                    title: "Approved!",
                    text: "Request is approved and Pending Establishment",
                    icon: "success",
                    confirmButtonText: "OK",
                    closeOnConfirm: true
                  }).then((result) => {
                    if (result.isConfirmed) {
                      window.location="approvals.php";
                    }
                  });';
            echo '</script>';
        
?>
</body>
