package com.joaquinadental.siteapp.controller;

import java.util.List;

import org.apache.catalina.connector.Request;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.joaquinadental.siteapp.Exception.UnAuthorisedUserException;
import com.joaquinadental.siteapp.bean.User;
import com.joaquinadental.siteapp.bean.ViewAppointment;
import com.joaquinadental.siteapp.service.NotificationService;
import com.joaquinadental.siteapp.service.SiteAppService;

@Controller
public class SiteAppController {

	 
	@RequestMapping("/Login")
	public ModelAndView validateLogin(
			@RequestParam(value = "email") String email,@RequestParam(value = "password") String password) {
		System.out.println("In Controller");
		try {
		SiteAppService service = new SiteAppService();
		User user=service.validateLoginCredentials(email,password);
		ModelAndView mv = null;
		
		if(user==null){
			throw new UnAuthorisedUserException();
		}

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
			mv = new ModelAndView("AdminDash");
		}
		return mv;
		
		} catch (UnAuthorisedUserException e) {
			
			ModelAndView mv = new ModelAndView("invalidUser");
			mv.addObject("error","error");
			return mv;
		}
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
