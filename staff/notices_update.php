<?php
include("config.php");
include("session.php");
?>
<head>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.all.min.js"></script>
</head>
<?php
$id = $_POST['noticeid'];
$description = $_POST['desc'];


$sql = "UPDATE NOTICE_BOARD SET Description='$description'
WHERE Notice_ID='$id'";
mysqli_query($mysqli, $sql);


?>

<body>
<?php
       
            echo '<script>';
            echo 'Swal.fire({
                    title: "Success!",
                    text: "Notice has been modified!",
                    icon: "success",
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