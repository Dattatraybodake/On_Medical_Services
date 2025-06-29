package com.code.patient;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbcon.ConnectionProvider;

/**
 * Servlet implementation class SendRequest
 */
@WebServlet("/SendRequest")
public class SendRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static Connection con=null;
	
	public void init(ServletConfig config) throws ServletException {
		
		try {
			con=ConnectionProvider.getConnection();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String d_id=request.getParameter("d_id");
		String pname=request.getParameter("pname");
		String symptons=request.getParameter("symptons");
		String app_date=request.getParameter("app_date");
		String time_slot=request.getParameter("time_slot");
		
		HttpSession session=request.getSession();
		String user_id=session.getAttribute("email").toString();
		
		
		try 
		{
			PreparedStatement ps=con.prepareStatement("INSERT INTO `appoinment_details`(`user_email`,`d_id`, `pname`, `symptons`, `app_date`, `time_slot`, `status`, `medicine`, `prescription`) VALUES ('"+user_id+"','"+d_id+"','"+pname+"','"+symptons+"','"+app_date+"','"+time_slot+"','Waitting','Waiting','Waitting')");
			int r = ps.executeUpdate();
			if(r>0)
			{
				System.out.println("Request Send ");
				response.sendRedirect("p_viewBApp.jsp?req=send");
			}
			else
			{
				System.out.println("Fail");
				response.sendRedirect("p_viewBApp.jsp?fail=req");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		
		}
		
	
	}


}
