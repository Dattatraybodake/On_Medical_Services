package com.code.doctor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbcon.ConnectionProvider;

/**
 * Servlet implementation class RequestResponse
 */
@WebServlet("/RequestResponse")
public class RequestResponse extends HttpServlet {

	static Connection con=null;
	
	public void init(ServletConfig config) throws ServletException {
		
		try {
			con=ConnectionProvider.getConnection();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id=request.getParameter("id");
		String prescription=request.getParameter("prescription");
		String lab_report=request.getParameter("lab_report");

		String c_date=new Date().toString();
		
		try 
		{
			PreparedStatement ps=con.prepareStatement("UPDATE `appoinment_details` SET  `status`='Check',`medicine`='"+c_date+"',`prescription`='"+prescription+"',	lab_report='"+lab_report+"' where `id`='"+id+"'");
			int r = ps.executeUpdate();
			if(r>0)
			{
				System.out.println("Request Send ");
				response.sendRedirect("dr_view_patientReport.jsp?chek=done");
			}
			else
			{
				System.out.println("Fail");
				response.sendRedirect("dr_view_patientReport.jsp?fail=check");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		
		}
		
	
	}


}