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

import com.joaquinadental.siteapp.bean.AdminAppointment;
import com.joaquinadental.siteapp.bean.User;
import com.joaquinadental.siteapp.bean.ViewAppointment;
public class SiteAppDAO {

	/* Database Access Parameters */
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://us-cdbr-iron-east-03.cleardb.net:3306/heroku_012e9bf5c5bf6e6";

	/* Database Credentials */
	static final String USER = "bc0e2f97ace092";
	static final String PASS = "02272043";
	//private static final String "" = null;

	public static List<ViewAppointment> viewAppointments(String email) {

		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		List<ViewAppointment>list = new ArrayList<ViewAppointment>();
		Integer docter_id=1;
		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			String Appointmetnssql = _VIEW_APPOINTMENTS;
			String sql = "select dentist_id from dentist where upper(dentist_email)='"+email.toUpperCase()+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				docter_id = rs.getInt(1);
			}
			pstmt = conn.prepareStatement(Appointmetnssql);
			pstmt.setInt(1, docter_id);
			ResultSet prs = pstmt.executeQuery();
			while(prs.next()){
				
				String patient_first_name  = prs.getString(1);
				String patient_last_name = prs.getString(2);
				Time appointment_time = prs.getTime(3);
			
				
				ViewAppointment app = new ViewAppointment();
				app.setPatientFirstName(patient_first_name);
				app.setPatientLastName(patient_last_name);
				app.setAppointment_time(appointment_time);
			
				
				list.add(app);
				
			
			}
			prs.close();
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
	
	
	//Sairam's method to get all of today's appointments
	
