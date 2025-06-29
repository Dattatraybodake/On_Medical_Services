package com.code.global;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import com.dbcon.ConnectionProvider;

public class GlobalFunction 
{
	
	static Connection con=ConnectionProvider.getConnection();
	
	public HashSet<String> getDQualification()
	{
		HashSet<String> qua=new HashSet<>();
		
		try 
		{
			PreparedStatement ps=con.prepareStatement("Select DISTINCT(qualification) from doctor_details");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				qua.add(rs.getString(1));
			}
			
		} catch (Exception e) 
		{
			System.out.println("Exc getDQualification "+e);
		}
		
		return qua;
		
		
	}
	
	public HashSet<String> getDAreaName()
	{
		HashSet<String> qua=new HashSet<>();
		try 
		{
			PreparedStatement ps=con.prepareStatement("Select DISTINCT(area_name) from doctor_details");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				qua.add(rs.getString(1));
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exc getarea Name ");
			
		}
		return qua;
	}
	
	public HashMap<String,String> getDr_Details(String id)
	{
		HashMap<String,String> dr_details=new HashMap<>();
		
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `doctor_details` where id='"+id+"'");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{ 
				dr_details.put("fname", rs.getString("fname"));
				dr_details.put("mname", rs.getString("mname"));
				dr_details.put("lname", rs.getString("lname"));
				dr_details.put("mobile", rs.getString("mobile"));
				dr_details.put("email", rs.getString("email"));
				dr_details.put("address", rs.getString("address"));
				dr_details.put("qualification", rs.getString("qualification"));
				
			}
			
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return dr_details;
	}
	
	public HashMap<String,String> getPatientDetails(String id)
	{
		HashMap<String,String> p_details=new HashMap<>();
		
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `patient_details` where email='"+id+"'");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{ 
				p_details.put("fname", rs.getString("fname"));
				p_details.put("mname", rs.getString("mname"));
				p_details.put("lname", rs.getString("lname"));
				
			}
			
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return p_details;
	}
	
	
	public HashMap<String,String> getLabReport(String user_email)
	{
		HashMap<String,String> report_required=new HashMap<String,String>();
		
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `appoinment_details` where lab_report_sts='waiting' AND user_email='"+user_email+"' AND status='Check'");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{ 
				report_required.put(rs.getString("id"),rs.getString("d_id")+","+rs.getString("pname")+"--"+rs.getString("lab_report"));
				
			}
			
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return report_required;
	}
	
	
	
	public HashMap<String,String> getDrBusyTime(String d_id,String app_date)
	{
		HashMap<String,String> free_time_slot=new HashMap<>();
		free_time_slot.put("10:00AM To 11:00AM","1");
		free_time_slot.put("11:00AM To 12:00PM","2");
		free_time_slot.put("12:00PM To 01:00PM","3");
		free_time_slot.put("01:00PM To 02:00PM","4");
		free_time_slot.put("02:00PM To 03:00PM","5");
		free_time_slot.put("03:00PM To 04:00PM","6");
		free_time_slot.put("04:00PM To 05:00PM","7");
		free_time_slot.put("05:00PM To 06:00PM","8");
		free_time_slot.put("06:00PM To 07:00PM","9");
		free_time_slot.put("07:00PM To 08:00PM","10");
		
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `appoinment_details` where d_id='"+d_id+"' AND app_date='"+app_date+"' AND status='Accept'");
			System.out.println("PS "+ps);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{ 
				free_time_slot.remove(rs.getString("time_slot"));
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc Dr Busy Time "+e);
		}	
		
		return free_time_slot;
	}

	public HashMap<String,String> getLabBusyTime(String d_id,String app_date)
	{
		HashMap<String,String> free_time_slot=new HashMap<>();
		
		free_time_slot.put("10:00AM To 11:00AM","1");
		free_time_slot.put("11:00AM To 12:00PM","2");
		free_time_slot.put("12:00PM To 01:00PM","3");
		free_time_slot.put("01:00PM To 02:00PM","4");
		free_time_slot.put("02:00PM To 03:00PM","5");
		free_time_slot.put("03:00PM To 04:00PM","6");
		free_time_slot.put("04:00PM To 05:00PM","7");
		free_time_slot.put("05:00PM To 06:00PM","8");
		free_time_slot.put("06:00PM To 07:00PM","9");
		free_time_slot.put("07:00PM To 08:00PM","10");
		
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `pathology_report` where dr_id='"+d_id+"' AND app_date='"+app_date+"' AND status='Accept'");
			System.out.println("PS "+ps);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{ 
				free_time_slot.remove(rs.getString("time_slot"));
			}
		} catch (Exception e) 
		{
			System.out.println("Exc Dr Busy Time "+e);
		}	
		return free_time_slot;
	}
	
	public HashMap<String,String> getAppointmentDetails(String id)
	{
		HashMap<String,String> app_details=new HashMap<>();
		
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `appoinment_details` where id='"+id+"'");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{ 
				app_details.put("user_email", rs.getString("user_email"));
				app_details.put("d_id", rs.getString("d_id"));
				app_details.put("lab_report", rs.getString("lab_report"));
				app_details.put("lab_report_sts", rs.getString("lab_report_sts"));
			}
			
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return app_details;
	}
	


	public HashMap<String,String> getPathologyReportDetail(String id)
	{
		HashMap<String,String> rep_details=new HashMap<>();
		
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `pathology_report` where id='"+id+"'");
			System.out.println("PS   "+ps);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{ 
				rep_details.put("patient_id", rs.getString("patient_id"));
				rep_details.put("pname", rs.getString("pname"));
				rep_details.put("dr_id", rs.getString("dr_id"));
				rep_details.put("app_id", rs.getString("app_id"));
				rep_details.put("refer_by_dr_id", rs.getString("refer_by_dr_id"));
				
				
			}
			else
			{
				System.out.println("Flase Execure ");
			}
			
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		
		return rep_details;
	}
	
	
	public static void main(String[] args) {
		
		GlobalFunction gf=new GlobalFunction();
		HashSet<String> qual =gf.getDQualification();
		System.out.println("Qua "+qual);
		
	}

}
