package com.joaquinadental.siteapp.bean;

import java.sql.*;

public class AdminAppointment {
	private int appointment_id;
	private String patientName;
	private String dentistName;
	private Date appointment_Date;
	private Time appointment_time;
	
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	public int getAppointment_id() {
		return appointment_id;
	}
	public void setAppointment_id(int appointment_id) {
		this.appointment_id = appointment_id;
	}
	public String getDentistName() {
		return dentistName;
	}
	public void setDentistName(String dentistName) {
		this.dentistName = dentistName;
	}
	public Date getAppointment_Date() {
		return appointment_Date;
	}
	public void setAppointment_Date(Date appointment_Date) {
		this.appointment_Date = appointment_Date;
	}
	public Time getAppointment_time() {
		return appointment_time;
	}
	public void setAppointment_time(Time appointment_time) {
		this.appointment_time = appointment_time;
	}
	
}
	
	