package com.joaquinadental.siteapp.service;

import java.util.*;
import java.text.*;

import com.google.gson.Gson;
import com.joaquinadental.siteapp.DAO.SiteAppDAO;
import com.joaquinadental.siteapp.bean.AdminAppointment;
import com.joaquinadental.siteapp.bean.User;
import com.joaquinadental.siteapp.bean.ViewAppointment;
import com.joaquinadental.siteapp.bean.EditAppointment;


public class SiteAppService {
	
	public static List<String> viewAppointments() {
		List<ViewAppointment> list = SiteAppDAO.viewAppointments();
		return formatAppointmentDetails(list);
	}
	
	public User validateLoginCredentials(String email, String password){
		User user = null;
		/*if(email==null ||"".equals(email)||password==null ||"".equals(password))
			return false;*/
		List<User>users = SiteAppDAO.getUsers(email,password);
		for (Iterator iterator = users.iterator(); iterator.hasNext();) {
			 user = (User) iterator.next();
			if(user.getEmail().equalsIgnoreCase(email) && user.getPassword().equalsIgnoreCase(password)){
				break;
			}
		}
		return user;
	}
	
	private static List<String> formatAppointmentDetails(List<ViewAppointment> list){
		List<String> formattedAppointments = new ArrayList<String>();
		for (Iterator iterator = list.iterator(); iterator
				.hasNext();) {
			ViewAppointment va = (ViewAppointment) iterator.next();
			String formattedAppointment = "<b>"+va.getPatientFirstName()+" "+va.getPatientLastName()+"</b><br>"+"Time : "+va.getAppointment_time().toString();
			formattedAppointments.add(formattedAppointment);
		}
		System.out.println("Formatted String" + formattedAppointments.get(0));
		return formattedAppointments;
	}
	
	// Jd method to get todays appointment details
	
	private static List<String> formatAppointmentDetailsPatient(List<ViewAppointment> list){
		List<String> formattedAppointments = new ArrayList<String>();
		if (list.isEmpty())
		{
			String formattedAppointment = "<b> You dont have any upcoming appointments.</b>";
			formattedAppointments.add(formattedAppointment);
		}
		else 
		{
		for (Iterator iterator = list.iterator(); iterator
				.hasNext();) {
			ViewAppointment va = (ViewAppointment) iterator.next();
			String formattedAppointment = "<b> Appointment Date: </b>"+va.getAppointmentDate()+" <b> Time</b>"+va.getAppointment_time().toString()+"<br>"+
				     "<b>Doctor </b>"+va.getDentistFirstName()+" "+va.getDentistLastName();
			formattedAppointments.add(formattedAppointment);
		}
		System.out.println("Formatted String" + formattedAppointments.get(0));
		}
		return formattedAppointments;
	}
	
	public static List<String> viewPatientComingAppointment(String useremail) {
		List<ViewAppointment> list = SiteAppDAO.viewPatientComingAppointment(useremail);
		System.out.println("back to service method");
		/*System.out.println("Appointment in service method"+list.get(0).getPatientFirstName());
		System.out.println("Appointment in service method"+list.get(0).getPatientLastName());
		System.out.println("Appointment in service method"+list.get(0).getAppointment_time());
	/*System.out.println("Appointment in service method"+list.get(0).get`);
		System.out.println("Appointment in service method"+list.get(0).getPatientFirstName());
		System.out.println("Appointment in service method"+list.get(0).getPatientFirstName());
		System.out.println("Appointment in service method"+list.get(0).getPatientFirstName());
		*/
		return formatAppointmentDetailsPatient(list);
	}

	//Sairam Code to populate today's appointments
	public static String admindashappointment() {
		// TODO Auto-generated method stub
		List<ViewAppointment> list = SiteAppDAO.todayappointment();
		System.out.println("Hello");
		List<AdminAppointment>adminlist=convertadminappointment(list);
		System.out.println("Hello1");
		return converttojson(adminlist);
		
		
	}

	

	private static List<AdminAppointment> convertadminappointment(
			List<ViewAppointment> list) {
		List<AdminAppointment> adminlists=new ArrayList<AdminAppointment>();
		AdminAppointment aa= new AdminAppointment();
		for (Iterator iterator = list.iterator(); iterator
				.hasNext();) {
			 aa= new AdminAppointment();
			ViewAppointment va = (ViewAppointment) iterator.next();
			String patientName = va.getPatientFirstName() + " " +va.getPatientLastName();
			System.out.println("Printing Name");
			System.out.println(patientName);
			String dentistName = va.getDentistFirstName() + " " +va.getDentistLastName();
			aa.setAppointment_id(va.getAppointment_id());
			aa.setPatientName(patientName);
			aa.setDentistName(dentistName);
			aa.setAppointment_Date(va.getAppointmentDate());
			aa.setAppointment_time(va.getAppointment_time());
			adminlists.add(aa);
		}
	
			
		return adminlists;
	}

