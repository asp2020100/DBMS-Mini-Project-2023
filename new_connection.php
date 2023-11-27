
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta http-equiv="x-ua-compatible" content="ie=edge" />
  <title> | Connection Request</title>
  <!-- MDB icon -->
  <link rel="icon" href="assets/icon.ico" type="image/x-icon" />
  <!-- Font Awesome -->
  <link rel="stylesheet" href="assets/css/all.css" />
  <!-- Google Fonts Roboto -->
  <link rel="stylesheet" href="assets/css/css2.css" />
  <!-- MDB -->
  <link rel="stylesheet" href="assets/css/bootstrap-login-form.min.css" />
  
</head>

<body>


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
        <div class="col-md-9 col-lg-6 col-xl-5">
          <img src="assets/condition_titles.png" class="img-fluid"
            >
        </div>
        <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
          <form action="new_connection_register.php" method="POST">
		  <div class="divider d-flex align-items-center my-4">
              <p class="text-center fs-2 fw-bold mx-3 mb-0">Request a New Connection</p>
            </div>
			
				
            <div class="divider d-flex align-items-center my-4">
              <p class="text-center fw-bold mx-3 mb-0">Enter following details</p>
            </div>

            <!-- First Name input -->
            <div class="form-outline mb-4" id="firstname">
              <input type="text" id="form3Example3" class="form-control form-control-lg"
                placeholder="First Name" name="firstname" required/>
              <label class="form-label" for="form3Example3">First Name</label>
            </div>

            <!-- Last Name input -->
            <div class="form-outline mb-3" id="lastname">
              <input type="text" id="form3Example4" class="form-control form-control-lg"
                placeholder="Last Name" name="lastname"required/>
              <label class="form-label" for="form3Example4">Last Name</label>
            </div>
			
			<!-- Address input -->
            <div class="form-outline mb-4" id="address">
              <input type="text" id="form3Example3" class="form-control form-control-lg"
                placeholder="Resedential Address" name="address"required/>
              <label class="form-label" for="form3Example3">Resedential Address</label>
            </div>


            <!-- Phone input -->
            <div class="form-outline mb-3" id="phone">
              <input type="number" id="form3Example4" class="form-control form-control-lg"
                placeholder="Phone Number" name="phone"required/>
              <label class="form-label" for="form3Example4">Phone Number</label>
            </div>
			
			<!-- Area input -->
			<div class="form-outline mb-3" id="area">
			<select class="form-select "name="area" id="area">
   
				  <option value="Unknown">Select your Area</option>
				  <option value="Ampara">Ampara</option>
				  <option value="Anuradhapura">Anuradhapura</option>
				  <option value="Badulla">Badulla</option>
				  <option value="Batticaloa">Batticaloa</option>
				  <option value="Colombo">Colombo</option>
				  <option value="Galle">Galle</option>
				  <option value="Gampaha">Gampaha</option>
				  <option value="Hambantota">Hambantota</option>
				  <option value="Jaffna">Jaffna</option>
				  <option value="Kalutara">Kalutara</option>
				  <option value="Kandy">Kandy</option>
				  <option value="Kegalle">Kegalle</option>
				  <option value="Kilinochchi">Kilinochchi</option>
				  <option value="Kurunegala">Kurunegala</option>
				  <option value="Mannar">Mannar</option>
				  <option value="Matale">Matale</option>
				  <option value="Matara">Matara</option>
				  <option value="Monaragala">Monaragala</option>
				  <option value="Mullaitivu">Mullaitivu</option>
				  <option value="Nuwara Eliya">Nuwara Eliya</option>
				  <option value="Polonnaruwa">Polonnaruwa</option>
				  <option value="Puttalam">Puttalam</option>
				  <option value="Ratnapura">Ratnapura</option>
				  <option value="Trincomalee">Trincomalee</option>
				  <option value="Vavuniya">Vavuniya</option>
				  </select>
			</div>
			

            <div class="text-center text-lg-start mt-4 pt-2">
              <button type="submit" name="submit" class="btn btn-primary btn-block"
                style="padding-left: 2.5rem; padding-right: 2.5rem;">
				
				Request a Water Connection</button>
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