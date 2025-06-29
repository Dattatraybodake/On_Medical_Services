package com.code.doctor;

import java.io.IOException; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbcon.ConnectionProvider;


/**
 * Servlet implementation class DoctorRegistration
 */
@WebServlet("/DoctorRegistration")
public class DoctorRegistration extends HttpServlet {
	static Connection con;
	public void init(ServletConfig config) throws ServletException 
	{
		try 
		{
			con=ConnectionProvider.getConnection();
		} 
		catch (Exception e) 
		{
			System.out.println("Exception "+e);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		String fname= request.getParameter("fname");
		String mname= request.getParameter("mname");
		String lname= request.getParameter("lname");
		
		String dob= request.getParameter("dob");
		String gender= request.getParameter("gender");
		String mobile= request.getParameter("mobile");
		String adhar_id= request.getParameter("adhar_id");
		String acc_type= request.getParameter("acc_type");
		String address= request.getParameter("address");
		String qualification= request.getParameter("qualification");
		String email= request.getParameter("email");
		String password= request.getParameter("password");
		String area_name= request.getParameter("area_name");
		
		System.out.println("Email ID: "+email);
		System.out.println("Password :  "+password);
		
		DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
		Date dateobj = new Date();
		String reg_date=df1.format(dateobj);
		
		
		try 
		{
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO `doctor_details`(`fname`, `mname`, `lname`, `dob`, `gender`, `mobile`, `adhar_id`, `acc_type`,`qualification`, `address`, `email`, `password`, `reg_date`, `status`,`area_name`) VALUES ('"+fname+"','"+mname+"','"+lname+"','"+dob+"','"+gender+"','"+mobile+"','"+adhar_id+"','"+acc_type+"','"+qualification+"','"+address+"','"+email+"','"+password+"','"+reg_date+"','','"+area_name+"')");
			int i=ps1.executeUpdate();
			if (i>0) 
			{
				System.out.println("Registration Done");
				response.sendRedirect("doctorLogin.jsp?reg=done");

			}
			else 
			{
				System.out.println("Registration fail");
				response.sendRedirect("doctorRegistration.jsp?fail=done");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	}
}