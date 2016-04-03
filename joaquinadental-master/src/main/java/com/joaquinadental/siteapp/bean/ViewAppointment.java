package com.joaquinadental.siteapp.bean;

import java.sql.Time;

public class ViewAppointment {
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	public Time getAppointment_time() {
		return appointment_time;
	}
	public void setAppointment_time(Time appointment_time) {
		this.appointment_time = appointment_time;
	}
	private String patientName;
	private Time appointment_time;
}
