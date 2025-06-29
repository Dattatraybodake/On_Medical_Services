package com.code.doctor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbcon.ConnectionProvider;

/**
 * Servlet implementation class UpdateLabReqStatus
 */
@WebServlet("/UpdateLabReqStatus")
public class UpdateLabReqStatus extends HttpServlet {
	static Connection con=null;
	
	public void init(ServletConfig config) throws ServletException {
		
		try {
			con=ConnectionProvider.getConnection();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String id=request.getParameter("id");
		String sts=request.getParameter("s");
		
		try 
		{
			PreparedStatement ps=con.prepareStatement("UPDATE `pathology_report` SET  `status`='"+sts+"'where `id`='"+id+"'");
			int r = ps.executeUpdate();
			if(r>0)
			{
				System.out.println("Request Update");
				response.sendRedirect("lb_viewReportRequest.jsp?rsp=send");
			}
			else
			{
				System.out.println("Update Fail");
				response.sendRedirect("lb_viewReportRequest.jsp?fail=send");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		
		}
		
	
	}


}
