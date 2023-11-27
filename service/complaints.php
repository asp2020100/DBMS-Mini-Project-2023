
<?php
session_start();
include("config.php");
$area_query = "SELECT Area FROM SERVICE_PERSONNAL WHERE Emp_ID = '{$_SESSION['user_5']}'";
$area_result = mysqli_query($mysqli, $area_query);
$area_row = mysqli_fetch_array($area_result);
$area = $area_row['Area'];

$query = "SELECT Complaint.*, Customer.*, New_Connection.Area
FROM Complaint
INNER JOIN Customer ON Complaint.Cus_ID = Customer.Cus_ID
INNER JOIN New_Connection ON Customer.Req_ID = New_Connection.Req_ID
WHERE New_Connection.Area = '$area'
ORDER BY Complaint.Comp_ID DESC;


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

<h3 style="font-family: Montserrat; margin-left: 5%;">Pending Customer Complaints in : <?php echo $area; ?></h3>
<p3 style="font-family: Montserrat; margin-left: 5%;">After completing the complaint, report it here.</p3>
</div>



<div class="body_class" >
   <div class="table_container" style="overflow-y: scroll; height:65%; width:90%; margin-left:5%;">
  
<?php
include("config.php");


echo "<table border='1' ;table width='100%'>
<tr>

</tr>";

while($row = mysqli_fetch_array($result))
{
echo "<tr>";
echo "<td>" . $row['Comp_ID'] . "</td>";
echo "<td>" . $row['Cus_ID'] . "</td>";
echo "<td>" . $row['Fname'] . " " . $row['Lname'] . "</td>";
echo "<td>" . $row['Phone'] . "</td>";
echo "<td>" . $row['Address'] . "</td>";
echo "<td>" . $row['Description'] . "</td>";

  $compid = $row['Comp_ID'];
  $query = "SELECT * FROM SOLVES WHERE Comp_ID = $compid";
  $result2 = mysqli_query($conn, $query);
  if(mysqli_num_rows($result2) == 0) {
    echo "<td><a href='complaint_done.php?Comp_ID=".$row['Comp_ID']."'><img src='./images/icons8-open-end-wrench-32.png' alt='Edit'></a></td>";
  } else {
    echo "<td><img src='./images/icons8-ok-32.png' alt='Edit'></a></td>";
  }


echo "</tr>";
}
echo "</table>";

?>

</div>
</div>
</body>

</html>





