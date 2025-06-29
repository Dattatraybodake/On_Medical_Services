package com.code.patient;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.nio.channels.ReadableByteChannel;
import java.sql.Connection;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbcon.ConnectionProvider;

/**
 * Servlet implementation class DownloadReport
 */
@WebServlet("/DownloadReport")
public class DownloadReport extends HttpServlet {
	static Connection con;

	public void init(ServletConfig config) throws ServletException {
		try {
			con = ConnectionProvider.getConnection();
		} catch (Exception e) {
			System.out.println("Exception Download Connection " + con);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		// Get PrintWriter object
		PrintWriter out = response.getWriter();

		String pdfName = request.getParameter("fn");
		String pdfPath = "D:/project/Reports/";

		// Set the content type and header of the response.
		response.setContentType("application/msword");
		response.setHeader("Content-Disposition", "attachment; filename=\""
				+ pdfName + "\"");

		// Get FileInputStream object to identify the path
		FileInputStream inputStream = new FileInputStream(pdfPath + pdfName);

		// Loop through the document and write into the
		// output.
		int in;
		while ((in = inputStream.read()) != -1) 
		{
			out.write(in);
		}

		// Close FileInputStream and PrintWriter object
		inputStream.close();
		out.close();

	}

}
