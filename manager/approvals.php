
<?php
session_start();
include("config.php");
$query = "SELECT * FROM NEW_CONNECTION ORDER BY Req_ID DESC";
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
	
	.button {
  display: inline-block;
  padding: 8px 16px;
  font-size: 50px;
  font-weight: bold;
  text-align: center;
  text-decoration: none;
  background-color: #33cccc;
  color: black;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.button:hover {
  background-color: black;
}

	
}


</style>

 
<body style="background-color: hsla(0,0%,100%,0.8)">


<div class="page-header" >

<h3 style="font-family:Montserrat;margin-left:5%;">Connection Approvals</h3>
<p3 style="font-family:Montserrat;margin-left:5%;">You may check whether a connection is Pending, Approved, Established, or Rejected.</p3>

</div>

<div class="body_class" >
   <div class="table_container" style="overflow-y: scroll; height:65%; width:90%; margin-left:5%;">
  
<?php
date_default_timezone_set('America/New_York');
$current_month = date('n');
$current_year = date('Y');

echo "<table border='1' ;table width='100%'>
<tr>

</tr>";

while($row = mysqli_fetch_array($result))
{
echo "<tr>";
echo "<td>" . $row['Req_ID'] . "</td>";
echo "<td>" . $row['Date'] . "</td>";
echo "<td>" . $row['Area'] . "</td>";
echo "<td>" . $row['Req_Status'] . "</td>";

if($row['Req_Status'] == 'Pending') {
		echo "<td style='background-color: red;'></td>";
		echo "<td><a href='approval_approve.php?Req_ID=".$row['Req_ID']."'><img src='./images/icons8-done-32.png' alt='Edit'></a></td>";
        echo "<td><a href='approval_reject.php?Req_ID=".$row['Req_ID']."'><img src='./images/icons8-close-32.png' alt='Edit'></a></td>";
    } else if ($row['Req_Status'] == 'Rejected'){	
		 echo "<td style='background-color: black;'></td>";
    } else if ($row['Req_Status'] == 'Approved'){	
		echo "<td style='background-color: yellow;'></td>";
		  $reqid = $row['Req_ID'];
		  $query = "SELECT * FROM ESTABLISHES WHERE Req_ID = $reqid";
		  $result2 = mysqli_query($conn, $query);
		  if(!(mysqli_num_rows($result2) == 0)) {
			echo "<td style='background-color: green;'><img src='./images/icons8-ok-32.png' alt='Edit'></a></td>";
		  } 
    } 

echo "</tr>";
}
echo "</table>";

?>

</div>
</div>
</body>

</html>





