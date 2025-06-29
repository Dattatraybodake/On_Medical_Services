<%@page import="java.util.HashMap"%>
<%@page import="com.code.global.GlobalFunction"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.dbcon.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
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

		<nav id="navbar" class="navbar order-last order-lg-0"> <jsp:include
			page="header/mainMenu.jsp"></jsp:include> <i
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
		<div class="row">
			<div class="col-lg-12">
				<div class="row">
					<div class="col-lg-12" align="center">
					<h2>View Prescription By Doctors </h2>
					<hr/>
					
					<div class="table-responsive">
					<table class="table">
						<tr>
							<th>Sr.No</th>
							<th>Doctor Name</th>
							<th>Gender</th>
							<th>Qualification</th>
							<th>Mobile</th>
							<th>Address</th>
							<th>Patient Name</th>
							<th>Symptoms</th>
							<th>Appointment Date</th>
							<th>Time</th>
							<th>Operation</th>
						</tr>
					
					
			
					<%
					 String email=session.getAttribute("email").toString();
						Connection con=ConnectionProvider.getConnection();
						PreparedStatement ps  = con.prepareStatement("SELECT * FROM `appoinment_details` where user_email='"+email+"' ORDER BY id DESC");
						ResultSet rs=ps.executeQuery();
						int i=0;
						GlobalFunction gf=new GlobalFunction(); 
						while(rs.next())
						{
							HashMap<String,String> dr_details=gf.getDr_Details(rs.getString("d_id"));
							
							++i;
						%>
					
						<tr>
							<td><%=i %></td>
							<td><%=dr_details.get("fname") %>&nbsp;<%=dr_details.get("mname") %>&nbsp;<%=dr_details.get("lname") %></td>
							<td><%=dr_details.get("email") %></td>
							<td><%=dr_details.get("mobile") %></td>
							<td><%=dr_details.get("address") %></td>
							<td><%=dr_details.get("qualification") %></td>
							
							
							<td><%=rs.getString("pname") %></td>
							<td><%=rs.getString("symptons") %></td>
							<td><%=rs.getString("app_date") %></td>
							<td><%=rs.getString("time_slot") %></td>
							<td>
							
							<%
							if(!rs.getString("prescription").equals("Waitting"))
							{
							%>
							<a href="patient_checkPrescription.jsp?id=<%=rs.getString("id")%>">Check Presctiption</a> 
							<%
							}
							else
							{
							%>
							<p style="color: red;">Not Give Prescription</p>
							<%	
							}
							%>
							
							
							</td>
						</tr>
							
							
							
						<%
							
						}
					%>
					</table>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>

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