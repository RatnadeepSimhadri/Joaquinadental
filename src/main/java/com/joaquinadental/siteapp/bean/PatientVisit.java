package com.joaquinadental.siteapp.bean;
import java.sql.*;
public class PatientVisit {

	
	private String dentist ;
	private int visit_id ;
	private int patient_id ;
	private Date visit_date ;
	private Time visit_time;
	
	
	public int getVisitID() {
		return visit_id;
	}
	
	public void setVisitID(int visit_id) {
		this.visit_id = visit_id;
	}

	public String getPatientDentist()
	{
		return this.dentist;
	}
	
	public void setVisitDentist( String dentist)
	{
		this.dentist = dentist;
	}

	public int getPatient_id() {
		return patient_id;
	}
	
	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	}
	
	

	public Date getVisitDate() {
		return visit_date;
	}
	
	public void setVisitDate(Date visit_date) {
		this.visit_date = visit_date;
	}
	
	

	public Time getVisitTime() {
		return visit_time;
	}
	
	public void setVisit_time(Time visit_time) {
		this.visit_time = visit_time;
	}
}
