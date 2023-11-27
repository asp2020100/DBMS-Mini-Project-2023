<?php
include("config.php");
include("session.php");

$id = $_GET['Notice_ID'];
?>

<head>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.all.min.js"></script>
</head>

<body>
<?php
       
            echo '<script>';
            echo 'Swal.fire({
                    title: "Success!",
                    text: "Notice has been deleted.",
                    icon: "info",
                    confirmButtonText: "OK",
                    closeOnConfirm: true
                  }).then((result) => {
                    if (result.isConfirmed) {
                      window.location="notices.php";
                    }
                  });';
            echo '</script>';
        
?>
</body>
<?php
$sql = "DELETE FROM NOTICE_BOARD WHERE Notice_ID='$id'";
if(mysqli_query($mysqli, $sql)){
    
	
}
?>