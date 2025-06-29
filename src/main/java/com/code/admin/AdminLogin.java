package com.code.admin;

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
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
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
		
		System.out.println("Username "+email);
		System.out.println("Password "+password);

		
		try 
		{
			HttpSession session=request.getSession();
			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `admin_details` where username='"+ email + "' AND password='" + password + "'");
			ResultSet rs = ps1.executeQuery();
			if (rs.next()) 
			{	
				session.setAttribute("acc_type", "Admin");
				
				System.out.println("Login Done");
				response.sendRedirect("adminHome.jsp?login=done");

			}
			else 
			{
				System.out.println("Login fail");
				response.sendRedirect("adminLogin.jsp?fail=login");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}

	}
}