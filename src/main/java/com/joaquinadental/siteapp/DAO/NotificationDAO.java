package com.joaquinadental.siteapp.DAO;

import static com.joaquinadental.siteapp.util.DBConstants._GET_GENERAL_NOTIFICATION;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class NotificationDAO {
	
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://us-cdbr-iron-east-03.cleardb.net:3306/heroku_012e9bf5c5bf6e6";

	/* Database Credentials */
	static final String USER = "bc0e2f97ace092";
	static final String PASS = "02272043";

	public static List<String> getGeneralNotifications() {

		Connection conn = null;
		Statement stmt = null;
		List<String>list = new ArrayList<String>();
		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			String sql;
			sql = _GET_GENERAL_NOTIFICATION;
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				
				String notificationText  = rs.getString(1);
				System.out.println("notifcation string"+notificationText);
				list.add(notificationText);
				
			
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
