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
import com.joaquinadental.siteapp.bean.PatientVisit;
import com.joaquinadental.siteapp.bean.Service;
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
	private static final String NULL = null;

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
			System.out.println("executed the query"+sql);
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
	
	
	
	// view patient appointment booking history jd
	
	// JD method to get appointment for a patient 
		public static List<PatientVisit> getPatientVisitHistory (String email)
		{
			Connection conn = null;
			Statement stmt = null;
			int visit_id  = 0;
			Time visit_time = null;
			Date visit_date = null;
			String dentist = null ;
			int patient_id = 0;
						
			List<PatientVisit>list = new ArrayList<PatientVisit>();
			try{
				conn = DriverManager.getConnection(DB_URL,USER,PASS);
				stmt = conn.createStatement();
				String sql = null;
			//	System.out.println("executing the query");
				sql = "select visit_id ,Visit_date,visit_time, Concat (dentist_first_name , ' ',dentist_last_Name ) , p.patient_id from visit v , dentist d , patient p where v.dentist_id = d.dentist_id and v.patient_id = p.patient_id and patient_email='"+email+"' order by visit_date desc limit 5";
				System.out.println("Sql "+sql);
				
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
			//		System.out.println("inside rs");
			
					List<Service> service_list;
					
					 visit_id  = rs.getInt(1);
					visit_date = rs.getDate(2);
					visit_time = rs.getTime(3);
					dentist = rs.getString(4);
					patient_id = rs.getInt(5);
					PatientVisit pv = new PatientVisit();
					service_list = getVisitService(visit_id);
					
					System.out.println("Visit Values"+visit_id+"--"+visit_date+"--"+visit_time+"--"+dentist+"--"+patient_id+"--");
					
					pv.setPatient_id(patient_id);
					pv.setVisitID(visit_id);
					pv.setVisitDate(visit_date);
					pv.setVisit_time(visit_time);
					pv.setVisitDentist(dentist);
					pv.setVisit_service(service_list);
					
					list.add(pv);
					
				
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
	
	
	
	// get service details for a visit
		private static List<Service> getVisitService(int visit_id)
		{
			List<Service> service_list = new ArrayList<Service>();
			Connection conn = null;
			Statement stmt = null;
			try{
				conn = DriverManager.getConnection(DB_URL,USER,PASS);
				stmt = conn.createStatement();
				String sql ="select completed_service_id , s.service_id , visit_id , service_description , service_cost from completed_service c , service s where c.service_id = s.service_id and visit_id="+visit_id;
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next())
				{
					Service service = new Service();
					service.setCompletedServiceId(rs.getInt(1));
					service.setServiceId(rs.getInt(2));
					service.setVisitId(rs.getInt(3));
					service.setServiceDesc(rs.getString(4));
					service.setServiceCost(rs.getInt(5));
					service_list.add(service);
					
				}
				rs.close();
				conn.close();
				stmt.close();
			}
			catch (SQLException se)
			{
				se.printStackTrace();
				
			}
			
			return service_list;
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
			sql = "select  p.patient_first_name,  p.Patient_Last_Name, a.Appointment_ID, a.Appointment_Time ,a.appointment_date, d.dentist_first_name , d.dentist_Last_name from patient p , appointment a , dentist d where p.Patient_ID=a.Patient_ID and a.dentist_id = d.dentist_id and Appointment_Date >= curdate();";
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
			if( docdropdown!=NULL && !docdropdown.equals(""))
			{
			String[] docnames = docdropdown.split(" ");
			firstname=docnames[0];
			lastname=docnames[1];
			}	
			
			System.out.println("executing the updated appointment query");
			if(patientid=="" || patientid==NULL)
			   {
				 if(docdropdown=="" || docdropdown==NULL)
				   {
					if(reformattedStr=="" || reformattedStr==NULL)
					{
						return null;
					}
					else
					{
						System.out.println("Testing testing testing 3");
						sql = "select  p.patient_first_name,  p.Patient_Last_Name, a.Appointment_ID, a.Appointment_Time ,a.appointment_date, d.dentist_first_name , d.dentist_Last_name from patient p , appointment a , dentist d where p.Patient_ID=a.Patient_ID and a.dentist_id = d.dentist_id and a.Appointment_Date= '" + reformattedStr + "'";
				    }
				   }
				 else if(reformattedStr=="" || reformattedStr==NULL)
				   {
					 System.out.println("Testing testing testing 4");
					 sql = "select  p.patient_first_name,  p.Patient_Last_Name, a.Appointment_ID, a.Appointment_Time ,a.appointment_date, d.dentist_first_name , d.dentist_Last_name from patient p , appointment a , dentist d where p.Patient_ID=a.Patient_ID and a.dentist_id = d.dentist_id and d.dentist_first_name='" + firstname+ "'" + "and d.dentist_Last_name='" + lastname + "'";
				   }
				 else{
					 System.out.println("Testing testing testing 5");
					 sql = "select  p.patient_first_name,  p.Patient_Last_Name, a.Appointment_ID, a.Appointment_Time ,a.appointment_date, d.dentist_first_name , d.dentist_Last_name from patient p , appointment a , dentist d where p.Patient_ID=a.Patient_ID and a.dentist_id = d.dentist_id and d.dentist_first_name='" + firstname+ "'" + "and d.dentist_Last_name='" + lastname + "'" + "and a.Appointment_Date= '" + reformattedStr + "'";
				  }
			   }
			else if(docdropdown=="" || docdropdown==NULL)
			 {
				if(reformattedStr=="" || reformattedStr==NULL)
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
				if(reformattedStr=="" || reformattedStr==NULL)
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


	public static String updappointment(String appt_id, String doctor_name,
			 String reformattedStr,String hours) {
		
		
		
		String sql;
		String status=" <B> Appointment Changed - We're looking forward to serving you </B>";
		Connection conn = null;
		Statement stmt = null;
		System.out.println(reformattedStr);
		System.out.println(hours);
		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			if(doctor_name!=NULL)
			{
				String firstname="";
				String lastname="";
				String[] docnames = doctor_name.split(" ");
				firstname=docnames[0];
				lastname=docnames[1];
				String dentist_id="";
				sql="select dentist_id from dentist where Dentist_First_Name='"+firstname+"' and Dentist_Last_Name='"+lastname+"'";
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
					System.out.println("get dentist id");
					dentist_id  = rs.getString(1);
				}
				rs.close();
				System.out.println(dentist_id);
				if(hours==NULL)
				{
					System.out.println("t1");
					sql = "UPDATE Appointment SET dentist_id="+dentist_id+",appointment_date='"+reformattedStr+"' where appointment_id="+appt_id;
				}
				else
				{
					System.out.println("t2");
					String appoint_time= hours + ":" + "00" + ":" + "00";
					sql = "UPDATE Appointment SET dentist_id="+dentist_id+", appointment_date='"+reformattedStr+"', appointment_time='"+appoint_time+"' where appointment_id="+appt_id;
				}
			}
			else
			{
				if(hours==NULL)
				{
					System.out.println("test3");
					sql = "UPDATE Appointment SET appointment_date='"+reformattedStr+"' where appointment_id="+appt_id;
				}
				else
				{
					System.out.println("test 4");
					String appoint_time= hours + ":" + "00" + ":" + "00";
					System.out.println(appt_id);
					System.out.println(appoint_time);
					System.out.println(reformattedStr);
					sql = "UPDATE Appointment SET appointment_date='"+reformattedStr+"', appointment_time='"+appoint_time+"' where appointment_id="+appt_id;
				}
			}
			
		
			stmt.executeUpdate(sql);		
			
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

		String status="<B> Appointment Deleted Successfully </B>";
		Connection conn = null;
		Statement stmt = null;
		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			System.out.println("Almost there");
			System.out.println(h_appt_id);
			String sql="delete from appointment where appointment_id="+h_appt_id+"";
			stmt.executeUpdate(sql);
			
		
			
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
	
	// jd method to add patient appointment 
	public static String addAppointmentPatient(String email , String doctor , String appointment_date , 
			String time 			)
	{
		String status = null;
		String dentistID = null;
		String patientID= null;
		Connection conn = null;
		Statement stmt = null;
		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			ResultSet rs = null;
			String sql1 = "select dentist_id from dentist where concat(Dentist_First_name,' ',Dentist_Last_Name)   ='"+ doctor+"'";
			System.out.println(sql1);
			String sql2 = "select patient_id from patient where patient_email   ='"+ email+"'";
			System.out.println(sql2);
			
			 rs = stmt.executeQuery(sql1);
			 rs.next();
				dentistID = rs.getString(1);
				System.out.println("dentist id "+dentistID);
			
			rs = stmt.executeQuery(sql2);
			rs.next();
				patientID= rs.getString(1);
				System.out.println("patient id "+patientID);
			
			String sql3 = "INSERT INTO Appointment(Dentist_ID,Patient_ID,Appointment_Date,Appointment_Time) VALUES ("+dentistID+","+patientID+","+"'"+appointment_date+"','"+time+"')";
						System.out.print(sql3);
						
						int check = stmt.executeUpdate(sql3);		
						if (check > 0)
						{
							status = "true";
						}
						else
						{
							status="false";
						}
						rs.close();
						stmt.close();
						conn.close();
		}
		catch (SQLException se)
		{
			se.printStackTrace();
			status ="false";
		}
		
		return status;
	}

	public static int getAccountBalance (String email)
	{
		int balance =0;
		Connection conn = null;
		Statement stmt = null;
		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			ResultSet rs = null;
			String sql1 = "select account_balance from account join patient on account.account_id = patient.account_id where patient_email='"+email+"'";
			System.out.println("Sql "+sql1);
			rs = stmt.executeQuery(sql1);
			
			rs.next();
			balance = rs.getInt(1);
		}
		catch (SQLException e)
		{
			System.out.println(e);
			balance = -99;
			}
		return balance;
		}
		
	
	
	}
	
	
	
	

