package com.joaquinadental.siteapp.DAO;
import static com.joaquinadental.siteapp.util.DBConstants._GET_USERS;
import static com.joaquinadental.siteapp.util.DBConstants._VIEW_APPOINTMENTS;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import com.joaquinadental.siteapp.bean.User;
import com.joaquinadental.siteapp.bean.ViewAppointment;
public class SiteAppDAO {

	/* Database Access Parameters */
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://us-cdbr-iron-east-03.cleardb.net:3306/heroku_012e9bf5c5bf6e6";

	/* Database Credentials */
	static final String USER = "bc0e2f97ace092";
	static final String PASS = "02272043";

	public static List<ViewAppointment> viewAppointments() {

		Connection conn = null;
		Statement stmt = null;
		List<ViewAppointment>list = new ArrayList<ViewAppointment>();
		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			String sql;
			sql = _VIEW_APPOINTMENTS;
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				
				String patient_first_name  = rs.getString(1);
				String patient_last_name = rs.getString(2);
				Time appointment_time = rs.getTime(3);
			
				
				ViewAppointment app = new ViewAppointment();
				app.setPatientFirstName(patient_first_name);
				app.setPatientLastName(patient_last_name);
				app.setAppointment_time(appointment_time);
			
				
				list.add(app);
				
			
			}
			
			rs.close();
			stmt.close();
			conn.close();
		}catch(SQLException se){
			se.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(stmt!=null)
					stmt.close();
			}catch(SQLException se2){
			}
			try{
				if(conn!=null)
					conn.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
		return list;
	}
	
	
	public static List<User> getUsers(String email, String password) {

		Connection conn = null;
		PreparedStatement stmt = null;
		List<User>list = new ArrayList<User>();
		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.prepareStatement(_GET_USERS);
			stmt.setString(1, email);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){
				
				String u_email  = rs.getString(1);
				String u_password = rs.getString(2);
				String role = rs.getString(3);
			
				
				User user = new User();
				user.setEmail(u_email);
				user.setPassword(u_password);
				user.setRole(role);
			
				
				list.add(user);
				
			
			}
			
			rs.close();
			stmt.close();
			conn.close();
		}catch(SQLException se){
			se.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(stmt!=null)
					stmt.close();
			}catch(SQLException se2){
			}
			try{
				if(conn!=null)
					conn.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
		return list;
	}

// JD method to get appointment for a patient 
	public static List<ViewAppointment> viewPatientComingAppointment (String useremail)
	{
		Connection conn = null;
		Statement stmt = null;
		List<ViewAppointment>list = new ArrayList<ViewAppointment>();
		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			String sql;
			System.out.println("executing the query");
			sql = "select  p.patient_first_name,  p.Patient_Last_Name, a.Appointment_Time ,a.appointment_date, d.dentist_first_name , d.dentist_Last_name from patient p , appointment a , dentist d where p.Patient_ID=a.Patient_ID and a.dentist_id = d.dentist_id and PATIENT_EMAIL = '"+ useremail+"' and Appointment_Date >= curdate();";
			ResultSet rs = stmt.executeQuery(sql);
			System.out.println("executed the query");
			while(rs.next()){
				System.out.println("inside rs");
		
				String patient_first_name  = rs.getString(1);
				String patient_last_name = rs.getString(2);
				Time appointment_time = rs.getTime(3);
				Date appointment_date = rs.getDate(4);
				String dentist_first_name = rs.getString(5);
				String dentist_last_name = rs.getString(6);
				System.out.println("appointment details "+patient_first_name +" "+patient_last_name
						+" " +appointment_time + " " +dentist_first_name + " "+ dentist_last_name+
						" " + appointment_date);
				
				
				ViewAppointment app = new ViewAppointment();
				app.setPatientFirstName(patient_first_name);
				app.setPatientLastName(patient_last_name);
				app.setAppointment_time(appointment_time);
				app.setAppointmentDate(appointment_date);
				app.setDentistFirstName(dentist_first_name);
				app.setDentistLastName(dentist_last_name);
			
				
				list.add(app);
				
			
			}
			
			rs.close();
			stmt.close();
			conn.close();
		}catch(SQLException se){
			se.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(stmt!=null)
					stmt.close();
			}catch(SQLException se2){
			}
			try{
				if(conn!=null)
					conn.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
		return list;
	}
	}
	

