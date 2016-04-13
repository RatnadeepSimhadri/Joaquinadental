package com.joaquinadental.siteapp.util;

public class DBConstants {
	
public static String _VIEW_APPOINTMENTS= "select p.patient_first_name, p.Patient_Last_Name,a.Appointment_Time from patient p , appointment a where p.Patient_ID=a.Patient_ID and Dentist_ID = 1 and Appointment_Date='2006-01-02'";

}
