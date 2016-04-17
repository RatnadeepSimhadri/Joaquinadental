package com.joaquinadental.siteapp.util;

public class DBConstants {
	
public static String _VIEW_APPOINTMENTS= "select p.patient_first_name, p.Patient_Last_Name,a.Appointment_Time from patient p , appointment a where p.Patient_ID=a.Patient_ID and Dentist_ID = 1 and Appointment_Date='2006-01-02'";
public static String _GET_USERS= "select user_emailid, user_pwd, user_type from users where user_emailid=? and user_pwd=?";
public static String _GET_GENERAL_NOTIFICATION = "select notification_text from notification_all where Notification_End_Date > curdate()";

}