	public static List<ViewAppointment> todayappointment ()
	{
		Connection conn = null;
		Statement stmt = null;
		List<ViewAppointment>list = new ArrayList<ViewAppointment>();
		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			String sql;
			System.out.println("executing the today appointment query");
			sql = "select  p.patient_first_name,  p.Patient_Last_Name, a.Appointment_ID, a.Appointment_Time ,a.appointment_date, d.dentist_first_name , d.dentist_Last_name from patient p , appointment a , dentist d where p.Patient_ID=a.Patient_ID and a.dentist_id = d.dentist_id and Appointment_Date = '2006-01-02'";
			ResultSet rs = stmt.executeQuery(sql);
			System.out.println("executed the today appointment query");
			while(rs.next()){
				System.out.println("inside today appointment rs");
		
				String patient_first_name  = rs.getString(1);
				String patient_last_name = rs.getString(2);
				int appointment_id=rs.getInt(3);
				Time appointment_time = rs.getTime(4);
				Date appointment_date = rs.getDate(5);
				String dentist_first_name = rs.getString(6);
				String dentist_last_name = rs.getString(7);
				//System.out.println("appointment details "+patient_first_name +" "+patient_last_name
				//		+" " +appointment_time + " " +dentist_first_name + " "+ dentist_last_name+
				//		" " + appointment_date);
				
				
				ViewAppointment tapp = new ViewAppointment();
				tapp.setAppointment_id(appointment_id);
				tapp.setPatientFirstName(patient_first_name);
				tapp.setPatientLastName(patient_last_name);
				tapp.setAppointment_time(appointment_time);
				tapp.setAppointmentDate(appointment_date);
				tapp.setDentistFirstName(dentist_first_name);
				tapp.setDentistLastName(dentist_last_name);
			
				
				list.add(tapp);
				
			
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


	public static List<AdminAppointment> updatedappointment(String patientid, String docdropdown, String reformattedStr) {
		// TODO Auto-generated method stub
		Connection conn = null;
		Statement stmt = null;
		List<AdminAppointment>list = new ArrayList<AdminAppointment>();
		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			String sql;
			String firstname="";
			String lastname="";
			System.out.println(docdropdown);
			if(docdropdown!="")
			{
			String[] docnames = docdropdown.split(" ");
			firstname=docnames[0];
			lastname=docnames[1];
			}	
			
			System.out.println("executing the updated appointment query");
			if(patientid=="")
			   {
				 if(docdropdown=="")
				   {
					if(reformattedStr=="")
					{
						return null;
					}
					else
					{
						System.out.println("Testing testing testing 3");
						sql = "select  p.patient_first_name,  p.Patient_Last_Name, a.Appointment_ID, a.Appointment_Time ,a.appointment_date, d.dentist_first_name , d.dentist_Last_name from patient p , appointment a , dentist d where p.Patient_ID=a.Patient_ID and a.dentist_id = d.dentist_id and a.Appointment_Date= '" + reformattedStr + "'";
				    }
				   }
				 else if(reformattedStr=="")
				   {
					 System.out.println("Testing testing testing 4");
					 sql = "select  p.patient_first_name,  p.Patient_Last_Name, a.Appointment_ID, a.Appointment_Time ,a.appointment_date, d.dentist_first_name , d.dentist_Last_name from patient p , appointment a , dentist d where p.Patient_ID=a.Patient_ID and a.dentist_id = d.dentist_id and d.dentist_first_name='" + firstname+ "'" + "and d.dentist_Last_name='" + lastname + "'";
				   }
				 else{
					 System.out.println("Testing testing testing 5");
					 sql = "select  p.patient_first_name,  p.Patient_Last_Name, a.Appointment_ID, a.Appointment_Time ,a.appointment_date, d.dentist_first_name , d.dentist_Last_name from patient p , appointment a , dentist d where p.Patient_ID=a.Patient_ID and a.dentist_id = d.dentist_id and d.dentist_first_name='" + firstname+ "'" + "and d.dentist_Last_name='" + lastname + "'" + "and a.Appointment_Date= '" + reformattedStr + "'";
				  }
			   }
			else if(docdropdown=="")
			 {
				if(reformattedStr=="")
				 {
					System.out.println("Testing testing testing 6");
					sql = "select  p.patient_first_name,  p.Patient_Last_Name, a.Appointment_ID, a.Appointment_Time ,a.appointment_date, d.dentist_first_name , d.dentist_Last_name from patient p , appointment a , dentist d where p.Patient_ID=a.Patient_ID and a.dentist_id = d.dentist_id and p.Patient_ID=" + patientid + "";
				 }
				else
				{
					System.out.println("Testing testing testing 9");
					sql = "select  p.patient_first_name,  p.Patient_Last_Name, a.Appointment_ID, a.Appointment_Time ,a.appointment_date, d.dentist_first_name , d.dentist_Last_name from patient p , appointment a , dentist d where p.Patient_ID=a.Patient_ID and a.dentist_id = d.dentist_id and p.Patient_ID=" + patientid + "and a.Appointment_Date= '" + reformattedStr + "'";
				}
			   }
			else
			{
				if(reformattedStr=="")
				{
					System.out.println("Testing testing testing 7");
					sql = "select  p.patient_first_name,  p.Patient_Last_Name, a.Appointment_ID, a.Appointment_Time ,a.appointment_date, d.dentist_first_name , d.dentist_Last_name from patient p , appointment a , dentist d where p.Patient_ID=a.Patient_ID and a.dentist_id = d.dentist_id and p.Patient_ID=" + patientid + " and d.dentist_first_name='" + firstname+ "' and d.dentist_Last_name='" + lastname + "'";	
				}
				else
				{
					System.out.println("Testing testing testing 8");
					sql = "select  p.patient_first_name,  p.Patient_Last_Name, a.Appointment_ID, a.Appointment_Time ,a.appointment_date, d.dentist_first_name , d.dentist_Last_name from patient p , appointment a , dentist d where p.Patient_ID=a.Patient_ID and a.dentist_id = d.dentist_id and p.Patient_ID=" + patientid + "and d.dentist_first_name='" + firstname+ "'" + "and d.dentist_Last_name='" + lastname + "'" + "and a.Appointment_Date= '" + reformattedStr + "'";
				}
			}
			
			ResultSet rs = stmt.executeQuery(sql);
			System.out.println("executed the updated appointment query");
			while(rs.next()){
				System.out.println("inside updated appointment rs");
		
				String patient_first_name  = rs.getString(1);
				String patient_last_name = rs.getString(2);
				int appointment_id=rs.getInt(3);
				Time appointment_time = rs.getTime(4);
				Date appointment_date = rs.getDate(5);
				String dentist_first_name = rs.getString(6);
				String dentist_last_name = rs.getString(7);
				System.out.println("new appointment details "+patient_first_name +" "+patient_last_name
						+" " +appointment_time + " " +dentist_first_name + " "+ dentist_last_name+
						" " + appointment_date);
				
				
				AdminAppointment Adapp = new AdminAppointment();
				String patientName = patient_first_name + " " +patient_last_name;
				System.out.println("Printing Name");
				System.out.println(patientName);
				String dentistName = dentist_first_name + " " +dentist_last_name;
				Adapp.setAppointment_id(appointment_id);
				Adapp.setPatientName(patientName);
				Adapp.setAppointment_time(appointment_time);
				Adapp.setAppointment_Date(appointment_date);
				Adapp.setDentistName(dentistName);
				
			
				list.add(Adapp);
				
			
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


	public static String addappointment(String patientid, String firstname,
			String lastname, String appoint_date, String appoint_time) {
		
		String status=" <B> Appointment Booked - We're looking forward to serving you </B>";
		Connection conn = null;
		Statement stmt = null;
		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			String dentist_id="";
			System.out.println(lastname);
			System.out.println(firstname);
			String sql="select dentist_id from dentist where Dentist_First_Name='"+firstname+"' and Dentist_Last_Name='"+lastname+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				System.out.println("get dentist id");
				dentist_id  = rs.getString(1);
				System.out.println(dentist_id);
			}
			sql = "INSERT INTO Appointment(Dentist_ID,Patient_ID,Appointment_Date,Appointment_Time) VALUES ("+dentist_id+","+patientid+","+"'"+appoint_date+"','"+appoint_time+"')";
			stmt.executeUpdate(sql);		
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
		return status;
	}


	public static String updappointment(String appt_id, String firstname,
			String lastname, String reformattedStr, String appoint_time) {
		
		
		String status=" <B> Appointment Changed - We're looking forward to serving you </B>";
		Connection conn = null;
		Statement stmt = null;
		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			String dentist_id="";
			String sql="select dentist_id from dentist where Dentist_First_Name='" +firstname+ "' and Dentist_Last_Name='" + lastname+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				System.out.println("get dentist id");
				dentist_id  = rs.getString(1);
			}
		
			sql = "UPDATE Appointment SET dentist_id=" + dentist_id + ", appointment_date='" +reformattedStr + "', appointment_time='"+ appoint_time + "' where appointment_id= " + appt_id;
			stmt.executeUpdate(sql);		
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
		return status;
	}


	public static String cancelappointment(String h_appt_id) {

		String status="Appointment Deleted";
		Connection conn = null;
		Statement stmt = null;
		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			
			String sql="delete from appointment where appointment_id=" + h_appt_id + "";
			ResultSet rs = stmt.executeQuery(sql);
			
		
			
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
		return status;
		
		
	}

	}
	
	
	
	

