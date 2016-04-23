package com.joaquinadental.siteapp.bean;



public class EditAppointment {

	private String appointment_id;
	private String patientName;
	private String dentistName;
	private String appointment_Date;
	private String hours;
	
	
	
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	public String getAppointment_id() {
		return appointment_id;
	}
	public void setAppointment_id(String appointment_id) {
		this.appointment_id = appointment_id;
	}
	public String getdentistName() {
		return dentistName;
	}
	public void setDentistName(String dentistName) {
		this.dentistName = dentistName;
	}
	public String getAppointment_Date() {
		return appointment_Date;
	}
	public void setAppointment_Date(String appointment_Date) {
		this.appointment_Date = appointment_Date;
	}
	
	public String getHours() {
		return hours;
	}
	public void setHours(String hours) {
		this.hours = hours;
	}

}
	
	
