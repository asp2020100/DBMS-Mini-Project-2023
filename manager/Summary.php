<?php
session_start();
?>

<?php
//total customers
include("config.php");
$query = "SELECT * FROM ESTABLISHES";
$result = mysqli_query($conn, $query);
$cus_count = mysqli_num_rows($result);

?>

<?php
//total staff
include("config.php");
$query = "SELECT * FROM STAFF";
$result = mysqli_query($conn, $query);
$staff_count = mysqli_num_rows($result);

?>

<?php
//total service
include("config.php");
$query = "SELECT * FROM SERVICE_PERSONNAL";
$result = mysqli_query($conn, $query);
$ser_count = mysqli_num_rows($result);

?>

<?php
//pending approvals
include("config.php");
$query = "SELECT * FROM NEW_CONNECTION WHERE Req_Status = 'Pending'";
$result = mysqli_query($conn, $query);
$approval_count = mysqli_num_rows($result);

?>

<?php
//total unpaid salary
include("config.php");
$query = " SELECT COUNT(*) as total
FROM (
  SELECT STAFF.Emp_ID
  FROM STAFF
  LEFT JOIN SALARY ON STAFF.Emp_ID = SALARY.Emp_ID
  WHERE SALARY.Emp_ID IS NULL
  UNION ALL
  SELECT SERVICE_PERSONNAL.Emp_ID
  FROM SERVICE_PERSONNAL
  LEFT JOIN SALARY ON SERVICE_PERSONNAL.Emp_ID = SALARY.Emp_ID
  WHERE SALARY.Emp_ID IS NULL
) AS temp_table";

$result = $conn->query($query);
$row = $result->fetch_assoc();
$total_salary = $row['total'];

?>
<?php
//total unpaid salary
include("config.php");
$query = "SELECT COUNT(*) as total
FROM COMPLAINT
LEFT JOIN SOLVES ON COMPLAINT.Comp_ID = SOLVES.Comp_ID
WHERE SOLVES.Comp_ID IS NULL";

$result = $conn->query($query);
$row = $result->fetch_assoc();
$total_comp = $row['total'];

?>

<html>
	<head>
		<link type="text/css" href="assets/css/bootstrap.min.css" rel="stylesheet">
		<link type="text/css" href="assets/css/bootstrap-table.css" rel="stylesheet">
		<link type="text/css" href="assets/css/font-awesome.css" rel="stylesheet">
</head>

