package com.joaquinadental.siteapp.bean;

import java.util.Date;

public class Patient {
	private int patientID;
	private int accountID;
	private String firstName;
	private String middleName;
	private String lastName;
	private String street;
	private String city;
	private String state;
	private String zip;
	private String phonePrimary;
	private String phoneSecondary;
	private String ssn;
	private Date dob;
	private boolean minor;
	private String headOfHouse;
	private String email;
	private String password;
	
	public int getPatientID() {
		return patientID;
	}
	public void setPatientID(int patientID) {
		this.patientID = patientID;
	}
	public int getAccountID() {
		return accountID;
	}
	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getPhonePrimary() {
		return phonePrimary;
	}
	public void setPhonePrimary(String phonePrimary) {
		this.phonePrimary = phonePrimary;
	}
	public String getPhoneSecondary() {
		return phoneSecondary;
	}
	public void setPhoneSecondary(String phoneSecondary) {
		this.phoneSecondary = phoneSecondary;
	}
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public boolean isMinor() {
		return minor;
	}
	public void setMinor(boolean minor) {
		this.minor = minor;
	}
	public String getHeadOfHouse() {
		return headOfHouse;
	}
	public void setHeadOfHouse(String headOfHouse) {
		this.headOfHouse = headOfHouse;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
