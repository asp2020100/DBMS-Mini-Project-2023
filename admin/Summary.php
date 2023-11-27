<?php
session_start();
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
	$sql = "SELECT * FROM SYS_ADMIN WHERE Email = '" . $_SESSION['user'] . "'";
	$result = $mysqli->query($sql);
	if (mysqli_num_rows($result) > 0) {
	while($rowData = mysqli_fetch_array($result)){
		echo '<h3 style="font-family:Montserrat;margin-left:5%;">Welcome '.$rowData["Fname"].' '.$rowData["Lname"].'!</h3>';
	}
}
?>

<p3 style="font-family:Montserrat;margin-left:5%;">Privilege Level : System Administrator</p3>

</div>
<p2 style="font-family:Montserrat;margin-left:5%;">This is the Summary Dashboard that you may summarize the details for your Privilege Level.</p2>
<div class="" >
    <div class="basic-column w-col w-col-3">
        <div class="tag-wrapper">
            <div class="number-card number-card-content1">
                <h1 class="number-card-number" id="value">15</h1>
               
                <div class="number-card-divider"></div>
                <div class="number-card-progress-wrapper">
                    <div class="tagline number-card-currency">Total Managers in company</div>
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
                    <div class="tagline number-card-currency">Total Staff in company</div>
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
                    <div class="tagline number-card-currency">Total Service Staff in company</div>
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
                    <div class="tagline number-card-currency">Manager Accounts Created By You</div>
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
                    <div class="tagline number-card-currency">Staff Accounts Created By You</div>
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
                    <div class="tagline number-card-currency">Service Accounts Created By You</div>
                    <div class="number-card-progress"></div>
                </div>
            </div>
            <div class="divider"></div>
          
        </div>
    </div>
</div>

<?php 
	include("config.php");
	
	$mgr_sql = "SELECT * FROM MANAGER";
	$result_mgr = mysqli_query($mysqli, $mgr_sql);
	$row_mgr  = $result_mgr->num_rows;
	
	$stf_sql = "SELECT * FROM STAFF";
	$result_stf = mysqli_query($mysqli, $stf_sql);
	$row_stf  = $result_stf->num_rows;
	
	$ser_sql = "SELECT * FROM SERVICE_PERSONNAL";
	$result_ser = mysqli_query($mysqli, $ser_sql);
	$row_ser  = $result_ser->num_rows;
	
	$mgr_my_sql = "SELECT EMPLOYEE.*, MANAGER.*
				FROM EMPLOYEE
				INNER JOIN MANAGER ON EMPLOYEE.Emp_ID = MANAGER.Emp_ID
				INNER JOIN MANIPULATES ON EMPLOYEE.Emp_ID = MANIPULATES.Emp_ID
				INNER JOIN SYS_ADMIN ON MANIPULATES.Email = SYS_ADMIN.Email
				WHERE SYS_ADMIN.Email = '" . $_SESSION['user'] . "'";
	$result_ser_mgr_my = mysqli_query($mysqli, $mgr_my_sql);
	$row_ser_mgr_my  = $result_ser_mgr_my->num_rows;
	
	$stf_my_sql = "SELECT EMPLOYEE.*, STAFF.*
					FROM EMPLOYEE
					INNER JOIN STAFF ON EMPLOYEE.Emp_ID = STAFF.Emp_ID
					INNER JOIN MANIPULATES ON EMPLOYEE.Emp_ID = MANIPULATES.Emp_ID
					INNER JOIN SYS_ADMIN ON MANIPULATES.Email = SYS_ADMIN.Email
					WHERE SYS_ADMIN.Email = '" . $_SESSION['user'] . "'
					";
	$result_ser_stf_my = mysqli_query($mysqli, $stf_my_sql);
	$row_ser_stf_my  = $result_ser_stf_my->num_rows;
	
	$ser_my_sql = "SELECT EMPLOYEE.*, SERVICE_PERSONNAL.*
					FROM EMPLOYEE
					INNER JOIN SERVICE_PERSONNAL ON EMPLOYEE.Emp_ID = SERVICE_PERSONNAL.Emp_ID
					INNER JOIN MANIPULATES ON EMPLOYEE.Emp_ID = MANIPULATES.Emp_ID
					INNER JOIN SYS_ADMIN ON MANIPULATES.Email = SYS_ADMIN.Email
					WHERE SYS_ADMIN.Email = '" . $_SESSION['user'] . "'
					";
	$result_ser_ser_my = mysqli_query($mysqli, $ser_my_sql);
	$row_ser_ser_my  = $result_ser_ser_my->num_rows;

?> 

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
animateValue(obj, 0, <?php echo $row_mgr; ?>, 700);
const obj1 = document.getElementById("value2");
animateValue(obj1, 0, <?php echo $row_stf; ?>, 700);
const obj2 = document.getElementById("value3");
animateValue(obj2, 0, <?php echo $row_ser; ?>, 700);
const obj3 = document.getElementById("value4");
animateValue(obj3, 0, <?php echo $row_ser_mgr_my; ?>, 700);
const obj4 = document.getElementById("value5");
animateValue(obj4, 0, <?php echo $row_ser_stf_my; ?>, 700);
const obj5 = document.getElementById("value6");
animateValue(obj5, 0, <?php echo $row_ser_ser_my; ?>, 700);

</script>
  		

</body>

</html>





