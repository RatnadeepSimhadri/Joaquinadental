package com.joaquinadental.siteapp.bean;

import java.sql.Time;

public class ViewAppointment {
	public String getPatientFirstName() {
		return patientFirstName;
	}
	public void setPatientFirstName(String patientFirstName) {
		this.patientFirstName = patientFirstName;
	}
	public Time getAppointment_time() {
		return appointment_time;
	}	
	public void setAppointment_time(Time appointment_time) {
		this.appointment_time = appointment_time;
	}
	public String getPatientLastName() {
		return patientLastName;
	}
	public void setPatientLastName(String patientLastName) {
		this.patientLastName = patientLastName;
	}
	private String patientFirstName;
	private String patientLastName;
	private Time appointment_time;
}
