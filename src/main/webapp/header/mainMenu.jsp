
<%
	String acc_type = session.getAttribute("acc_type").toString();
	if (acc_type.equals("Geust")) 
	{
%>
<ul>
	<li><a class="nav-link scrollto active" href="index.jsp">Home</a></li>
	<li class="dropdown"><a href="#"><span>Doctor</span> <i
			class="bi bi-chevron-down"></i></a>
		<ul>
			<li><a href="doctorRegistration.jsp">Doctor Registration</a></li>
			<li><a href="doctorLogin.jsp">Doctor Login</a></li>
		</ul></li>
	<li class="dropdown"><a href="#"><span>Patients</span> <i
			class="bi bi-chevron-down"></i></a>
		<ul>
			<li><a href="patientRegistration.jsp">Patient Registration</a></li>
			<li><a href="patientLogin.jsp">Patient Login</a></li>
		</ul></li>
	<li class="dropdown"><a href="#"><span>Admin</span> <i
			class="bi bi-chevron-down"></i></a>
		<ul>
			<li><a href="adminLogin.jsp">Login</a></li>
		</ul></li>
</ul>
<%
	}
	if (acc_type.equals("Doctor")) {
%>
<ul>
	<li><a class="nav-link scrollto active" href="doctorHome.jsp">Home</a></li>
	<li><a class="nav-link scrollto active"
		href="dr_getPatientRequest.jsp">Appointment Request</a></li>
	<li><a class="nav-link scrollto active"
		href="dr_view_appointment.jsp">Confirm Appointment</a></li>
	<li><a class="nav-link scrollto active"
		href="dr_view_patientReport.jsp">Patient Details</a></li>
		
	<li><a class="nav-link scrollto active" href="dr_viewUploadReport.jsp">Lab Report</a></li>
	<li><a class="nav-link scrollto" href="Logout">Logout</a></li>
</ul>

<%
	}
	if (acc_type.equals("PathologyLab")) {
%>
<ul>
	<li><a class="nav-link scrollto active" href="doctorHome.jsp">Home</a></li>
	
	
	<li><a class="nav-link scrollto active"
		href="lb_viewReportRequest.jsp">View Appointment</a></li>
	<li><a class="nav-link scrollto active"
		href="lb_viewUploadReport.jsp">Upload Report</a></li>
	<li><a class="nav-link scrollto" href="Logout">Logout</a></li>
</ul>


<%
	}

	if (acc_type.equals("Patient")) {
%>
<ul>
	<li><a class="nav-link scrollto active" href="patientHome.jsp">Home</a></li>
	<li><a class="nav-link scrollto active" href="searchDoctor.jsp">Search</a></li>
	<li><a class="nav-link scrollto active" href="p_viewBApp.jsp">Appointment Details</a></li>
	<!-- <li><a class="nav-link scrollto active" href="p_viewReport.jsp">Report</a></li> -->
	<li><a class="nav-link scrollto active" href="p_viewLabReport.jsp">Lab Report</a></li>
	<li><a class="nav-link scrollto active" href="pt_viewUploadReport.jsp">Download Report</a></li>
	<li><a class="nav-link scrollto active" href="Logout">Logout</a></li>
</ul>

<%
	}
	
	if (acc_type.equals("Admin")) 
	{
%>
<ul>
	<li><a class="nav-link scrollto active" href="adminHome.jsp">Home</a></li>
	<li><a class="nav-link scrollto active"
		href="adminViewDoctors.jsp">View Doctors</a></li>
	<li><a class="nav-link scrollto active"
		href="adminViewPatients.jsp">View Patients</a></li>
	<li><a class="nav-link scrollto" href="Logout">Logout</a></li>
</ul>

<%}%>