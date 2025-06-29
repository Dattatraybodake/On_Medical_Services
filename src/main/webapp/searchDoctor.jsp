<%@page import="java.text.SimpleDateFormat"%>
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
				<h2 align="center">Search Doctor/ Pathology Lab</h2>
				<hr />
				<p align="right">
					Welcome: &nbsp;&nbsp;<%=session.getAttribute("fname").toString()%>&nbsp;<%=session.getAttribute("mname").toString()%>&nbsp;<%=session.getAttribute("lname").toString()%>
			</div>

		</div>
		<div class="row">
			<div class="col-lg-12">
				<form action="searchDoctor.jsp" method="post">
					<table align="center">
						<tr>
							<th>Account Type</th>
							<td><select class="form-control" name="acc_type">
									<option value="Doctor">Doctor</option>
									<option value="PathologyLab">PathologyLab</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>Qualification</th>
							<td><select class="form-control" name="qua">
									<%
										GlobalFunction gf=new GlobalFunction();
														HashSet<String> qual =gf.getDQualification();
														for(String q:qual)
														{
									%>
									<option value="<%=q%>"><%=q%></option>

									<%
										}
									%>
							</select></td>
						</tr>
						<tr>
							<th>Area:</th>
							<td><select class="form-control" name="dr_area_name">
							<%
							HashSet<String> area_name =gf.getDAreaName();
							for(String an:area_name)
							{
							%>
							<option value="<%=an%>"><%=an%></option>

							<%
							}
							%>
							</select></td>
						</tr>
						<tr>
							<th>Appointment Date:</th>
							<td><input type="date" name="app_date" required="required" class="form-control"></td>
						</tr>
						


						<tr>
							<td></td>
							<td><button type="submit" class="btn btn-success">Search</button></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<hr />
		<%
			if(request.getParameter("qua")!=null)
			{
				
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				
			String quall=request.getParameter("qua");
			String acc_type=request.getParameter("acc_type");
			String dr_area_name=request.getParameter("dr_area_name");
			String app_date=request.getParameter("app_date");
			
			session.setAttribute("app_date", app_date);
			session.setAttribute("dr_area_name", dr_area_name);
			
			System.out.println("App Date "+app_date);
			
		%>
		<div class="row">
			<div class="col-lg-12">
				<div class="table-responsive">
					<table class="table" align="center">
						<tr>
							<th>Sr.No</th>
							<th>Doctor Name</th>
							<th>Birth Date</th>
							<th>Gender</th>
							<th>Mobile</th>
							<th>Email-ID</th>
							<th>Qualification</th>
							<th>Address</th>

							<%
							
							Connection con=ConnectionProvider.getConnection();
							PreparedStatement ps=con.prepareStatement("SELECT * FROM `doctor_details` where qualification='"+quall+"' AND area_name='"+dr_area_name+"' AND acc_type='"+acc_type+"'");
							System.out.println("PS "+ps);
							ResultSet rs=ps.executeQuery();
							
							int i=0;
							while(rs.next())
							{
							++i;
				%>
						
						<tr>
							<td><%=i%></td>
							<td><%=rs.getString("fname")%>&nbsp;<%=rs.getString("mname")%>&nbsp;<%=rs.getString("lname")%></td>
							<td><%=rs.getString("dob")%></td>
							<td><%=rs.getString("gender")%></td>
							<td><%=rs.getString("mobile")%></td>
							<td><%=rs.getString("email")%></td>
							<td><%=rs.getString("qualification")%></td>
							<td><%=rs.getString("address")%></td>
							<td>
							<%
							if(acc_type.equals("Doctor"))
							{
							%>
							<a href="bookDoctor.jsp?d_id=<%=rs.getString("id")%>">Book
									Appointment</a>
							<%}
							else
							{
							%>
							<a href="bookPathologyLab.jsp?d_id=<%=rs.getString("id")%>">Book Lab
									Appointment</a>
							<%} %>
									</td>
						</tr>
						<%
							}
						%>
					</table>
				</div>
			</div>
		</div>
		<%
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