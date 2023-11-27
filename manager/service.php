
<?php
session_start();
$query = "SELECT EMPLOYEE.*, SERVICE_PERSONNAL.*
FROM EMPLOYEE
INNER JOIN SERVICE_PERSONNAL ON EMPLOYEE.Emp_ID = SERVICE_PERSONNAL.Emp_ID
";
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

<div class="page-header">
<?php
date_default_timezone_set('America/New_York');
$current_month = date('n');
$current_year = date('Y');
?>
<h3 style="font-family: Montserrat; margin-left: 5%;">Account Information - Service Personal</h3>
<p3 style="font-family: Montserrat; margin-left: 5%;">You may see their details and pay them for the current month (<?php echo $current_year.'/'.$current_month; ?>) here.</p3>
</div>



<div class="body_class" >
   <div class="table_container" style="overflow-y: scroll; height:65%; width:90%; margin-left:5%;">
  
<?php
include("config.php");
date_default_timezone_set('America/New_York');
$current_month = date('n');
$current_year = date('Y');

echo "<table border='1' ;table width='100%'>
<tr>

</tr>";

while($row = mysqli_fetch_array($result))
{
echo "<tr>";
echo "<td>" . $row['Fname'] . " " . $row['Lname'] . "</td>";
echo "<td>" . $row['Address'] . "</td>";
echo "<td>" . $row['DoB'] . "</td>";
echo "<td>" . $row['Sex'] . "</td>";
echo "<td>" . $row['Emp_ID'] . "</td>";
echo "<td>" . $row['Area'] . "</td>";
echo "<td>" . $row['Type'] . "</td>";


$empid = $row['Emp_ID'];
  $query = "SELECT * FROM SALARY WHERE Emp_ID = $empid AND YEAR(Date) = $current_year AND MONTH(Date) = $current_month";
  $result2 = mysqli_query($conn, $query);
  if(mysqli_num_rows($result2) == 0) {
    echo "<td><a href='pay_service.php?Emp_ID_2=".$row['Emp_ID']."'><img src='./images/icons8-currency-exchange-32.png' alt='Edit'></a></td>";
  } else {
    echo "<td><img src='./images/icons8-paid-bill-32.png' alt='Edit'></a></td>";
  }

echo "</tr>";
}
echo "</table>";

?>

</div>
</div>
</body>

</html>





