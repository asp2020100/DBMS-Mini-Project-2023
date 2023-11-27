<?php
	session_start();
	if(isset($_SESSION['user'])){
		header('location:admin/home.php');
	}
	else if(isset($_SESSION['user_2'])){
		header('location:customer/home.php');
	}
	else if(isset($_SESSION['user_3'])){
		header('location:manager/home.php');
	}
	else if(isset($_SESSION['user_4'])){
		header('location:staff/home.php');
	}
	else if(isset($_SESSION['user_5'])){
		header('location:service/home.php');
	}
	

?>
<!DOCTYPE html>
<html>
<head>
	<title>  | Welcome!</title>
	<link rel="icon" type="image/x-icon" href="assets/icon.ico">
	<style>
		body {
			background-color: #f2f2f2;
			font-family: Arial, sans-serif;
			margin: 0;
			padding: 0;
			overflow: hidden;
		}
		
		.container {
			position: relative;
			height: 100vh;
			width: 100vw;
			overflow: hidden;
			scroll-snap-type: y mandatory;
			scroll-behavior: smooth;
		}
		
		.section {
			height: 100vh;
			width: 100vw;
			scroll-snap-align: start;
			display: flex;
			flex-direction: column;
			align-items: center;
			color: #333333;
			background-color: #ffffff;
			padding-top: 80px;
			box-sizing: border-box;
		}
		
		.section:nth-of-type(1) {
			background: linear-gradient(to bottom, #74ebd5, #acb6e5);
			display: flex;
			flex-direction: column;
			align-items: left;
			justify-content: center;
			text-align: center;
			padding-top: 0;
		}
		
		.section:nth-of-type(2) {
			  background: linear-gradient(to bottom, #005aa7, #fffde4); 
			 justify-content: center;
			 text-align: center;
			 padding-top: 0;
			 display: flex;
		}
		
		.section:nth-of-type(3) {
			 background: linear-gradient(to top, #667db6, #0082c8, #0082c8, #667db6);
			 justify-content: center;
			 text-align: center;
			 padding-top: 0;
			 display: flex;
		}
		
		.navbar {
			display: flex;
			background-color: rgba(255, 255, 255, 0.3);
			justify-content: space-between;
			align-items: center;
			height: 20%;
			width: 100%;
			position: absolute;
			top: 0;
			left: 0;
			padding: 0 30px;
			box-sizing: border-box;
		}
		
		.navbar a {
			color: #20B2BF;
			font-size: 24px;
			font-weight: bold;
			text-decoration: none;
			margin: 0 15px;
			padding: 10px;
			border-radius: 5px;
			transition: all 0.3s ease-in-out;
		}
		
		.navbar a:hover {
			color: white;
		}

		.parent {
		    display: flex;
		    justify-content: space-between;
		}

		.left {
		  width: 50%;
		}

		.right {
		  width: 50%;
		}

		.buttons {
		  display: flex;
		}

		.login-btn, .request-btn {
		  display: inline-block;
		  padding: 10px 20px;
		  border: none;
		  background-color: #fff;
		  border-radius: 10px;
		  color: #333;
		  margin-left: 10%;
		  text-decoration: none;
		  text-transform: uppercase;
		  font-weight: bold;
		  cursor: pointer;
		}

		.login-btn:hover {
		  background-color: green;
		  color: white;
		  transition: all 0.3s ease-in-out;
		}

		.request-btn:hover {
		  background-color: red;
		  color: white;
		  transition: all 0.3s ease-in-out;
		}

		.slider {
        width: 500px;
        height: 400px;
        background-color: yellow;
        margin-left: auto;
        margin-right: auto;
        margin-top: 0px;
        text-align: center;
        overflow: hidden;
      }
      .image-container {
        width: 1500px;
        background-color: pink;
        height: 300px;
        clear: both;
        position: relative;
        -webkit-transition: left 2s;
        -moz-transition: left 2s;
        -o-transition: left 2s;
        transition: left 2s;
      }
      .slide {
        float: left;
        margin: 0px;
        padding: 0px;
        position: relative;
      }
      #slide-1:target ~ .image-container {
        left: 0px;
      }
      #slide-2:target ~ .image-container {
        left: -500px;
      }
      #slide-3:target ~ .image-container {
        left: -1000px;
      }
      .buttons_slider {
        position: relative;
        top: -20px;
      }
      .buttons_slider a {
        display: inline-block;
        height: 15px;
        width: 15px;
        border-radius: 50px;
        background-color: lightblue;
      }


      @font-face {
	  	font-family: 'Diyalumafont';
	  	src: URL('assets/fonts/Montserrat.ttf') format('truetype');
	  }

		.card {
		  position: relative;
		  width: 220px;
		  height: 320px;
		  background: linear-gradient(to top, #fc4a1a, #f7b733);
		  display: flex;
		  align-items: center;
		  justify-content: center;
		  font-size: 25px;
		  font-weight: bold;
		  border-radius: 15px;
		  font-family: 'Diyalumafont';
		  color: white;
		}

		.card_contact {
		  position: relative;
		  width: 80%;
		  height: 80%;
		  background: white;
		  display: flex;
		  flex-direction: column;
		  align-items: center;
		  justify-content: center;
		  font-size: 25px;
		  font-weight: bold;
		  border-radius: 15px;
		  font-family: 'Diyalumafont';
		  color: black;
		  margin-bottom: 5%
		}

		.card::before,
		.card::after {
		  position: absolute;
		  content: "";
		  width: 20%;
		  height: 20%;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		  font-size: 25px;
		  font-weight: bold;
		   background: brown;
		  transition: all 0.5s;

		}

		.card::before {
		  top: 0;
		  right: 0;
		  border-radius: 0 15px 0 100%;
		}

		.card::after {
		  bottom: 0;
		  left: 0;
		  border-radius: 0 100%  0 15px;
		}

		.card:hover::before,
		.card:hover:after {
		  width: 100%;
		  height: 100%;
		  border-radius: 15px;
		  transition: all 0.5s;
		}

		.card:hover:after {
		  content: "GUARANTEED";
		  font-family: 'Diyalumafont';
		  color: white;


		}

		.container_box {
		  display: flex;
		}

		.box {
		  width: 25%;
		  height: 70%;
		  margin-right: 10px;
		}

		.box:last-child {
		  margin-right: 0;
		}

		footer {
		  background-color: #333;
		  color: #fff;
		  padding: 20px 0;
		  text-align: center;
		}

		footer p {
		  font-size: 14px;
		}


	</style>
</head>
<body>
	<div class="container">
		<div class="section">
			<div class="navbar">
				<a href="#about_sec" style="font-family: 'Diyalumafont';">Why Us?</a>
				<img src="assets/Trasparent_logo_Title.png" width="30%" height="70%">
				<a href="#contact_sec" style="font-family: 'Diyalumafont';">Talk to Us</a>
			</div>
			
			<div class="parent">
			  	<div class="left">
			  		<h1 style="margin-left: 10%;margin-top: 15%;font-family: 'Diyalumafont';">WELCOME TO<br> DIYALUMA WATER SUPPLIERS!</h1>
			  		<p style="text-align: justify; margin-left: 10%;margin-top: 10%;margin-bottom: 10%;font-family: 'Diyalumafont';">Welcome to Diyaluma, where we bring refreshment straight to your doorstep. Quench your thirst with the purest and safest water from our trusted supply, and experience the difference hydration can make.<br><br>

					With years of dedicated service and a commitment to excellence, our service has become a household name and the number one choice for clean and safe water in the country. Trust us to bring you the best, just like we have been doing for the past years.</p>

					<div class="buttons">
						<a href="login.php" class="login-btn">Login to your Account</a>
						<a href="new_connection.php" class="request-btn">Request a New Connection</a>
					</div>
	
			  	</div>
			 	<div class="right">

			 		<div class="slider" style="margin-top: 15%; border-style: outset; border-radius: 20px;">
				      <span id="slide-1"></span>
				      <span id="slide-2"></span>
				      <span id="slide-3"></span>
				      <div class="image-container">
				        <img src="assets/slider_1.jpg" class="slide" width="500" height="400" />
				        <img src="assets/slider_2.jpg" class="slide" width="500" height="400" />
				        <img src="assets/slider_3.jpg" class="slide" width="500" height="400" />
				      </div>
				    </div>

			 	</div>
			</div>
			
		</div>
		<div class="section" id="about_sec">
			<h1 style="font-family: 'Diyalumafont'; color: white;">Why you should choose Diyaluma ?</h1>
			<p style="text-align: center; color: white;margin-left: 10%;margin-right: 10%;font-family: 'Diyalumafont';">As the No. 01 resedential water supplier in Sri Lanka, we guarantee you that we provide you the best service for a reasonable price without any corruptions.</p>
			

			<div class="container_box">
			  <div class="box"><div class="card">24x7<br>Service</div></div>
			  <div class="box"><div class="card">Islandwide<br>Coverage</div></div>
			  <div class="box"><div class="card">Safe and<br>Certified</div></div>
			  <div class="box"><div class="card">Online<br>Monitoring</div></div>
			</div>

			<p style="text-align: center; color: #005aa7;margin-left: 10%;margin-right: 10%;font-family: 'Diyalumafont';">At our core, we believe that delivering the most valuable service is not just about offering the lowest prices, but about providing a seamless experience, excellent quality, and unparalleled customer care. We strive to exceed expectations and make a real difference in our customers' lives, every single day.</p>

		</div>
		<div class="section" id="contact_sec">
			<h1 style="font-family: 'Diyalumafont'; color: white;">Get in touch with us!</h1>
			<div class="card_contact" style="border-style:double;">
				<img src="assets/Trasparent_logo_Title.png" width="40%" height="20%">
				<p style="font-size:80% ">DBMS Mini Project <br></p>
				<p> <u> Group Members : <u> <br>
				R.M.Y.P.Rathnayake | Index:4840 | ASP/19/20/100 <br>
				E.M.A.S. Edirisinghe | Index:4855 | ASP/19/20/018 <br>
				J.H.M.R.M. Jayasundara | Index:4786 | ASP/19/20/089 <br>
				K.S.L. De silva | Index:4830 | ASP/19/20/082 <br>

			</div>
			
		</div>

	</div>
	<script>
		var container = document.querySelector('.container');
		var sections = document.querySelectorAll('.section');
		var currentSectionIndex = 0;

		container.addEventListener('wheel', function(event) {
			event.preventDefault();
			var direction = event.deltaY > 0 ? 1 : -1;
			if (currentSectionIndex + direction >= 0 && currentSectionIndex + direction < sections.length) {
				currentSectionIndex += direction;
				sections[currentSectionIndex].scrollIntoView({
					behavior: 'smooth'
				});
			}
		});

	</script>

	<script>
    var slideIndex = 0;
    var timer;

    function autoSlide() {
        var i;
        var slides = document.getElementsByClassName("slide");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) {slideIndex = 1}
        slides[slideIndex-1].style.display = "block";
        timer = setTimeout(autoSlide, 3000); 
    }

    window.onload = function() {
        autoSlide();
    }
	</script>


</body>
</html>
