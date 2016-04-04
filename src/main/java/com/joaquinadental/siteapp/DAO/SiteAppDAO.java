package com.joaquinadental.siteapp.DAO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.joaquinadental.siteapp.bean.ViewAppointment;
public class SiteAppDAO {

	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://us-cdbr-iron-east-03.cleardb.net:3306/heroku_012e9bf5c5bf6e6";

	//  Database credentials
	static final String USER = "bc0e2f97ace092";
	static final String PASS = "02272043";

	public static List<ViewAppointment> viewAppointments() {

		Connection conn = null;
		Statement stmt = null;
		List<ViewAppointment>list = new ArrayList<ViewAppointment>();
		try{
			//STEP 2: Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver");

			//STEP 3: Open a connection
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);

			//STEP 4: Execute a query
			System.out.println("Creating statement...");
			stmt = conn.createStatement();
			String sql;
			sql = "SELECT distinct p.patient_first_name, p.patient_last_name, a.appointment_time FROM appointment AS a inner join patient AS p ON a.patient_id = p.patient_id where a.dentist_id = 1 and a.appointment_date like '2006-01-02'";
			ResultSet rs = stmt.executeQuery(sql);

			//STEP 5: Extract data from result set
			while(rs.next()){
				
				String pateint_first_name  = rs.getString(1);
				String patient_last_name = rs.getString(2);
				Time appointment_time = rs.getTime(3);
			
				
				ViewAppointment app = new ViewAppointment();
				app.setPatientName(pateint_first_name + " " + patient_last_name);
				app.setAppointment_time(appointment_time);
			
				
				list.add(app);
				
				//Display values
				System.out.print("patient name: " + app.getPatientName());
				System.out.println(", appointment_time "+ appointment_time);
			
			}
			
			rs.close();
			stmt.close();
			conn.close();
		}catch(SQLException se){
			//Handle errors for JDBC
			se.printStackTrace();
		}catch(Exception e){
			//Handle errors for Class.forName
			e.printStackTrace();
		}finally{
			//finally block used to close resources
			try{
				if(stmt!=null)
					stmt.close();
			}catch(SQLException se2){
			}// nothing we can do
			try{
				if(conn!=null)
					conn.close();
			}catch(SQLException se){
				se.printStackTrace();
			}//end finally try
		}//end try
		return list;
	}//end main


}
