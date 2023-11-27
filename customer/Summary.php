<?php
session_start();
include("config.php");
$allocated_units;
$used_units;
?>



<?php
//total units
include("config.php");
$query = "SELECT Allocated_Units FROM ACCOUNT WHERE Cus_ID = '{$_SESSION['user_2']}'";
$result = mysqli_query($mysqli, $query);

if ($result && mysqli_num_rows($result) > 0) {
  $row = mysqli_fetch_assoc($result);
  $allocated_units = $row['Allocated_Units'];
} 
?>

<?php
//used units
include("config.php");
$query_used = "SELECT * FROM ACCOUNT WHERE Cus_ID = '{$_SESSION['user_2']}'";
$result2 = mysqli_query($mysqli, $query_used);

if ($result2 && mysqli_num_rows($result2) > 0) {
  $row = mysqli_fetch_assoc($result2);
  $used_units = $row['Used_Units'];
} 
?>

<?php
include("config.php");

//unsolved complaints
$query = "SELECT COUNT(*)
FROM Complaint c
JOIN Customer cust ON c.Cus_ID = cust.Cus_ID
LEFT JOIN Solves s ON c.Comp_ID = s.Comp_ID
WHERE c.Cus_ID = '{$_SESSION['user_2']}' AND c.Status = 'Pending' AND s.Comp_ID IS NULL;";

$result = mysqli_query($mysqli, $query);

$pending_complaints_count = mysqli_fetch_array($result)[0];

?>

<?php
//unchecked feedback
$query = "SELECT COUNT(*)
			FROM FEEDBACK f
			WHERE f.Cus_ID = '{$_SESSION['user_2']}' AND NOT EXISTS (
			  SELECT 1
			  FROM REVIEWS r
			  WHERE r.Feedback_ID = f.Feedback_ID
			);";

$result = mysqli_query($conn, $query);
$row = mysqli_fetch_assoc($result);
$feedback_count = $row['COUNT(*)'];



?>

<?php
//payment
include("config.php");
date_default_timezone_set('America/New_York');
$current_month = date('n');
$current_year = date('Y');

$query = "SELECT * FROM ACCOUNT WHERE Cus_ID  = '{$_SESSION['user_2']}' AND Month = DATE_FORMAT(CURDATE(), '%Y-%m');";
$result2 = mysqli_query($conn, $query);
if(mysqli_num_rows($result2) == 0) {
    $payment_status = 'Inactive';
	$allocated_units = 0;
	$used_units = 0;
} else {
    $payment_status = 'Active';
}
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
	$sql = "SELECT *
			FROM CUSTOMER
			WHERE Cus_ID = '" . $_SESSION['user_2'] . "'";
	$result = $mysqli->query($sql);
	
	if (!$result) {
	} else if (mysqli_num_rows($result) > 0) {
		// if the query executed successfully and returned at least one row
		while($rowData = mysqli_fetch_array($result)){
			$reqid = $rowData["Req_ID"];
			
			$sqlarea = "SELECT *
					FROM NEW_CONNECTION
					WHERE Req_ID = '$reqid'";
			$result_area = $mysqli->query($sqlarea);
			while($areaData = mysqli_fetch_array($result_area)){
				echo '<h3 style="font-family:Montserrat;margin-left:5%;">Welcome '.$rowData["Fname"].' '.$rowData["Lname"].'!</h3>';
				echo '<p3 style="font-family:Montserrat;margin-left:5%;">Diyaluma Water Supply Area : '.$areaData["Area"].'</p3>';
				
			}
				
		}
	}
?>

</div>
<p2 style="font-family:Montserrat;margin-left:5%;">This is the Summary Dashboard that you may summarize the details for your current water supply.<br></p2>
<p2 style="font-family:Montserrat;margin-left:5%;">Your water usage will be calculated automatically.</p2>
<div class="" >
    <div class="basic-column w-col w-col-3">
        <div class="tag-wrapper">
            <div class="number-card number-card-content1">
                <h1 class="number-card-number" id="value">15</h1>
               
                <div class="number-card-divider"></div>
                <div class="number-card-progress-wrapper">
                    <div class="tagline number-card-currency">Total Units</div>
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
                    <div class="tagline number-card-currency">Used Units</div>
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
                    <div class="tagline number-card-currency">Remaining Units</div>
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
                    <div class="tagline number-card-currency">Unsolved Complaints</div>
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
                    <div class="tagline number-card-currency">Unseen Feedback</div>
                    <div class="number-card-progress"></div>
                </div>
            </div>
            <div class="divider"></div>
          
        </div>
    </div>
	<div class="basic-column w-col w-col-3">
        <div class="tag-wrapper">
            <div class="number-card number-card-content4">
                <h1 class="number-card-number"id="value6"><?php echo $payment_status; ?></h1>
                
                <div class="number-card-divider"></div>
                <div class="number-card-progress-wrapper">
                    <div class="tagline number-card-currency">Connection Status</div>
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
animateValue(obj, 0, <?php echo $allocated_units; ?>, 1500);
const obj1 = document.getElementById("value2");
animateValue(obj1, 0, <?php echo $used_units; ?>, 1500);
const obj2 = document.getElementById("value3");
animateValue(obj2, 0, <?php echo ($allocated_units - $used_units); ?>, 1500);
const obj3 = document.getElementById("value4");
animateValue(obj3, 0, <?php echo $pending_complaints_count; ?>, 1500);
const obj4 = document.getElementById("value5");
animateValue(obj4, 0, <?php echo $feedback_count; ?>, 1500);
</script>
  		

</body>
</html>





