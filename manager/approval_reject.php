
<?php
session_start();
include("config.php");

if(isset($_GET['Req_ID'])) {
    $Req_ID = $_GET['Req_ID'];

    $query = "UPDATE NEW_CONNECTION SET Req_Status='Rejected' WHERE Req_ID=?";
    $stmt = $mysqli->prepare($query);
    $stmt->bind_param("i", $Req_ID);
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
                    title: "Rejected!",
                    text: "Request is rejected!",
                    icon: "info",
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
