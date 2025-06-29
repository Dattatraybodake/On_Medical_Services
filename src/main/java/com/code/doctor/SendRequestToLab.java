package com.code.doctor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.Local;

import com.dbcon.ConnectionProvider;

/**
 * Servlet implementation class SendRequestToLab
 */
@WebServlet("/SendRequestToLab")
public class SendRequestToLab extends HttpServlet {
static Connection con=null;
	
	public void init(ServletConfig config) throws ServletException {
		
		try {
			con=ConnectionProvider.getConnection();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
	
		String user_email=session.getAttribute("email").toString();
		
		String d_id=request.getParameter("d_id");
		String str=request.getParameter("app_id");
		String arr_app_id[]=str.split(",");
		String app_id=arr_app_id[0];
		String refer_by_dr_id=arr_app_id[1];
		
		
		String pname=request.getParameter("pname");
		String app_date=request.getParameter("app_date");
		String time_slot=request.getParameter("time_slot");
		
		
		
		//System.out.println("!!!!");
		
		/*DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		LocalDate localDateTime = LocalDate.now();
		String c_date_time=dtf.format(localDateTime);*/
		
		try 
		{
			PreparedStatement ps=con.prepareStatement("INSERT INTO `pathology_report`(`patient_id`, `pname`, `dr_id`, `app_id`, `time_slot`, `app_date`,`refer_by_dr_id`) VALUES ('"+user_email+"','"+pname+"','"+d_id+"','"+app_id+"','"+time_slot+"','"+app_date+"','"+refer_by_dr_id+"')");
			System.out.println("PSSS "+ps);
			int r = ps.executeUpdate();
			if(r>0)
			{
				System.out.println("Request Send");
				response.sendRedirect("p_viewBApp.jsp?req=send");
			}
			else
			{
				System.out.println("Update Fail");
				response.sendRedirect("p_viewBApp.jsp?rfail=send");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		
		}
		
	
	}	


}