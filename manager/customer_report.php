<?php
session_start();
include("config.php");
$req_id = $_GET['Req_ID'];


$cus_sql = "SELECT c.*, nc.Date AS NC_Date, a.Date AS A_Date, e.Date AS E_Date
	FROM Customer c
	INNER JOIN NEW_CONNECTION nc ON c.Req_ID = nc.Req_ID
	INNER JOIN APPROVES a ON nc.Req_ID = a.Req_ID
	INNER JOIN ESTABLISHES e ON nc.Req_ID = e.Req_ID
	WHERE c.Req_ID = '$req_id'"; 
$result_cus = mysqli_query($conn, $cus_sql);


if (mysqli_num_rows($result_cus) > 0) {
  $row = mysqli_fetch_assoc($result_cus);
  $cus_id = $row['Cus_ID'];

} else {
  
}

mysqli_close($conn);
?>

<!DOCTYPE html>
<html>
<head>
  <title>User Profile</title>
</head>


<style>

	@font-face {
		font-family: "Montserrat";
		src: url("assets/fonts/Montserrat.ttf") format("truetype");
	}

	th {
    background-color: grey;
    color: white;
	
	}

	th, td {
    text-align: center;
    padding: 8px;
	font-family:Montserrat;
	
	
}


</style>

<body style="background-color: hsla(0,0%,100%,0.8);margin-left:10px;">
<h1 style="font-family:Montserrat;text-align:center;"><?php echo $row['Fname'] . " " . $row['Lname']; ?></h1>
  <div style="display: flex;">
   
	
	<div style="flex: 2;margin-left:15%">
 
      <p style="font-family:Montserrat;text-align:left;">Address: <?php echo $row['Address']; ?></p>
      <p style="font-family:Montserrat;text-align:left;">Phone: <?php echo $row['Phone']; ?></p>
	  <p style="font-family:Montserrat;text-align:left;">Customer ID: <?php echo $row['Cus_ID']; ?></p>
	  <p style="font-family:Montserrat;text-align:left;">Request ID: <?php echo $row['Req_ID']; ?></p>
      
    </div>
	
	<div style="flex: 3;;margin-left:10%">

      <p style="font-family:Montserrat;text-align:left;">Requested Date: 	<?php echo $row['NC_Date']; ?></p>
      <p style="font-family:Montserrat;text-align:left;">Approved Date: <?php echo $row['A_Date']; ?></p>
      <p style="font-family:Montserrat;text-align:left;">Established Date: <?php echo $row['E_Date']; ?></p>
    </div>
  </div>
  
  <div>
    <h2 style="font-family:Montserrat;text-align:center;">Water Connection</h2>
    <table border='1' ;table width='100%'>
      <thead>
        <tr>
          <th>Month</th>
          <th>Units Allocated</th>
          <th>Units Used</th>
        </tr>
      </thead>
      <tbody>
        <?php
        // Query data for table 1 from database
		include("config.php");
        $sql = "SELECT * FROM ACCOUNT WHERE Cus_ID = '$cus_id'"; // Replace 1 with actual user ID
        $result = mysqli_query($conn, $sql);

		
        while ($row = mysqli_fetch_assoc($result)) {
          echo "<tr>";
          echo "<td>" . $row['Month'] . "</td>";
          echo "<td>" . $row['Allocated_Units'] . "</td>";
          echo "<td>" . $row['Used_Units'] . "</td>";
          echo "</tr>";
        }
        ?>
      </tbody>
    </table>
  </div>
  
  <div>
    <h2 style="font-family:Montserrat;text-align:center;">Payment History</h2>
    <table border='1' ;table width='100%'>
      <thead>
        <tr>
          <th>Month</th>
          <th>Paid Date</th>
          <th>Amount Paid</th>
        </tr>
      </thead>
      <tbody>
        <?php
        // Query data for table 1 from database
		include("config.php");
        $sql = "SELECT * FROM PAYMENT_HISTORY WHERE Cus_ID = '$cus_id' ORDER BY Month DESC"; // Replace 1 with actual user ID
        $result = mysqli_query($conn, $sql);

		
        while ($row = mysqli_fetch_assoc($result)) {
          echo "<tr>";
          echo "<td>" . $row['Month'] . "</td>";
          echo "<td>" . $row['Paid_Date'] . "</td>";
          echo "<td>" . $row['Paid_Amount'] . "</td>";
          echo "</tr>";
        }
        ?>
      </tbody>
    </table>
  </div>
  
  <div>
    <h2 style="font-family:Montserrat;text-align:center;">Complaints</h2>
    <table border='1' ;table width='100%'>
      <thead>
        <tr>
          <th>Comp_ID</th>
          <th>Date</th>
          <th>Description</th>
        </tr>
      </thead>
      <tbody>
        <?php
        // Query data for table 1 from database
		include("config.php");
        $sql = "SELECT * FROM COMPLAINT WHERE Cus_ID = '$cus_id' ORDER BY Comp_ID DESC"; // Replace 1 with actual user ID
        $result = mysqli_query($conn, $sql);

        while ($row = mysqli_fetch_assoc($result)) {
          echo "<tr>";
          echo "<td>" . $row['Comp_ID'] . "</td>";
          echo "<td>" . $row['Date'] . "</td>";
          echo "<td>" . $row['Description'] . "</td>";
          echo "</tr>";
        }
        ?>
      </tbody>
    </table>
  </div>
  
  <div>
    <h2 style="font-family:Montserrat;text-align:center;">Feedback</h2>
    <table border='1' ;table width='100%'>
      <thead>
        <tr>
          <th>Feedback_ID</th>
          <th>Date</th>
          <th>Description</th>
        </tr>
      </thead>
      <tbody>
        <?php
        // Query data for table 1 from database
		include("config.php");
        $sql = "SELECT * FROM FEEDBACK WHERE Cus_ID = '$cus_id' ORDER BY Feedback_ID DESC"; // Replace 1 with actual user ID
        $result = mysqli_query($conn, $sql);

        while ($row = mysqli_fetch_assoc($result)) {
          echo "<tr>";
          echo "<td>" . $row['Feedback_ID'] . "</td>";
          echo "<td>" . $row['Date'] . "</td>";
          echo "<td>" . $row['Description'] . "</td>";
          echo "</tr>";
        }
        ?>
      </tbody>
    </table>
  </div>
  
  <div>
</body>
</html>
