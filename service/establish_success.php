<?php

include("session.php");
include("config.php");
$reqid = $_GET['Req_ID'];

if (isset($_GET['Req_ID'])) {
    // Retrieve the customer ID for the given Req_ID
    $query1 = "SELECT Cus_ID FROM CUSTOMER WHERE Req_ID = ?";
    $stmt1 = $mysqli->prepare($query1);
    $stmt1->bind_param("i", $reqid);
    $stmt1->execute();
    $stmt1->bind_result($cusid);
    $stmt1->fetch();
    $stmt1->close();

    // Insert the Emp_ID, Req_ID, and Date into the ESTABLISHES table
    $query2 = "INSERT INTO ESTABLISHES (Emp_ID, Req_ID, Date) VALUES (?, ?, CURDATE());";
    $stmt2 = $mysqli->prepare($query2);
    $stmt2->bind_param("ii", $_SESSION['user_5'], $reqid);
    $stmt2->execute();

    // Use the retrieved Cus_ID for further processing
    $cus_id_variable = $cusid;

    // update ACCOUNT table
    $query3 = "UPDATE ACCOUNT SET Month = DATE_FORMAT(CURDATE(), '%Y-%m'), Allocated_Units = 100, Used_Units = 0 WHERE Cus_ID = '$cus_id_variable'";
    $stmt3 = $mysqli->prepare($query3);
    $stmt3->execute();
    $stmt3->close();
	
	// set initial payment
	$query4 = "INSERT INTO PAYMENT_HISTORY (Month,Cus_ID,Paid_Date,Paid_Amount) VALUES (DATE_FORMAT(CURDATE(), '%Y-%m'),'$cus_id_variable',CURDATE(),4000)";
    $stmt4 = $mysqli->prepare($query4);
    $stmt4->execute();
    $stmt4->close();
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
                    text: "Water Connection Established!",
                    icon: "success",
                    confirmButtonText: "OK",
                    closeOnConfirm: true
                  }).then((result) => {
                    if (result.isConfirmed) {
                      window.location="establish.php";
                    }
                  });';
            echo '</script>';
        
?>
</body>
