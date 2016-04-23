package com.joaquinadental.siteapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
			mv = new ModelAndView("PatientLanding");
			mv.addObject("lists", list);
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
	

}
