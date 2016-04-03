package com.joaquinadental.siteapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.joaquinadental.siteapp.form.User;

@Controller
public class SiteAppController {

	 
	@RequestMapping("/login")
	public ModelAndView validateLogin(
			@RequestParam(value = "email") String email,@RequestParam(value = "password") String password) {
		System.out.println("In Controller");
 
		ModelAndView mv = new ModelAndView("home","command",new User());
		return mv;
	}
	

}
