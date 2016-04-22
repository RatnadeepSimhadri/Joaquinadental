package com.joaquinadental.siteapp.bean;

import java.sql.*;

public class ViewAppointment {
	private String patientFirstName;
	private String patientLastName;
	private Time appointment_time;
	// added by jd
	private String dentistFirstName;
	private String dentistLastName;
	private Date appointment_Date;
	//added by sairam
	private int appointment_id;
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
	
	// added by jd
	public String getDentistFirstName() {
		return dentistFirstName;
	}
	public void setDentistFirstName(String dentistFirstName) {
		this.dentistFirstName = dentistFirstName;
	}
	
	public String getDentistLastName() {
		return dentistLastName;
	}
	public void setDentistLastName(String dentistLastName) {
		this.dentistLastName = dentistLastName;
	}
	
	public Date getAppointmentDate() {
		return appointment_Date;
	}
	public void setAppointmentDate(Date appointment_Date) {
		this.appointment_Date = appointment_Date;
	}
	public int getAppointment_id() {
		return appointment_id;
	}
	public void setAppointment_id(int appointment_id) {
		this.appointment_id = appointment_id;
	}
	
}
