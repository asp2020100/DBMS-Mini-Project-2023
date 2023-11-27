<?php

	

?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta http-equiv="x-ua-compatible" content="ie=edge" />
  <title> | Forgot Credentials</title>
  <!-- MDB icon -->
  <link rel="icon" href="assets/icon.ico" type="image/x-icon" />
  <!-- Font Awesome -->
  <link rel="stylesheet" href="assets/css/all.css" />
  <!-- Google Fonts Roboto -->
  <link rel="stylesheet" href="assets/css/css2.css" />
  <!-- MDB -->
  <link rel="stylesheet" href="assets/css/bootstrap-login-form.min.css" />
  
</head>

<body onload="cuslogin();">

<script>
	function cuslogin() {
	
	  var adminmail = document.getElementById("email");
	  var adminpass = document.getElementById("adminpass");
	  var empid = document.getElementById("empid");
	  var emppass = document.getElementById("emppass");
	  var cusid = document.getElementById("cusid");
	  var reqid = document.getElementById("reqid");
	  
	  adminmail.style.display = "none";
	  adminpass.style.display = "none";
	  empid.style.display = "none";
	  emppass.style.display = "none";
	  cusid.style.display = "block";
	  reqid.style.display = "block";
	  
	}
	
	function adminlogin() {
	
	  var adminmail = document.getElementById("email");
	  var adminpass = document.getElementById("adminpass");
	  var empid = document.getElementById("empid");
	  var emppass = document.getElementById("emppass");
	  var cusid = document.getElementById("cusid");
	  var reqid = document.getElementById("reqid");
	  
	  cusid.style.display = "none";
	  reqid.style.display = "none";
	  empid.style.display = "none";
	  emppass.style.display = "none";
	  adminmail.style.display = "block";
	  adminpass.style.display = "block";
	  
	}
	
	function emplogin() {
	
	  var adminmail = document.getElementById("email");
	  var adminpass = document.getElementById("adminpass");
	  var empid = document.getElementById("empid");
	  var emppass = document.getElementById("emppass");
	  var cusid = document.getElementById("cusid");
	  var reqid = document.getElementById("reqid");
	  
	  adminmail.style.display = "none";
	  adminpass.style.display = "none";
	  cusid.style.display = "none";
	  reqid.style.display = "none";
	  empid.style.display = "block";
	  emppass.style.display = "block";
	  
	}
	
	
</script>
  <!-- Start your project here-->

  <style>
    .divider:after,
    .divider:before {
      content: "";
      flex: 1;
      height: 1px;
      background: #eee;
    }
    .h-custom {
      height: calc(100% - 73px);
    }
    @media (max-width: 450px) {
      .h-custom {
        height: 100%;
      }
    }
  </style>
  <section class="vh-100">
    <div class="container-fluid h-custom">
      <div class="row d-flex justify-content-center align-items-center h-100">
        
        <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
          <form action="forgotCredentials_query.php" method="POST">
		  <div class="divider d-flex align-items-center my-4">
              <p class="text-center fs-2 fw-bold mx-3 mb-0">Forgot Credentials Wizard</p>
            </div>
			<!------BUTTON BAR--->
				
				<div class="btn-group btn-group-justified">
				  <a href="#" onclick="cuslogin()" class="btn btn-primary">Customer Login</a>
				  <a href="#" onclick="adminlogin()"class="btn btn-primary">Administrator Login</a>
				  <a href="#" onclick="emplogin()"class="btn btn-primary">Employee Login</a>
				</div>
				
            <div class="divider d-flex align-items-center my-4">
              <p class="text-center fw-bold mx-3 mb-0">Enter following as requested</p>
            </div>

            <!-- Customer ID input -->
            <div class="form-outline mb-4" id="cusid">
              <input type="number" id="form3Example3" class="form-control form-control-lg"
                placeholder="Enter the Customer ID you received" name="cus_username" />
              <label class="form-label" for="form3Example3">Customer ID</label>
            </div>

            <!-- Reqest ID input -->
            <div class="form-outline mb-3" id="reqid">
              <input type="text" id="form3Example4" class="form-control form-control-lg"
                placeholder="Enter Your Resedential Address" name="cus_password"/>
              <label class="form-label" for="form3Example4">Enter Your Resedential Address</label>
            </div>
			
			<!-- Admin Email input -->
            <div class="form-outline mb-4" id="email">
              <input type="email" id="form3Example3" class="form-control form-control-lg"
                placeholder="Enter the Diyaluma Administrator Email" name="admin_username"/>
              <label class="form-label" for="form3Example3">Admin Email</label>
            </div>

            <!-- Password input -->
            <div class="form-outline mb-3" id="adminpass">
              <input type="text" id="form3Example4" class="form-control form-control-lg"
                placeholder="Enter Your Resedential Address" name="admin_password"/>
              <label class="form-label" for="form3Example4">Enter Your Resedential Address</label>
            </div>
			
			<!-- Employee ID input -->
            <div class="form-outline mb-4" id="empid">
              <input type="number" id="form3Example3" class="form-control form-control-lg"
                placeholder="Enter the Diyaluma Employer ID" name="emp_username"/>
              <label class="form-label" for="form3Example3">Employer ID</label>
            </div>

            <!-- Emp Password input -->
            <div class="form-outline mb-3" id="emppass">
              <input type="text" id="form3Example4" class="form-control form-control-lg"
                placeholder="Enter Your Resedential Address" name="emp_password"/>
              <label class="form-label" for="form3Example4">Enter Your Resedential Address</label>
            </div>

            <div class="text-center text-lg-start mt-4 pt-2">
              <button type="submit" name="submit" class="btn btn-primary btn-block"
                style="padding-left: 2.5rem; padding-right: 2.5rem;">
				
				Request my credentials</button>
            </div>

          </form>
        </div>
      </div>
    </div>
    <div class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
      <!-- Copyright -->
      <div class="text-white mb-3 mb-md-0">
        Diyaluma PVT. Ltd 2023
      </div>
      <!-- Copyright -->

      <!-- Right -->
      
      <!-- Right -->
    </div>
  </section>
  <!-- End your project here-->

  <!-- MDB -->
  <script type="text/javascript" src="assets/js/mdb.min.js"></script>
  <!-- Custom scripts -->
  <script type="text/javascript"></script>
  
</body>

</html>