package com.code.doctor;

import java.io.File; 
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.code.global.GlobalFunction;
import com.dbcon.ConnectionProvider;


/**
 * Servlet implementation class UploadLabReport
 */
@WebServlet("/UploadLabReport")
public class UploadLabReport extends HttpServlet {

	final static String ImgPath="D:/project/Reports/";
		
		static Connection con;
		public void init(ServletConfig config) throws ServletException 
		{
			try {
				con=ConnectionProvider.getConnection();
			} catch (Exception e) {
				System.out.println("Exc init block "+e);
			}

		}
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
		{
			
			if (ServletFileUpload.isMultipartContent(request)) 
	  		{
				try 
				{
					@SuppressWarnings("unchecked")
					List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
					 
					String FileName = ""; 

					for (FileItem item1 : multiparts) 
					{
						if (!item1.isFormField()) 
						{

							String name = new File(item1.getName()).getName();
							item1.write(new File(ImgPath + File.separator + name));
							FileName = item1.getName(); 
						}
					}
					
					String reqid="";
					for (FileItem item : multiparts) 
					{
						if ((item.getFieldName()).equals("id")) {
							reqid = (String) item.getString();
						}
					}
					
					/*String id="";
					for (FileItem item : multiparts) 
					{
						if ((item.getFieldName()).equals("id")) {
							reqid = (String) item.getString();
						}
					}
					*/
					HttpSession session=request.getSession();
					String lb_id=session.getAttribute("id").toString();
					
					
					GlobalFunction gf= new GlobalFunction();
					
					HashMap<String, String> rep_details =gf.getPathologyReportDetail(reqid);		
					
					String patient_id=rep_details.get("patient_id");
					String app_id=rep_details.get("app_id");
					
					String refer_by_dr_id=rep_details.get("refer_by_dr_id");
					
					DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
					Date dateobj = new Date();
					String c_date = df.format(dateobj);
					System.out.println("Current Date "+c_date);

					
					PreparedStatement ps=con.prepareStatement("INSERT INTO `report_details`(`req_id`, `filename`, `lab_id`, `patient_id`, `app_id`,`refer_by_dr_id`) VALUES ('"+reqid+"','"+FileName+"','"+lb_id+"','"+patient_id+"','"+app_id+"','"+refer_by_dr_id+"')");
					int i=ps.executeUpdate();
					if(i>0)
					{
						System.out.println("Done");
						response.sendRedirect("lb_UploadReport.jsp?upload=done&id="+reqid);
					}
					else
					{
						System.out.println("Fail");
						response.sendRedirect("lb_UploadReport.jsp?nupload=fail&id="+reqid);
					}
				}
				catch (Exception e) 
				{
					System.out.println("Exception "+e);
				}
			}
	  		else 
			{
					System.out.println("Condition False");
					response.sendRedirect("lb_UploadReport.jsp?nupload=fail");
			}
		}

	}