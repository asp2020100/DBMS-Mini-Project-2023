<?php
include("config.php");
include("session.php");

?>

<head>
    <script src="js/sweetalert2.all.min.js"></script>
</head>

<body>
<?php
       
            echo '<script>';
            echo 'Swal.fire({
                    title: "Success!",
                    text: "Data has been saved.",
                    icon: "success",
                    confirmButtonText: "OK",
                    closeOnConfirm: true
                  }).then((result) => {
                    if (result.isConfirmed) {
                      window.location="service.php";
                    }
                  });';
            echo '</script>';
        
?>
</body>

<?php

$firstname = $_POST['firstname'];
$lastname = $_POST['lastname'];
$address = $_POST['address'];
$birthdate = $_POST['birthdate'];
$sex = $_POST['sex'];
$password = $_POST['password'];

$sql = "INSERT INTO EMPLOYEE(Fname, Lname, Address, DoB, Sex, Password) 
VALUES('$firstname', '$lastname', '$address', '$birthdate', '$sex', '$password')";



if(mysqli_query($mysqli, $sql)){
    $emp_id = mysqli_insert_id($mysqli);
    $sql_admin = "SELECT * FROM SYS_ADMIN WHERE Email = '" . $_SESSION['user'] . "'";
    $result = $mysqli->query($sql_admin);
    if (mysqli_num_rows($result) > 0) {
        while($rowData = mysqli_fetch_array($result)){

            $query2 = "INSERT INTO MANIPULATES (Emp_ID, Email, Date) VALUES ('$emp_id', '" . $rowData["Email"] . "', NOW())";
            mysqli_query($mysqli, $query2);
            $area = $_POST['area'];
			$type = $_POST['type'];
            $query3 = "INSERT INTO SERVICE_PERSONNAL (Emp_ID, Area, Type) VALUES ('$emp_id', '$area', '$type')";
            mysqli_query($mysqli, $query3);
        }
    }
}
