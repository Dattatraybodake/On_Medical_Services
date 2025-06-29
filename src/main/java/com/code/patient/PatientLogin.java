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
 * Servlet implementation class PatientLogin
 */

@WebServlet("/PatientLogin")
public class PatientLogin extends HttpServlet {
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
	
		String email= request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		
		System.out.println("email "+email);
		System.out.println("Password "+password);

		
		try 
		{
			
			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `patient_details` where email='"+ email + "' AND password='" + password + "'");
			ResultSet rs = ps1.executeQuery();
			if (rs.next()) 
			{
				
				session.setAttribute("email", email);
				session.setAttribute("fname", rs.getString("fname"));
				session.setAttribute("mname", rs.getString("mname"));
				session.setAttribute("lname", rs.getString("lname"));
				session.setAttribute("mobile", rs.getString("mobile"));
			
				session.setAttribute("acc_type", "Patient");
				
				System.out.println("Login Done");
				response.sendRedirect("patientHome.jsp?login=done");

			}
			else 
			{
				System.out.println("Login fail");
				response.sendRedirect("patientLogin.jsp?fail=login");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}

	}
}