<style>

	

 *{
    -webkit-box-sizing:border-box;
    -moz-box-sizing:border-box;
    box-sizing:border-box;
   font-family: Montserrat;
	}
 h1{
    font-weight:bold;
    
}
 h1{
    font-size:38px;
    line-height:44px;
    margin-top:20px;
}


 .w-col{
    position:relative;
    float:left;
    min-height:1px;
	margin-left:50px;
	margin-right:10px;
}
 .w-col-3{
    width:25%;
}

 h1{
    margin-top:15px;
    margin-bottom:15px;
    font-size:42px;
    line-height:54px;
    font-weight:400;
}


 .tag-wrapper{
    margin-top:20px;
    margin-bottom:1px;
 
}

 .number-card-number{
    margin-top:0px;
    margin-bottom:0px;
    color:#fff;
    font-weight:300;
}
 .tagline{
    font-size:12px;
    font-weight:500;
    letter-spacing:2px;
    text-transform:uppercase;
}
 .tagline.number-card-currency{
    color:#fff;
}

 .number-card{
    padding:10px 25px;
    border-radius:8px;
    background-image:-webkit-linear-gradient(270deg, #1991eb, #1991eb);
    background-image:linear-gradient(180deg, #1991eb, #1991eb);
}
 .number-card.number-card-content3{
    background-image:-webkit-linear-gradient(270deg, #ed629a, #c850c0);
    background-image:linear-gradient(180deg, #ed629a, #c850c0);
}
 .number-card.number-card-content4{
    background-image:-webkit-linear-gradient(270deg, #ff8308, #fd4f00);
    background-image:linear-gradient(180deg, #ff8308, #fd4f00);
}
 .number-card.number-card-content2{
    display:block;
    background-image:-webkit-linear-gradient(270deg, #17cec4, #17cec4 0%, #08aeea);
    background-image:linear-gradient(180deg, #17cec4, #17cec4 0%, #08aeea);
    color:#333;
}
 .number-card.number-card-content1{
    background-image:-webkit-linear-gradient(270deg, #7042bf, #3023ae);
    background-image:linear-gradient(180deg, #7042bf, #3023ae);
}
 .number-card-progress-wrapper{
    display:-webkit-box;
    display:-webkit-flex;
    display:-ms-flexbox;
    display:flex;
    -webkit-box-pack:justify;
    -webkit-justify-content:space-between;
    -ms-flex-pack:justify;
    justify-content:space-between;
}
 .number-card-divider{
    height:1px;
    margin-top:1px;
    margin-bottom:14px;
    background-color:hsla(0, 0%, 100%, .15);
}
 .number-card-dollars{
    color:hsla(0, 0%, 100%, .8);
    font-size:1px;
    
}
	@font-face {
		font-family: "Montserrat";
		src: url("assets/fonts/Montserrat.ttf") format("truetype");
	}
</style>

 
<body style="background-color: hsla(0,0%,100%,0.8)">


<div class="page-header" >
<?php
	include("config.php");
	$sql = "SELECT e.*, m.*
			FROM employee e
			JOIN manager m ON e.Emp_ID = m.Emp_ID
			WHERE e.Emp_ID = '" . $_SESSION['user_3'] . "'";
	$result = $mysqli->query($sql);
	if (!$result) {
		// if there was an error executing the query, print the error message
		printf("Error: %s\n", $mysqli->error);
	} else if (mysqli_num_rows($result) > 0) {
		// if the query executed successfully and returned at least one row
		while($rowData = mysqli_fetch_array($result)){
			echo '<h3 style="font-family:Montserrat;margin-left:5%;">Welcome '.$rowData["Fname"].' '.$rowData["Lname"].'!</h3>';
			echo '<p3 style="font-family:Montserrat;margin-left:5%;">Privilege Level : Diyaluma PVT. Ltd. Manager Grade : '.$rowData["Grade"].'</p3>';
		}
	}
?>



</div>
<p2 style="font-family:Montserrat;margin-left:5%;">This is the Summary Dashboard that you may summarize the details for your Privilege Level.</p2>
<div class="" >
    <div class="basic-column w-col w-col-3">
        <div class="tag-wrapper">
            <div class="number-card number-card-content1">
                <h1 class="number-card-number" id="value">15</h1>
               
                <div class="number-card-divider"></div>
                <div class="number-card-progress-wrapper">
                    <div class="tagline number-card-currency">Total Customers</div>
                    <div class="number-card-progress"></div>
                </div>
            </div>
            <div class="divider"></div>
         
        </div>
    </div>
    <div class="basic-column w-col w-col-3">
        <div class="tag-wrapper">
            <div class="number-card number-card-content3">
                <h1 class="number-card-number" id="value2">24</h1>
              
                <div class="number-card-divider"></div>
                <div class="number-card-progress-wrapper">
                    <div class="tagline number-card-currency">Total Staff</div>
                    <div class="number-card-progress"></div>
                </div>
            </div>
            <div class="divider"></div>
         
        </div>
    </div>
    <div class="basic-column w-col w-col-3">
        <div class="tag-wrapper">
            <div class="number-card number-card-content4">
                <h1 class="number-card-number"id="value3">16</h1>
               
                <div class="number-card-divider"></div>
                <div class="number-card-progress-wrapper">
                    <div class="tagline number-card-currency">Total Service</div>
                    <div class="number-card-progress"></div>
                </div>
            </div>
            <div class="divider"></div>
           
        </div>
    </div>
    <div class="basic-column w-col w-col-3">
        <div class="tag-wrapper">
            <div class="number-card number-card-content1">
                <h1 class="number-card-number"id="value4">05</h1>
                
                <div class="number-card-divider"></div>
                <div class="number-card-progress-wrapper">
                    <div class="tagline number-card-currency">Pending Approvals</div>
                    <div class="number-card-progress"></div>
                </div>
            </div>
            <div class="divider"></div>
          
        </div>
    </div>
	<div class="basic-column w-col w-col-3">
        <div class="tag-wrapper">
            <div class="number-card number-card-content3">
                <h1 class="number-card-number"id="value5">10</h1>
                
                <div class="number-card-divider"></div>
                <div class="number-card-progress-wrapper">
                    <div class="tagline number-card-currency">Unpaid Salaries</div>
                    <div class="number-card-progress"></div>
                </div>
            </div>
            <div class="divider"></div>
          
        </div>
    </div>
	<div class="basic-column w-col w-col-3">
        <div class="tag-wrapper">
            <div class="number-card number-card-content4">
                <h1 class="number-card-number"id="value6">08</h1>
                
                <div class="number-card-divider"></div>
                <div class="number-card-progress-wrapper">
                    <div class="tagline number-card-currency">Unsolved Complaints</div>
                    <div class="number-card-progress"></div>
                </div>
            </div>
            <div class="divider"></div>
          
        </div>
    </div>
</div>

<script>
function animateValue(obj, start, end, duration) {
  let startTimestamp = null;
  const step = (timestamp) => {
    if (!startTimestamp) startTimestamp = timestamp;
    const progress = Math.min((timestamp - startTimestamp) / duration, 1);
    obj.innerHTML = Math.floor(progress * (end - start) + start);
    if (progress < 1) {
      window.requestAnimationFrame(step);
    }
  };
  window.requestAnimationFrame(step);
}

const obj = document.getElementById("value");
animateValue(obj, 0, <?php echo $cus_count; ?>, 1500);
const obj1 = document.getElementById("value2");
animateValue(obj1, 0, <?php echo $staff_count; ?>, 1500);
const obj2 = document.getElementById("value3");
animateValue(obj2, 0, <?php echo $ser_count; ?>, 1500);
const obj3 = document.getElementById("value4");
animateValue(obj3, 0, <?php echo $approval_count; ?>, 1500);
const obj4 = document.getElementById("value5");
animateValue(obj4, 0, <?php echo $total_salary; ?>, 1500);
const obj5 = document.getElementById("value6");
animateValue(obj5, 0, <?php echo $total_comp; ?>, 1500);
</script>
  		

</body>
</html>





