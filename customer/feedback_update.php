<?php
include("config.php");
include("session.php");
?>
<head>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.all.min.js"></script>
</head>
<?php
$id = $_POST['feedbackid'];
$description = $_POST['desc'];


$sql = "UPDATE FEEDBACK SET Description='$description'
WHERE Feedback_ID='$id'";
mysqli_query($mysqli, $sql);


?>

<body>
<?php
       
            echo '<script>';
            echo 'Swal.fire({
                    title: "Done!",
                    text: "Feedback has been updated!",
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