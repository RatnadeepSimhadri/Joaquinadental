package com.joaquinadental.siteapp.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Request;
import org.springframework.http.HttpRequest;


import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.joaquinadental.siteapp.DAO.SiteAppDAO;
import com.joaquinadental.siteapp.Exception.UnAuthorisedUserException;
import com.joaquinadental.siteapp.bean.EditAppointment;
import com.joaquinadental.siteapp.bean.User;
import com.joaquinadental.siteapp.bean.ViewAppointment;
import com.joaquinadental.siteapp.service.NotificationService;
import com.joaquinadental.siteapp.service.SiteAppService;

@Controller
public class SiteAppController {

	
	@RequestMapping("/Login")
	public ModelAndView validateLogin(
			@RequestParam(value = "email") String email,@RequestParam(value = "password") String password,HttpSession httpSession) {
		System.out.println("In Controller");
		try {
		SiteAppService service = new SiteAppService();
		User user=service.validateLoginCredentials(email,password);
		ModelAndView mv = null;
		
		if(user==null){
			throw new UnAuthorisedUserException();
		}
		httpSession.setAttribute("user", user);
		System.out.println("The user role is "+user.getRole());
		if (user.getRole().equals("D"))
		{
			List<String> list = SiteAppService.viewAppointments();
			List<String> notifications = NotificationService.getGeneralNotifications();
			mv = new ModelAndView("viewAppointments");
			mv.addObject("lists", list);
			mv.addObject("notifications",notifications);
			
		}
		else if (user.getRole().equals("P"))
		{
			List<String> list = SiteAppService.viewPatientComingAppointment(user.getEmail());
			List<String> notifications = NotificationService.getGeneralNotifications();
			 mv = new ModelAndView("PatientLanding");
			System.out.println("notification"+notifications.get(0));
			//mv = new ModelAndView("PL");
			mv.addObject("lists", list);
			mv.addObject("notifications",notifications);
		}
		else 
		{
			String AdminAppt = SiteAppService.admindashappointment();
			List<String> notifications = NotificationService.getGeneralNotifications();
			mv = new ModelAndView("AdminDash");
			System.out.println("Hello");
			mv.addObject("jsondata", AdminAppt);
			mv.addObject("notifications",notifications);
			
				
		}
		return mv;
		
		} catch (UnAuthorisedUserException e) {
			
			ModelAndView mv = new ModelAndView("invalidUser");
			mv.addObject("error","error");
			return mv;
		}
	}
	@RequestMapping("/AdminDash")
	public ModelAndView admindashboard( ) {
		ModelAndView mv = null;
		System.out.println("In Admin Dash");
		String AdminAppt = SiteAppService.admindashappointment();
		List<String> notifications = NotificationService.getGeneralNotifications();
		mv = new ModelAndView("AdminDash");
		System.out.println("Hello");
		mv.addObject("jsondata", AdminAppt);
		mv.addObject("notifications",notifications);
		
			return mv;
		
	}

	

	    @RequestMapping("/admappt")
	    public ModelAndView filterappointment(@RequestParam String docdropdown,@RequestParam String patientid, @RequestParam String val_date_picker ) throws Exception 
	   			{
				ModelAndView mv = null;
				System.out.println("In Admin Dash through admappt");
				String AdminAppt = SiteAppService.searchappointment(patientid,docdropdown,val_date_picker);
				List<String> notifications = NotificationService.getGeneralNotifications();
				mv = new ModelAndView("AdminDash");
				System.out.println("Going to call admin dash with new json");
				mv.addObject("jsondata", AdminAppt);
				mv.addObject("notifications",notifications);
				return mv;
	
		}
	    
