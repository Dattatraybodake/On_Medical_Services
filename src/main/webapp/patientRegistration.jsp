<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title><jsp:include page="projectTitle.jsp"></jsp:include></title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

</head>


<script>
	function AllowAlphabet0() {
		if (!ureg.fname.value.match(/^[a-zA-Z]+$/) && ureg.fname.value != "") {
			ureg.fname.value = "";
			ureg.fname.focus();
			alert("Please Enter only alphabet in text");
		}

	}
</script>

<script>
	function AllowAlphabet1() {
		if (!ureg.mname.value.match(/^[a-zA-Z]+$/) && ureg.mname.value != "") {
			ureg.mname.value = "";
			ureg.mname.focus();
			alert("Please Enter only alphabet in text");
		}

	}
</script>

<script>
	function AllowAlphabet2() {
		if (!ureg.lname.value.match(/^[a-zA-Z]+$/) && ureg.lname.value != "") {
			ureg.lname.value = "";
			ureg.lname.focus();
			alert("Please Enter only alphabet in text");
		}

	}
</script>
<script>
	function validateEmail() {

		var email = document.ureg.email.value;

		if (email == 0) {
			alert("Enter Valid mail id");
			//document.ureg.email.focus();
			return false;
		}
		if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)) {
		} else {
			alert("Enter valid mail id");
			//	document.ureg.email.focus();
			return false;
		}

	}
</script>

<script type="text/javascript">
	function ValidateMobNumber(txtMobId) {
		var fld = document.getElementById(txtMobId);

		if (fld.value == "") {
			alert("You didn't enter a phone number.");
			fld.value = "";
			//	fld.focus();
			return false;
		} else if (isNaN(fld.value)) {
			alert("The phone number contains illegal characters.");
			fld.value = "";
			//	fld.focus();
			return false;
		} else if (!(fld.value.length == 10)) {
			alert("The phone number is the wrong length. \nPlease enter 10 digit mobile no.");
			fld.value = "";
			//	fld.focus();
			return false;
		}
	}
</script>


<meta charset="utf-8">
<script language="Javascript">
	function validation() {

		var email = document.ureg.email.value;

		if (email == 0) {
			alert("Enter Valid mail id");
			document.ureg.email.focus();
			return false;
		}
		if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)) {
		} else {
			alert("Enter valid mail id");
			document.ureg.email.focus();
			return false;
		}

	}
</script>


<script type="text/javascript">
	function ValidateMobNumber(txtMobId) {
		var fld = document.getElementById(txtMobId);

		if (fld.value == "") {
			alert("You didn't enter a phone number.");
			fld.value = "";
			//	fld.focus();
			return false;
		} else if (isNaN(fld.value)) {
			alert("The phone number contains illegal characters.");
			fld.value = "";
			//	fld.focus();
			return false;
		} else if (!(fld.value.length == 10)) {
			alert("The phone number is the wrong length. \nPlease enter 10 digit mobile no.");
			fld.value = "";
			//	fld.focus();
			return false;
		}

	}

	function validatepassword() {

		var password = document.ureg.password.value;

		if (password != "") {
			if (password.length < 6) {
				//	document.ureg.password.focus();
				document.ureg.password = "";
				alert("Password must contain at least 6 characters!");

				return false;
			}
		}
	}
</script>


<%-- <jsp:include page="validation.jsp"/> --%>
	
