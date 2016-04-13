package com.joaquinadental.siteapp.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.joaquinadental.siteapp.bean.ViewAppointment;
import com.joaquinadental.siteapp.service.SiteAppService;

@Controller
public class SiteAppController {

	 
	@RequestMapping("/DoctorLogin")
	public ModelAndView validateLogin(
			@RequestParam(value = "email") String email,@RequestParam(value = "password") String password) {
		System.out.println("In Controller");
		List<String> list = SiteAppService.viewAppointments();
		ModelAndView mv = new ModelAndView("viewAppointments","command",new ViewAppointment());
		mv.addObject("lists", list);
		return mv;
	}
	

}