	    @RequestMapping("/BookAppointmentAdmin")
	    public ModelAndView addappt( ) {
			ModelAndView mv = null;
			System.out.println("First time add");
			String status="";
			List<String> notifications = NotificationService.getGeneralNotifications();
			mv = new ModelAndView("BookAppointment");
			System.out.println("Ready for add for first time");
			mv.addObject("statusmsg", status);
			mv.addObject("notifications",notifications);
				return mv;
			
		}
	    @RequestMapping("/bookappt")
	    public ModelAndView filterappointment(@RequestParam String patientid,@RequestParam String patfirst_name, @RequestParam String patlast_name , @RequestParam String doctor_name, @RequestParam String appoint_date,@RequestParam String hours) throws Exception 
	   			{
				ModelAndView mv = null;
				System.out.println("In bookappt add");
				String status = SiteAppService.addappointment(patientid,patfirst_name,patlast_name, doctor_name, appoint_date, hours);
				List<String> notifications = NotificationService.getGeneralNotifications();
				mv = new ModelAndView("BookAppointment");
				System.out.println("Going to display message in add appointment");
				System.out.println(status);
				mv.addObject("statusmsg", status);
				mv.addObject("notifications",notifications);
				return mv;
	
		}
	 
	    @RequestMapping("/EditAppointment")
		   public ModelAndView editappt(@RequestParam String h_appt_id,@RequestParam String h_pat_name, @RequestParam String h_doc_name , @RequestParam String h_appt_date, @RequestParam String h_appt_hrs)
		   {
			ModelAndView mv = null;
				System.out.println("First time edit");
				EditAppointment ea=SiteAppService.editappointment(h_appt_id,h_pat_name, h_doc_name , h_appt_date, h_appt_hrs);
				List<String> notifications = NotificationService.getGeneralNotifications();
				mv = new ModelAndView("EditAppointment");
				System.out.println("Ready for edit for first time");
				System.out.println(h_doc_name);
				mv.addObject("Editlist",ea );
				mv.addObject("notifications",notifications);
					return mv;
				
			}
	    
	    @RequestMapping("/updappt")
	    public ModelAndView update(HttpServletRequest request)
	   			{
				ModelAndView mv = null;
				//String name = (String)request.getAttribute("doctor_name");
				String doctor_name= request.getParameter("doctor_name");
				String appoint_date= request.getParameter("appoint_date");
				String hours=request.getParameter("hours");
				String appt_id=request.getParameter("appt_id");
				
				System.out.println("In upd appt ");
				String status = SiteAppService.updappointment(appt_id, doctor_name, appoint_date, hours);
				List<String> notifications = NotificationService.getGeneralNotifications();
				mv = new ModelAndView("EditAppointment");
				System.out.println("Going to display message in edit appointment");
				System.out.println(status);
				mv.addObject("statusmsg", status);
				mv.addObject("notifications",notifications);
				return mv;
	
		}
	 
	    @RequestMapping("/CancelAppointment")
	    public ModelAndView cancelappointment(HttpServletRequest request) throws Exception 
	   			{
				ModelAndView mv = null;
				System.out.println("In delete appt ");
				String h_appt_id= request.getParameter("h_appt_id");
				System.out.println(h_appt_id);
				String status = SiteAppDAO.cancelappointment(h_appt_id);
				String AdminAppt = SiteAppService.admindashappointment();
				List<String> notifications = NotificationService.getGeneralNotifications();
				mv = new ModelAndView("AdminDash");
				System.out.println("Cancelled Hello");
				mv.addObject("jsondata", AdminAppt);
				mv.addObject("notifications",notifications);
				mv.addObject("statusmsg",status);
				return mv;
				
	   			}
	    
	    @RequestMapping("/Checkin")
	    public ModelAndView checin1()
	   			{
				ModelAndView mv = null;
				System.out.println("In delete appt ");
				
				mv = new ModelAndView("Checkin");
				System.out.println("Going to display message in cancel appointment");
				
				
				return mv;
				
	   			}
	    
	@RequestMapping("/BookAppointment")
	public ModelAndView bookAppointment ()
	{
		System.out.println("Inside Book Appointment");
		SiteAppService service = new SiteAppService();
		String button_value ;
		ModelAndView mv = null;
		return mv;
	}
	
	@RequestMapping("/AccountDetails")
	public ModelAndView accountDetails ()
	{
		System.out.println("Inside Account Details");
		SiteAppService service = new SiteAppService();
		String button_value ;
		ModelAndView mv = null;
		return mv;
	}
	

}
