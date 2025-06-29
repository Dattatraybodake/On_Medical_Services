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
						<h2>View Uploaded Lab Reports</h2>
						<hr />
						<div class="table-responsive">
							<table class="table">
								<tr>
									<th>Sr.No</th>
									<th>Patient Name</th>
									<th>Doctor Name(Lab)</th>
									<th>Doctor Name(Refere By)</th>
									<th>Upload Time</th>
									<th>Report Name</th>
									<th>Operation</th>
								</tr>

								<%
					 String dr_id=session.getAttribute("id").toString();
						Connection con=ConnectionProvider.getConnection();
						PreparedStatement ps  = con.prepareStatement("SELECT * FROM `report_details` where lab_id='"+dr_id+"'");
						ResultSet rs=ps.executeQuery();
						int i=0;
						GlobalFunction gf=new GlobalFunction(); 
						while(rs.next())
						{
							
							
							HashMap<String,String> p_details = gf.getPatientDetails(rs.getString("patient_id"));
							HashMap<String,String> d_details=gf.getDr_Details(rs.getString("lab_id"));
							HashMap<String,String> ref_dr_details=gf.getDr_Details(rs.getString("refer_by_dr_id"));
							
							
							
							HashMap<String,String>  app_details =gf.getAppointmentDetails(rs.getString("app_id"));
							++i;
						%>

								<tr>
									<td><%=i %></td>
									<td><%=p_details.get("fname") %>&nbsp;<%=p_details.get("mname") %>&nbsp;<%=p_details.get("lname") %></td>
									<td><%=d_details.get("fname") %>&nbsp;<%=d_details.get("mname") %>&nbsp;<%=d_details.get("lname") %></td>
									<td><%=ref_dr_details.get("fname") %>&nbsp;<%=ref_dr_details.get("mname") %>&nbsp;<%=ref_dr_details.get("lname") %></td>
									<td><%=rs.getString("c_date") %></td>
									<td><%=app_details.get("lab_report") %></td>
									<td><a href="DownloadReport?fn=<%=rs.getString("filename")%>">Download</a></td>
									<td>
										<%-- 		<%
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
					 --%>

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