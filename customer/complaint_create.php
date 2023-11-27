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
                    title: "Done!",
                    text: "Your complaint is recorded!",
                    icon: "success",
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

$desc = $_POST['desc'];
$option = $_POST['complaint_nature'];

if(empty($desc)) {
  $desc = $option;
}

$sql = "INSERT INTO COMPLAINT(Cus_ID, Date, Description) 
VALUES('" . $_SESSION['user_2'] . "', CURDATE(), '$desc')";
mysqli_query($mysqli, $sql);


