
<%
	if (request.getParameter("login") != null) {
		out.print("<script>alert('Login Done')</script>");
	}
if (request.getParameter("chek") != null) {
	out.print("<script>alert('Prescription Send Successfully...!')</script>");
}


	if (request.getParameter("rsp") != null) {
		out.print("<script>alert('Response Send Successfully')</script>");
	}
	if (request.getParameter("req") != null) {
		out.print("<script>alert('Request Send Successfully')</script>");
	}
	

	if (request.getParameter("reg") != null) {
		out.print("<script>alert('Registration Done')</script>");
	}
	if (request.getParameter("fail") != null) {
		out.print("<script>alert('Incorrect Login Credientials...!')</script>");
	}
	
	if (request.getParameter("upload") != null) {
		out.print("<script>alert('Upload Done...!')</script>");
	}
	
%>
