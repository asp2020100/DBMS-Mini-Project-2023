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
                    title: "Thank You!",
                    text: "We will check it soon!",
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

<?php

$desc = $_POST['desc'];


$sql = "INSERT INTO FEEDBACK(Cus_ID,Date,Description) 
VALUES('" . $_SESSION['user_2'] . "',CURDATE(),'$desc')";
mysqli_query($mysqli, $sql);

