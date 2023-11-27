<?php
include("config.php");
include("session.php");

$id = $_GET['Comp_ID'];
?>

<head>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.all.min.js"></script>
</head>

<body>
<?php
       
            echo '<script>';
            echo 'Swal.fire({
                    title: "Success!",
                    text: "Complaint has been removed.",
                    icon: "info",
                    confirmButtonText: "OK",
                    closeOnConfirm: true
                  }).then((result) => {
                    if (result.isConfirmed) {
                      window.location="complaint.php";
                    }
                  });';
            echo '</script>';
        
?>
</body>
<?php
$sql = "DELETE FROM COMPLAINT WHERE Comp_ID='$id'";
if(mysqli_query($mysqli, $sql)){
    
	
}
?>