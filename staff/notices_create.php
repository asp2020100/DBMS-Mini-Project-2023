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
                    title: "Success!",
                    text: "Notice has been added!",
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

<?php

$desc = $_POST['desc'];


$sql = "INSERT INTO NOTICE_BOARD(Emp_ID,Date,Description) 
VALUES('" . $_SESSION['user_4'] . "',CURDATE(),'$desc')";
mysqli_query($mysqli, $sql);

