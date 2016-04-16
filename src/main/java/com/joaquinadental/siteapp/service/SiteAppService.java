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
	
	public boolean validateLoginCredentials(String email, String password){
		boolean isvalidUser = false;
		/*if(email==null ||"".equals(email)||password==null ||"".equals(password))
			return false;*/
		List<User>users = SiteAppDAO.getUsers();
		for (Iterator iterator = users.iterator(); iterator.hasNext();) {
			User user = (User) iterator.next();
			if(user.getEmail().equalsIgnoreCase(email) && user.getPassword().equalsIgnoreCase(password)){
				isvalidUser=true;
				break;
			}
		}
		return isvalidUser;
	}
	
	private static List<String> formatAppointmentDetails(List<ViewAppointment> list){
		List<String> formattedAppointments = new ArrayList<String>();
		for (Iterator iterator = list.iterator(); iterator
				.hasNext();) {
			ViewAppointment va = (ViewAppointment) iterator.next();
			String formattedAppointment = "<b>"+va.getPatientFirstName()+" "+va.getPatientLastName()+"</b><br>"+"Time : "+va.getAppointment_time().toString();
			formattedAppointments.add(formattedAppointment);
		}
		return formattedAppointments;
	}

}
