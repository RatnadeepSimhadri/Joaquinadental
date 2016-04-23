package com.joaquinadental.siteapp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.joaquinadental.siteapp.bean.Patient;
import com.joaquinadental.siteapp.service.CreateAccountService;

@Controller
public class CreateAccountController {

	 
	@RequestMapping("/createAccount")
	public ModelAndView createAccount(Model model,HttpSession httpSession) {
		System.out.println("In createAccount Controller");
		
		Patient patient=(Patient)httpSession.getAttribute("patientobj");
		try {
			if(patient==null){
			 patient =new Patient();
			}
			ModelAndView mv =null;
			mv = new ModelAndView("userRegistration","command",patient);
			httpSession.setAttribute("patientobj", patient);
			model.addAttribute("patient", patient);
		return mv;
		
		} catch (Exception e) {
			ModelAndView mv =null;
			mv = new ModelAndView("invalidUser");
			mv.addObject("error","error");
			return mv;
		}
	}
	
	@RequestMapping("/getContactForm")
	public ModelAndView getContactForm(@ModelAttribute("patient") Patient patient,Model model,HttpSession httpSession) {
		System.out.println("In createAccount Controller");
		ModelAndView mv =null;
		Patient patientSession=(Patient)httpSession.getAttribute("patientobj");
		try {
			if(patientSession==null){
				patientSession = new Patient();
			}
			populateForm(patientSession,patient,"fillPersonalDetails");
			mv = new ModelAndView("contactDetails");
			httpSession.setAttribute("patientobj", patientSession);
			model.addAttribute("patient", patient);
		
		return mv;
		
		} catch (Exception e) {
			
			mv = new ModelAndView("invalidUser");
			mv.addObject("error","error");
			return mv;
		}
	}
	
	@RequestMapping("/getLoginForm")
	public ModelAndView getLoginForm(@ModelAttribute("patient") Patient patient, Model model,HttpSession httpSession) {
		System.out.println("In createAccount Controller");
		ModelAndView mv =null;
		Patient patientSession=(Patient)httpSession.getAttribute("patientobj");
		try {
			if(patientSession==null){
				patientSession = new Patient();
			}
			populateForm(patientSession,patient,"fillContactDetails");
			mv = new ModelAndView("loginDetails");
			model.addAttribute("patient", patient);
			httpSession.setAttribute("patientobj", patientSession);
		return mv;
		
		} catch (Exception e) {
			
			mv = new ModelAndView("invalidUser");
			mv.addObject("error","error");
			return mv;
		}
	}
	
	@RequestMapping("/savePatient")
	public ModelAndView savePatient(@ModelAttribute("patient") Patient patient, Model model,HttpSession httpSession) {
		System.out.println("In Save Patient");
		ModelAndView mv =null;
		Patient patientSession=(Patient)httpSession.getAttribute("patientobj");
		try {
			if(patientSession==null){
				patientSession = new Patient();
			}
			populateForm(patientSession,patient,"savePatient");
			//mv = new ModelAndView("loginDetails");
			CreateAccountService service = new CreateAccountService();
			boolean status = service.savePatient(patientSession);
			if(status){
			mv = new ModelAndView("savePatient");
			}
		return mv;
		
		} catch (Exception e) {
			
			mv = new ModelAndView("invalidUser");
			mv.addObject("error","error");
			return mv;
		}
	}
	
	
	private void populateForm (Patient patientSession, Patient requestPatient,String flow){
		if(flow.equalsIgnoreCase("fillPersonalDetails")){
		patientSession.setFirstName(requestPatient.getFirstName());
		patientSession.setLastName(requestPatient.getLastName());
		patientSession.setMiddleName(requestPatient.getMiddleName());
		patientSession.setDob(requestPatient.getDob());
		patientSession.setMinor(requestPatient.getMinor());
		patientSession.setAlergies(requestPatient.getAlergies());
		patientSession.setHeadOfHouse(requestPatient.getHeadOfHouse());
		patientSession.setSsn(requestPatient.getSsn());
		}
		else if(flow.equalsIgnoreCase("fillContactDetails")){
		patientSession.setStreet(requestPatient.getStreet());
		patientSession.setState(requestPatient.getState());
		patientSession.setCity(requestPatient.getCity());
		patientSession.setZip(requestPatient.getZip());
		patientSession.setPhonePrimary(requestPatient.getPhonePrimary());
		patientSession.setPhoneSecondary(requestPatient.getPhoneSecondary());
		}
		else if(flow.equalsIgnoreCase("savePatient")){
			patientSession.setEmail(requestPatient.getEmail());
			patientSession.setPassword(requestPatient.getPassword());
		}
	}

}
