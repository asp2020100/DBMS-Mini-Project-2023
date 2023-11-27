<?php
// MySQL database configuration
$host = 'localhost';
$username = 'root';
$password = '';
$database = 'diyaluma';

// Backup file name and location
$backup_file = 'backup/diyaluma.sql';

// Connect to the database
$conn = new mysqli($host, $username, $password, $database);

// Check for errors
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Set charset to utf8mb4 to support special characters
$conn->set_charset("utf8mb4");

// Get all table names
$tables = array();
$result = $conn->query("SHOW TABLES");
while ($row = $result->fetch_array(MYSQLI_NUM)) {
    $tables[] = $row[0];
}

// Loop through each table and create a backup
foreach ($tables as $table) {
    // Get table structure and data
    $result = $conn->query("SELECT * FROM $table");
    $num_fields = $result->field_count;

    // Create table structure
    $sql = "DROP TABLE IF EXISTS $table;\n";
    $row2 = $conn->query("SHOW CREATE TABLE $table")->fetch_array(MYSQLI_NUM);
    $sql .= $row2[1] . ";\n";

    // Loop through each row and insert data
    while ($row = $result->fetch_array(MYSQLI_NUM)) {
        $sql .= "INSERT INTO $table VALUES(";
        for ($i = 0; $i < $num_fields; $i++) {
            $row[$i] = $conn->real_escape_string($row[$i]);
            if ($row[$i] === null) {
                $sql .= "NULL";
            } else {
                $sql .= "'" . $row[$i] . "'";
            }
            if ($i < $num_fields - 1) {
                $sql .= ",";
            }
        }
        $sql .= ");\n";
    }

    // Save SQL to backup file
    file_put_contents($backup_file, $sql, FILE_APPEND);
}

// Close database connection
$conn->close();

// Provide a download link to the user
echo "<a href='$backup_file' id='download-link'></a>";
?>

<script>
// Simulate click on the download link when the page loads
window.onload = function() {
  document.getElementById('download-link').click();
};

</script>

<head>
    <script src="js/sweetalert2.all.min.js"></script>
</head>

<body>
<?php
       
            echo '<script>';
            echo 'Swal.fire({
                    title: "Success!",
                    text: "Data has been backed up!",
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