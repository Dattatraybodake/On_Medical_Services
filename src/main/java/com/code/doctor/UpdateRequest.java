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

import com.dbcon.ConnectionProvider;

/**
 * Servlet implementation class UpdateRequest
 */
@WebServlet("/UpdateRequest")
public class UpdateRequest extends HttpServlet {
static Connection con=null;
	
	public void init(ServletConfig config) throws ServletException {
		
		try {
			con=ConnectionProvider.getConnection();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id=request.getParameter("id");
		String sts=request.getParameter("sts");
		
		try 
		{
			PreparedStatement ps=con.prepareStatement("UPDATE `appoinment_details` SET  `status`='"+sts+"'where `id`='"+id+"'");
			int r = ps.executeUpdate();
			if(r>0)
			{
				System.out.println("Request Update");
				response.sendRedirect("dr_getPatientRequest.jsp?rsp=send");
			}
			else
			{
				System.out.println("Update Fail");
				response.sendRedirect("dr_getPatientRequest.jsp?fail=send");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		
		}
		
	
	}


}