package com.joaquinadental.siteapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.joaquinadental.siteapp.bean.Patient;

@Controller
public class CreateAccountController {

	 
	@RequestMapping("/createAccount")
	public ModelAndView createAccount() {
		System.out.println("In createAccount Controller");
		ModelAndView mv =null;
		try {
			Patient patient =new Patient();
			mv = new ModelAndView("userRegistration","command",patient);
		
		return mv;
		
		} catch (Exception e) {
			
			mv = new ModelAndView("invalidUser");
			mv.addObject("error","error");
			return mv;
		}
	}
	
	@RequestMapping("/getContactForm")
	public ModelAndView getContactForm(@ModelAttribute("patient") Patient patient, Model model) {
		System.out.println("In createAccount Controller");
		ModelAndView mv =null;
		try {
			
			System.out.println(patient);
			patient.setLastName("Last Name");
			mv = new ModelAndView("userRegistration");
			model.addAttribute("patient", patient);
		
		return mv;
		
		} catch (Exception e) {
			
			mv = new ModelAndView("invalidUser");
			mv.addObject("error","error");
			return mv;
		}
	}

}
