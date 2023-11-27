<?php
// MySQL database configuration
$host = 'localhost';
$username = 'root';
$password = '';
$database = 'diyaluma';

// Connect to the database
$conn = new mysqli($host, $username, $password, $database);

// Check for errors
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Truncate the EMPLOYEE table
$conn->query("DELETE FROM EMPLOYEE");

// Insert the initial data into the EMPLOYEE table

// Close database connection
$conn->close();

?>
<head>
    <script src="js/sweetalert2.all.min.js"></script>
</head>

<body>
<?php
       
            echo '<script>';
            echo 'Swal.fire({
                    title: "Success!",
                    text: "Employee data has beeen reset!",
                    icon: "success",
                    confirmButtonText: "OK",
                    closeOnConfirm: true
                  }).then((result) => {
                    if (result.isConfirmed) {
                      window.location="site_settings.php";
                    }
                  });';
            echo '</script>';
        
?>
</body>


