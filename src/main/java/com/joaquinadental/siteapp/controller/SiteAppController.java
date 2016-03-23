package com.joaquinadental.siteapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SiteAppController {
	String message = "Welcome to Joaquina Dental :";
	 
	@RequestMapping("/hello")
	public ModelAndView showMessage(
			@RequestParam(value = "name", required = false, defaultValue = "User") String name) {
		System.out.println("In Controller");
 
		ModelAndView mv = new ModelAndView("hello");
		mv.addObject("message", message);
		mv.addObject("name", name);
		return mv;
	}

}
