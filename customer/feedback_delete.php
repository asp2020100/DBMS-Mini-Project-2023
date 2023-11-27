<?php
include("config.php");
include("session.php");

$id = $_GET['Feedback_ID'];
?>

<head>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.all.min.js"></script>
</head>

<body>
<?php
       
            echo '<script>';
            echo 'Swal.fire({
                    title: "Success!",
                    text: "Feedback has been removed.",
                    icon: "info",
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
<?php
$sql = "DELETE FROM FEEDBACK WHERE Feedback_ID='$id'";
if(mysqli_query($mysqli, $sql)){
    
	
}
?>