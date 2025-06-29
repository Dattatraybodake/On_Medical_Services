package com.dbcon;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider 
{
	static Connection con=null;
	public static Connection getConnection() 
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Doctor_on_Door", "root", "root");
			return con;
		}
		catch (Exception e) 
		{
			System.out.println("Exception is " + e);
		}
		return con;
	}
}