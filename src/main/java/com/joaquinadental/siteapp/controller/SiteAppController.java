package com.joaquinadental.siteapp.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.joaquinadental.siteapp.DAO.SiteAppDAO;
import com.joaquinadental.siteapp.bean.ViewAppointment;
import com.joaquinadental.siteapp.form.User;

@Controller
public class SiteAppController {

	 
	@RequestMapping("/login")
	public ModelAndView validateLogin(
			@RequestParam(value = "email") String email,@RequestParam(value = "password") String password) {
		System.out.println("In Controller");
		List<ViewAppointment> list = SiteAppDAO.viewAppointments();
		ModelAndView mv = new ModelAndView("viewAppointments","command",new ViewAppointment());
		mv.addObject("lists", list);
		return mv;
	}
	
	private List<String> getList() {

		List<String> list = new ArrayList<String>();
		list.add("List A");
		list.add("List B");
		list.add("List C");
		list.add("List D");
		list.add("List 1");
		list.add("List 2");
		list.add("List 3");

		return list;

	}

}
