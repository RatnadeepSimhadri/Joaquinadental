package com.joaquinadental.siteapp.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.joaquinadental.siteapp.bean.Patient;

public class CreateAccountDAO {

	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://us-cdbr-iron-east-03.cleardb.net:3306/heroku_012e9bf5c5bf6e6";

	/* Database Credentials */
	static final String USER = "bc0e2f97ace092";
	static final String PASS = "02272043";

	public static boolean saveProfile(Patient patient) throws Exception {

		Connection conn = null;
		Statement stmt = null;
		boolean result = false;
		PreparedStatement prestmt = null;
		PreparedStatement prestmt2 = null;
		PreparedStatement checkUser = null;
		List<String>list = new ArrayList<String>();
		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			
			String createAccount;
			
			String checkEmailId = "select User_emailID from users where upper(User_emailID) = ?";
			checkUser = conn.prepareStatement(checkEmailId);
			checkUser.setString(1,patient.getEmail().toUpperCase());
			ResultSet rscu = checkUser.executeQuery();
			
			
			createAccount = "insert into account(account_balance) values (0)";
			stmt.executeUpdate(createAccount);
			ResultSet rs = stmt.executeQuery("select last_insert_id() as last_id from account limit 1");
			while(rs.next()){
				Integer  accountId  = rs.getInt(1);
				patient.setAccountID(accountId);
			
			}
			
			int status2=0; ;
			int status=0;
				prestmt2 = conn.prepareStatement("insert into users(user_emailID,user_pwd,user_type)values(?,?,?)");
				prestmt2.setString(1,patient.getEmail());
				prestmt2.setString(2,patient.getPassword() );
				prestmt2.setString(3,"P" );
				status2 = prestmt2.executeUpdate();
			
			if(status2>0){
			
			String createPatient = "insert into patient(Account_ID,Patient_First_Name,Patient_Middle_Name,Patient_Last_Name,"
					+ "Patient_Street,Patient_City,Patient_State,Patient_Zip,Patient_Phone_Primary,Patient_Phone_Secondary,Patient_SSN,"
					+ "Patient_DOB,Patient_Minor,Patient_Head_Of_House,Patient_Allergies,Patient_Email) values (?,?,?,?,?,?,?,?,?,?,"
					+ "?,?,?,?,?,?)";
			prestmt = conn.prepareStatement(createPatient);
			/*** Save Patient   ***/
			prestmt.setInt(1, patient.getAccountID());
			prestmt.setString(2, patient.getFirstName());
			prestmt.setString(3, patient.getMiddleName());
			prestmt.setString(4, patient.getLastName());
			prestmt.setString(5, patient.getStreet());
			prestmt.setString(6, patient.getCity());
			prestmt.setString(7, patient.getState());
			prestmt.setString(8, patient.getZip());
			prestmt.setString(9, patient.getPhonePrimary());
			prestmt.setString(10, patient.getPhoneSecondary());
			prestmt.setString(11, patient.getSsn());
			prestmt.setDate(12,new Date(patient.getDob().getTime()));
			prestmt.setInt(13,Integer.parseInt(patient.getMinor()));
			prestmt.setString(14, patient.getHeadOfHouse());
			prestmt.setString(15, patient.getAlergies());
			prestmt.setString(16, patient.getEmail());
			
			status = prestmt.executeUpdate();
			}else{
				String query = "delete from users where user_emailID like'%"+patient.getEmail()+"%'";
				prestmt2.executeUpdate(query);
			}
			
			rs.close();
			if(status>0)
				result= true;
			
		}catch(SQLException se){
			se.printStackTrace();
			throw(se);
		}catch(Exception e){
			e.printStackTrace();
			throw(e);
		}finally{
			try{
				if(prestmt!=null)
					prestmt.close();
				if(prestmt2!=null)
					prestmt2.close();
				if(stmt!=null)
					stmt.close();
			}catch(SQLException se2){
				throw (se2);
			}
			try{
				if(conn!=null){
					conn.close();
				}
			}catch(SQLException se){
				se.printStackTrace();
				throw(se);
			}
		}
		return result;
	}
}
