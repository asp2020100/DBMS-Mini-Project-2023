
<?php
session_start();
include("config.php");
$query = "SELECT e.* ,s.Area,s.Type
FROM EMPLOYEE e
JOIN SERVICE_PERSONNAL s ON e.Emp_ID = s.Emp_ID
WHERE s.Area = (SELECT Area FROM SERVICE_PERSONNAL WHERE Emp_ID = '{$_SESSION['user_5']}')
AND e.Emp_ID <> '{$_SESSION['user_5']}';;

";

$area_query = "SELECT Area FROM SERVICE_PERSONNAL WHERE Emp_ID = '{$_SESSION['user_5']}'";
$area_result = mysqli_query($mysqli, $area_query);
$area_row = mysqli_fetch_array($area_result);
$area = $area_row['Area'];

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

<h3 style="font-family: Montserrat; margin-left: 5%;">Service Staff in : <?php echo $area; ?></h3>
<p3 style="font-family: Montserrat; margin-left: 5%;">You may see their details here.</p3>
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
echo "<td>" . $row['Fname'] . " " . $row['Lname'] . "</td>";
echo "<td>" . $row['Address'] . "</td>";
echo "<td>" . $row['Sex'] . "</td>";
echo "<td>" . $row['Emp_ID'] . "</td>";
echo "<td>" . $row['Type'] . "</td>";


echo "</tr>";
}
echo "</table>";

?>

</div>
</div>
</body>

</html>