<body>

	<!-- ======= Top Bar ======= -->
	<div id="topbar" class="d-flex align-items-center fixed-top">
		<div class="container d-flex justify-content-between">
			<div class="contact-info d-flex align-items-center">
				<i class="bi bi-envelope"></i> <a href="mailto:dattatraynb07@gmail.com">contact@healthcare.com</a>
				<i class="bi bi-phone"></i> +91 8263846401
			</div>
			<div class="d-none d-lg-flex social-links align-items-center">
				<a href="#" class="twitter"><i class="bi bi-twitter"></i></a> <a
					href="#" class="facebook"><i class="bi bi-facebook"></i></a> <a
					href="#" class="instagram"><i class="bi bi-instagram"></i></a> <a
					href="#" class="linkedin"><i class="bi bi-linkedin"></i></i></a>
			</div>
		</div>
	</div>

	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top">
	<div class="container d-flex align-items-center">

		<h1 class="logo me-auto">
			<a href="index.jsp"><jsp:include page="projectTitle.jsp"></jsp:include></a>
		</h1>
		<!-- Uncomment below if you prefer to use an image logo -->
		<!-- <a href="index.jsp" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

		<nav id="navbar" class="navbar order-last order-lg-0"> <jsp:include	page="header/mainMenu.jsp"></jsp:include> <i
			class="bi bi-list mobile-nav-toggle"></i> </nav>
		<!-- .navbar -->

	</div>
	</header>
	<!-- End Header -->
	<!-- End Hero -->
	
<jsp:include page="header/alertBox.jsp"></jsp:include>

	<main id="main"> <!-- ======= Why Us Section ======= --> <section
		id="why-us" class="why-us">
	<div class="container">

		<div class="row">
			<!-- End .content-->
		</div>
	</div>
	</section> <!-- End Why Us Section --> <!-- ======= Appointment Section ======= -->
	<section id="appointment" class="appointment section-bg">
	<div class="container">

		<div class="section-title">
			<h2>Patient Registration</h2>
		</div>
			<form action="PatientRegistration" method="post" name="ureg">
				<table align="center">
					<tr>
						<th>Full Name</th>
						<td><input type="text" placeholder="First Name" class="form-control" name="fname" onkeyup="AllowAlphabet0()" required></td>
						<td><input type="text" placeholder="Middle Name" class="form-control" name="mname" onkeyup="AllowAlphabet1()" required></td>
						<td><input type="text" placeholder="Last Name" class="form-control" name="lname" onkeyup="AllowAlphabet2()" required></td>
					</tr>
					<tr>
						<th>Birth Date</th>
						<td><input type="date" class="form-control" name="dob" required></td>
						<th align="center">Gender</th>
						<td><input type="radio" name="gender" required value="Male">Male&nbsp;<input type="radio" name="gender" required value="Female">Female</td>
					</tr>
					<tr>
						<th>Mobile Number</th>
						<td><input type="text" placeholder="Your Mobile Number" id="txtMB" onblur="return ValidateMobNumber('txtMB')"
							class="form-control" name="mobile" required></td>
							
						<th align="center">Aadhar Card Number</th>
						<td><input type="text" placeholder="Your UID Number" 
							class="form-control" name="adhar_id" required></td>
					</tr>
					
					<tr>
						<th>Address In Details</th>
						<td><textarea rows="3" cols="30" name="address" required placeholder="Address in Detail"></textarea></td>
					</tr>
					<tr>
						<th>Email ID</th>
						<td><input type="text" placeholder="Your Email ID"
							class="form-control" name="email" required></td>
					</tr>
					<tr>
						<th>Password</th>
						<td><input type="password" placeholder="************"
							id="password" class="form-control" name="password" required></td>
					</tr>
					
					<tr>
						<th></th>
						<td><button type="submit" class="btn btn-success">Registration</button></td>
						<td><button type="Reset" class="btn btn-danger">Reset</button></td>
					</tr>

				</table>
			</form>
	</div>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	</section> <!-- End Appointment Section --> </main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer">

	<div class="container d-md-flex py-4">

		<div class="me-md-auto text-center text-md-start">
			<div class="copyright">
				&copy; Copyright <strong><span><jsp:include page="projectTitle.jsp"></jsp:include></span></strong>. All
				Rights Reserved
			</div>
			<div class="credits">
				Designed by <a href="#">Dattatray Bodake</a>
			</div>
		</div>
		<div class="social-links text-center text-md-right pt-3 pt-md-0">
			<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a
				href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a
				href="#" class="instagram"><i class="bx bxl-instagram"></i></a> <a
				href="#" class="google-plus"><i class="bx bxl-skype"></i></a> <a
				href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
		</div>
	</div>
	</footer>
	<!-- End Footer -->

	<div id="preloader"></div>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/purecounter/purecounter.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

</body>

</html>