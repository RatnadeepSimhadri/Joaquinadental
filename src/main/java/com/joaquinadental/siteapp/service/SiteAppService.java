package com.joaquinadental.siteapp.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.joaquinadental.siteapp.DAO.SiteAppDAO;
import com.joaquinadental.siteapp.bean.User;
import com.joaquinadental.siteapp.bean.ViewAppointment;


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

}
