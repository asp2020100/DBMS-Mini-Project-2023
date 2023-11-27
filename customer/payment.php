
<?php
session_start();
include("config.php");
$query = "SELECT * FROM PAYMENT_HISTORY WHERE Cus_ID = '" . $_SESSION['user_2'] . "' ORDER BY Month DESC";

$result = filterRecord($query);

	
	function filterRecord($query)
	{
		include("config.php");
		$filter_result = mysqli_query($mysqli, $query);
		return $filter_result;
	}
?>
<html>
	<head>
		<link type="text/css" href="assets/css/bootstrap.min.css" rel="stylesheet">	
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<style>

	@font-face {
		font-family: "Montserrat";
		src: url("assets/fonts/Montserrat.ttf") format("truetype");
	}

	th {
    background-color: #33cccc;
    color: white;
	
	}
	
	.custom-button {
    font-family: Montserrat;
    background-color: #33cccc;
    color: black;
    border: none;
    border-radius: 20px;
    padding: 8px 16px;
    transition: background-color 0.3s ease;
  }
  .custom-button:hover {
    background-color: #2196f3;
	color: white;
  }
  
  .round-button {
      background-color: #33cccc;
	  border: none;
	  color: black;
	  padding: 10px;
	  text-align: left;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 25px;
	  margin: 4px 2px;
	  border-radius: 12px;
	  width: 210px;
	  font-family:Montserrat; 
	  
    }
	
	.round-button:hover {
      background-color: darkred;
	  color: white;
    }
	
	th, td {
    text-align: left;
    padding: 8px;
	font-family:Montserrat;
	
}


</style>

 
<body style="background-color: hsla(0,0%,100%,0.8)">


<div class="page-header" >

<?php
include("config.php");
date_default_timezone_set('America/New_York');
$current_month = date('n');
$current_year = date('Y');

$query = "SELECT * FROM ACCOUNT WHERE Cus_ID  = '{$_SESSION['user_2']}' AND Month = DATE_FORMAT(CURDATE(), '%Y-%m');";
$result2 = mysqli_query($conn, $query);
if(mysqli_num_rows($result2) == 0) {
    $payment_status = 'Inactive';
?>
    <h3 style="font-family:Montserrat;margin-left:5%;">
        <a href="payment_done.php">
            <div id="invoice-button" class="round-button" style="float:right; margin-right:40px;">
                <i class="fa fa-money"></i> | Pay Here
            </div>
        </a>
        Payment Portal
    </h3>
    <p3 style="font-family:Montserrat;margin-left:5%;">Use 'Pay Here' to pay for this month rental on your supply.</p3>
<?php 
} else {
    $payment_status = 'Active';
?>
    <h3 style="font-family:Montserrat;margin-left:5%;">Payment Portal
	<a href="payment_reset.php">
            <div id="invoice-button" class="round-button" style="float:right; margin-right:40px;">
                <i class="fa fa-info"></i> | Reset (Test)
            </div>
        </a></h3>
	
    <p3 style="font-family:Montserrat;margin-left:5%;">You have successfully paid for the current month.</p3>
<?php
}
?>


</div>

<div class="body_class" >
   <div class="table_container" style="overflow-y: scroll; height:65%; width:90%; margin-left:5%;">
  
<?php

echo "<table border='1' ;table width='100%'>
<tr>

</tr>";

while($row = mysqli_fetch_array($result))
{
echo "<tr>";
echo "<td>" . $row['Month'] . "</td>";
echo "<td>" . $row['Paid_Date'] . "</td>";
echo "<td>" . $row['Paid_Amount'] . "</td>";
echo "<td><a href='print_invoice.php?Month=".$row['Month']."'><img src='./images/icons8-Print-32.png' alt='Edit'></a></td>";
	
echo "</tr>";
}
echo "</table>";

?>


</div>
</div>
</body>

</html>





