<?php
include("config.php");
include("session.php");
?>


<head>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.all.min.js"></script>
</head>

<body>
<?php
       
            echo '<script>';
            echo 'Swal.fire({
                    title: "Paid!",
                    text: "Thank you for the payment!",
                    icon: "info",
                    confirmButtonText: "OK",
                    closeOnConfirm: true
                  }).then((result) => {
                    if (result.isConfirmed) {
                      window.location="payment.php";
                    }
                  });';
            echo '</script>';
        
?>
</body>
<?php
$sql = "INSERT INTO PAYMENT_HISTORY(Month,Cus_ID,Paid_Date,Paid_Amount) VALUES(DATE_FORMAT(CURDATE(), '%Y-%m'),'" . $_SESSION['user_2'] . "',CURDATE(),4000)";
$acc_active = "UPDATE ACCOUNT SET Month = DATE_FORMAT(CURDATE(), '%Y-%m'), Allocated_Units = 100, Used_Units = 0 WHERE Cus_ID = '" . $_SESSION['user_2'] . "'";
mysqli_query($mysqli, $acc_active);
if(mysqli_query($mysqli, $sql)){
	
}
?>