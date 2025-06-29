<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dbcon.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.HashSet"%>
<%@page import="com.code.global.GlobalFunction"%>
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
				<h2 align="center">Appoinment Booking Details</h2>
				<hr />
				<p align="right">
					Welcome: &nbsp;&nbsp;<%=session.getAttribute("fname").toString()%>&nbsp;<%=session.getAttribute("mname").toString()%>&nbsp;<%=session.getAttribute("lname").toString()%>
			</div>

		</div>
		<%
			if(request.getParameter("d_id")!=null)
				{
			String d_id=request.getParameter("d_id");
			String app_date=session.getAttribute("app_date").toString();
			String dr_area_name=session.getAttribute("dr_area_name").toString();
			
			Connection con=ConnectionProvider.getConnection();
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `doctor_details` where id='"+d_id+"'");
			System.out.println("1");
			ResultSet rs=ps.executeQuery();
			int i=0;
			if(rs.next())
			{
		%>
		<div class="row">
			<div class="col-lg-6">
				<div class="table-responsive">
					<table class="table" align="center">
						<tr>
							<th>Doctor Name</th>
							<td><%=rs.getString("fname")%>&nbsp;<%=rs.getString("mname")%>&nbsp;<%=rs.getString("lname")%></td>
						</tr>
						<tr>
							<th>Birth Date</th>
							<td><%=rs.getString("dob")%></td>
						</tr>
						<tr>
							<th>Gender</th>
							<td><%=rs.getString("gender")%></td>
						</tr>
						<tr>
							<th>Mobile Number</th>
							<td><%=rs.getString("mobile")%></td>
						</tr>
						<tr>
							<th>Email</th>
							<td><%=rs.getString("email")%></td>
						</tr>
						<tr>
							<th>Qualification</th>
							<td><%=rs.getString("qualification")%></td>
						</tr>
						<tr>
							<th>Address</th>
							<td><%=rs.getString("address")%></td>
						</tr>
						<tr>
					</table>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="table-responsive">
					<form action="SendRequest" method="POST">

						<table class="table" align="center">
							<tr>
								<th>Patient Name <input type="hidden" name="d_id"
									value="<%=d_id%>">
								</th>
								<td><input type="text" class="form-control" name="pname"
									required></td>
							</tr>
							<tr>
								<th>Symptoms</th>
								<td><textarea rows="4" cols="20" name="symptons"
										class="form-control" required></textarea></td>
							</tr>
							<tr>
								<th>Appointment Date</th>
								<td><input type="date" name="app_date" readonly="readonly"
									value="<%=app_date%>"
									class="form-control"></td>
							</tr>
							<tr>
								<th>Time Slot</th>
								<td><select name="time_slot" class="form-control">
										<%
											GlobalFunction gf=new GlobalFunction();
											HashMap<String,String> slot=gf.getDrBusyTime(d_id,app_date);
											for(Map.Entry m : slot.entrySet())
											 {
										%>
										<option value="<%=m.getKey()%>"><%=m.getKey()%></option>
										<%
											}
										%>
								</select>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" value="Submit"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>

		</div>
		<%
			}
			}
		%>

	</div>

	</section> <!-- End Appointment Section --> </main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer">

	<div class="container d-md-flex py-4">

		<div class="me-md-auto text-center text-md-start">
			<div class="copyright">
				&copy; Copyright <strong><span><jsp:include
							page="projectTitle.jsp"></jsp:include></span></strong>. All Rights Reserved
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