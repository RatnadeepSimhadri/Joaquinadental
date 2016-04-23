package com.joaquinadental.siteapp.service;

import com.joaquinadental.siteapp.DAO.CreateAccountDAO;
import com.joaquinadental.siteapp.bean.Patient;

public class CreateAccountService {

	
	public boolean savePatient(Patient patient){
		return CreateAccountDAO.saveProfile(patient);
	}
}
