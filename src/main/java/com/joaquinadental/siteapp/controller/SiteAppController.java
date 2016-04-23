package com.joaquinadental.siteapp.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.joaquinadental.siteapp.DAO.SiteAppDAO;
import com.joaquinadental.siteapp.Exception.UnAuthorisedUserException;
import com.joaquinadental.siteapp.bean.EditAppointment;
import com.joaquinadental.siteapp.bean.PatientVisit;
import com.joaquinadental.siteapp.bean.User;
import com.joaquinadental.siteapp.bean.ViewAppointment;
import com.joaquinadental.siteapp.service.NotificationService;
import com.joaquinadental.siteapp.service.SiteAppService;

@Controller
public class SiteAppController {

	
	@RequestMapping("/Login")
	public ModelAndView validateLogin(
			@RequestParam(value = "email") String email,@RequestParam(value = "password") String password,HttpSession session) {
		System.out.println("In Controller");
		try {
		SiteAppService service = new SiteAppService();
		User user=service.validateLoginCredentials(email,password);
		ModelAndView mv = null;
		
		if(user==null){
			throw new UnAuthorisedUserException();
		}
		session.setAttribute("user", user);
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
			// mv = new ModelAndView("PL");
			
			mv.addObject("lists", list);
			mv.addObject("notifications",notifications);
		}
		else 
		{
			mv = new ModelAndView("AdminDash");
		}
		return mv;
		
		} catch (UnAuthorisedUserException e) {
			
			ModelAndView mv = new ModelAndView("invalidUser");
			mv.addObject("error","error");
			return mv;
		}
	}
	@RequestMapping("/AdminDash")
	// merge this code with the login method sairam
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
			
				mv = new ModelAndView("AdminDash");
				System.out.println("Going to call admin dash with new json");
				mv.addObject("jsondata", AdminAppt);
				return mv;
	
		}
	    
	    @RequestMapping("/BookAppointmentAdmin")
	    public ModelAndView addappt( ) {
			ModelAndView mv = null;
			System.out.println("First time add");
			String status="";
			mv = new ModelAndView("BookAppointment");
			System.out.println("Ready for add for first time");
			mv.addObject("statusmsg", status);
				return mv;
			
		}
	    @RequestMapping("/bookappt")
	    public ModelAndView filterappointment(@RequestParam String patientid,@RequestParam String patfirst_name, @RequestParam String patlast_name , @RequestParam String doctor_name, @RequestParam String appoint_date,@RequestParam String hours,@RequestParam String mins ) throws Exception 
	   			{
				ModelAndView mv = null;
				System.out.println("In bookappt add");
				String status = SiteAppService.addappointment(patientid,patfirst_name,patlast_name, doctor_name, appoint_date, hours,mins);
				mv = new ModelAndView("BookAppointment");
				System.out.println("Going to display message in add appointment");
				System.out.println(status);
				mv.addObject("statusmsg", status);
				return mv;
	
		}
	 
	    @RequestMapping("/EditAppointment")
		   public ModelAndView editappt(@RequestParam String h_appt_id,@RequestParam String h_pat_name, @RequestParam String h_doc_name , @RequestParam String h_appt_date, @RequestParam String h_appt_hrs,@RequestParam String h_appt_mins)
		   {
			ModelAndView mv = null;
				System.out.println("First time edit");
				EditAppointment ea=SiteAppService.editappointment(h_appt_id,h_pat_name, h_doc_name , h_appt_date, h_appt_hrs,h_appt_mins);
				mv = new ModelAndView("EditAppointment");
			System.out.println("Ready for edit for first time");
				System.out.println(h_doc_name);
				mv.addObject("Editlist",ea );
					return mv;
				
			}
	    
	    @RequestMapping("/updappt")
	    public ModelAndView updateappointment(@RequestParam String appt_id, @RequestParam String patientname,@RequestParam String doctor_name, @RequestParam String appoint_date,@RequestParam String hours,@RequestParam String mins ) throws Exception 
	   			{
				ModelAndView mv = null;
				System.out.println("In upd appt ");
				String status = SiteAppService.updappointment(appt_id, doctor_name, appoint_date, hours,mins);
				mv = new ModelAndView("EditAppointment");
				System.out.println("Going to display message in edit appointment");
				System.out.println(status);
				mv.addObject("statusmsg", status);
				return mv;
	
		}
	 
	    @RequestMapping("/CancelAppointment")
	    public ModelAndView cancelappointment(@RequestParam String h_appt_id) throws Exception 
	   			{
				ModelAndView mv = null;
				System.out.println("In delete appt ");
				String status = SiteAppDAO.cancelappointment(h_appt_id);
				mv = new ModelAndView("AdminDash");
				System.out.println("Going to display message in cancel appointment");
				System.out.println(status);
				mv.addObject("statusmsg", status);
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
	    // jd functions
	@RequestMapping("/BookAppointment")
	public ModelAndView bookAppointment ()
	{
		System.out.println("Inside Book Appointment");
		//SiteAppService service = new SiteAppService();
		List<String> notifications = NotificationService.getGeneralNotifications();
		ModelAndView mv = new ModelAndView("BookAppointmentPatient");
			mv.addObject("notifications",notifications);
				return mv;
	}
	

	@RequestMapping("/PatientLanding")
	public ModelAndView patientLanding(HttpSession session)
	{
		ModelAndView mv = new ModelAndView ("PatientLanding");
		User user =  (User) session.getAttribute("user");
			List<String> list = SiteAppService.viewPatientComingAppointment(user.getEmail());
		List<String> notifications = NotificationService.getGeneralNotifications();
		mv.addObject("lists", list);
		mv.addObject("notifications",notifications);
		
		return mv;
	}

	
	@RequestMapping("/SubmitPatientAppointment")
	public ModelAndView submitPatientApointment(HttpServletRequest request , HttpSession session) throws Exception
	{
		ModelAndView mv = new ModelAndView ();
		String date = request.getParameter("datepicker");
		String patientemail = request.getParameter("patientemail");
		String hours = request.getParameter("hours");
		String doctor = request.getParameter("doctor_name");
		System.out.println("------"+date+"---"+patientemail+"---"+hours+"---"+doctor);
		String status = SiteAppService.addPatientAppointment(patientemail, doctor, date, hours);
		System.out.println("Status is"+ status);
		if (status.equals("true"))
		{

			mv.addObject("status","Appointment booked successfully.");
			
		}
		else 
		{
			mv.addObject("status","Oops Unable to book appointment. Please contact admin for details.")	;
		
			
		}
		User user =  (User) session.getAttribute("user");
		List<String> list = SiteAppService.viewPatientComingAppointment(user.getEmail());
		List<String> notifications = NotificationService.getGeneralNotifications();
		mv.addObject("list",list);
		mv.addObject("notifications",notifications);
		mv.setViewName("PatientLanding");
				return mv;
	}
	
	
	// jd account detail method
	@RequestMapping("/AccountDetails")
	public static ModelAndView getAccountDetails(HttpSession session)
	{ ModelAndView mv = new ModelAndView();
	User user =  (User) session.getAttribute("user");
	int balance = SiteAppService.getAccountBalance(user.getEmail());
	System.out.println("Balance is "+balance);
	mv.addObject("balance",balance);
	List<String> patientVisitList = new ArrayList<String>();
	patientVisitList = SiteAppService.getPatientVisitDetails(user.getEmail());

	mv.addObject("list",patientVisitList);
	List<String> notifications = NotificationService.getGeneralNotifications();
	mv.addObject("notifications",notifications);
	mv.setViewName("PatientAccountDetails");
	
	return mv;
		
	}
	
}
