package com.code.patient;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbcon.ConnectionProvider;

/**
 * Servlet implementation class CancelRequest
 */
@WebServlet("/CancelRequest")
public class CancelRequest extends HttpServlet {
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
		
		
		
		try 
		{
			PreparedStatement ps=con.prepareStatement("UPDATE `appoinment_details` SET `status`='Cancel' where id='"+id+"'");
			int r = ps.executeUpdate();
			if(r>0)
			{
				System.out.println("Request Update");
				response.sendRedirect("p_viewBApp.jsp?cancel=done");
			}
			else
			{
				System.out.println("Fail");
				response.sendRedirect("p_viewBApp.jsp?fail=cancel");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		
		}
		
	
	}


}