	//Sairam code to convert object to String
	
	private static String converttojson(List<AdminAppointment> list) {
		// TODO Auto-generated method stub
     
		Gson gson = new Gson();
		String json = gson.toJson(list);
		System.out.println("Printing Json");
		System.out.println(json);
		return json;
	}

	public static String searchappointment(String patientid,
			String docdropdown, String val_date_picker) throws Exception{
		// TODO Auto-generated method stub
		SimpleDateFormat fromUser = new SimpleDateFormat("MM/dd/yyyy");
        SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");
        String reformattedStr="";
        try{
        /*Date date = originalFormat.parse("04/17/2016");
        String formattedDate = targetFormat.format(date);*/
        
        reformattedStr = myFormat.format(fromUser.parse(val_date_picker));
        System.out.println(reformattedStr);
        List<AdminAppointment> list = SiteAppDAO.updatedappointment(patientid,docdropdown,reformattedStr);
        return converttojson(list);
        }catch(Exception e){
        	
        	List<AdminAppointment> list = SiteAppDAO.updatedappointment(patientid,docdropdown,reformattedStr);
            return converttojson(list);
        }
		
        
		
		
		
	}

	public static String addappointment(String patientid, String patfirst_name,
			String patlast_name, String doctor_name, String appoint_date,
			String hours, String mins) throws Exception{
		String firstname="";
		String lastname="";
		if(doctor_name!="")
		{
		String[] docnames = doctor_name.split(" ");
		firstname=docnames[0];
		lastname=docnames[1];
		}	
		else{
			return " Hey there , please mention the dentist name";
		}
		String appoint_time= hours + ":" + mins + ":" + "00";
		SimpleDateFormat fromUser = new SimpleDateFormat("MM/dd/yyyy");
        SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");
        String reformattedStr="";
        try{
        /*Date date = originalFormat.parse("04/17/2016");
        String formattedDate = targetFormat.format(date);*/
        
        reformattedStr = myFormat.format(fromUser.parse(appoint_date));
        
		String status = SiteAppDAO.addappointment(patientid,firstname,lastname, reformattedStr, appoint_time);
		System.out.println(status);
		return status;
        }catch(Exception e){
        	String status = SiteAppDAO.addappointment(patientid,firstname,lastname, reformattedStr, appoint_time);
        	System.out.println(status);
        	return status;
        }
		
	}

	public static EditAppointment editappointment(String h_appt_id,
			String h_pat_name, String h_doc_name, String h_appt_date,
			String h_appt_hrs, String h_appt_mins) {
		
		EditAppointment list = new EditAppointment();
		list.setAppointment_id(h_appt_id);
		list.setPatientName(h_pat_name);
		list.setDentistName(h_doc_name);
		
		list.setAppointment_Date(h_appt_date);
		list.setHours(h_appt_hrs);
		list.setMins(h_appt_mins);
		return list;
		
	}

	public static String updappointment(String appt_id, String doctor_name,
			String appoint_date, String hours, String mins) {


		String firstname="";
		String lastname="";
		if(doctor_name!="")
		{
		String[] docnames = doctor_name.split(" ");
		firstname=docnames[0];
		lastname=docnames[1];
		}	
		else{
			return " Hey there , please mention the dentist name";
		}
		String appoint_time= hours + ":" + mins + ":" + "00";
		SimpleDateFormat fromUser = new SimpleDateFormat("MM/dd/yyyy");
        SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");
        String reformattedStr="";
        try{
        /*Date date = originalFormat.parse("04/17/2016");
        String formattedDate = targetFormat.format(date);*/
        
        reformattedStr = myFormat.format(fromUser.parse(appoint_date));
        
		String status = SiteAppDAO.updappointment(appt_id,firstname,lastname, reformattedStr, appoint_time);
		System.out.println(status);
		return status;
        }catch(Exception e){
        	String status = SiteAppDAO.updappointment(appt_id,firstname,lastname, reformattedStr, appoint_time);
        	System.out.println(status);
        	return status;
        }
		
		
	}

	
}
