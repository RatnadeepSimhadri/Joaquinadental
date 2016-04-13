package com.joaquinadental.siteapp.DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import static com.joaquinadental.siteapp.util.DBConstants.*;

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


}
