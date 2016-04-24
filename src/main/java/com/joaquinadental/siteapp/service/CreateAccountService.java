package com.joaquinadental.siteapp.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.joaquinadental.siteapp.DAO.CreateAccountDAO;
import com.joaquinadental.siteapp.bean.Patient;
import com.joaquinadental.siteapp.bean.State;

public class CreateAccountService {
	private static List<State> states;
	
	public boolean savePatient(Patient patient) throws Exception{
		return CreateAccountDAO.saveProfile(patient);
	}
	
	public static List getStates(){
		
		if(states==null){
		states = new ArrayList<State>();
		states.add(new State("Alabama","AL"));
		states.add(new State("Alaska","AK"));
		states.add(new State("Alberta","AB"));
		states.add(new State("American Samoa","AS"));
		states.add(new State("Arizona","AZ"));
		states.add(new State("Arkansas","AR"));
		states.add(new State("Armed Forces (AE)","AE"));
		states.add(new State("Armed Forces Americas","AA"));
		states.add(new State("Armed Forces Pacific","AP"));
		states.add(new State("British Columbia","BC"));
		states.add(new State("California","CA"));
		states.add(new State("Colorado","CO"));
		states.add(new State("Connecticut","CT"));
		states.add(new State("Delaware","DE"));
		states.add(new State("District Of Columbia","DC"));
		states.add(new State("Florida","FL"));
		states.add(new State("Georgia","GA"));
		states.add(new State("Guam","GU"));
		states.add(new State("Hawaii","HI"));
		states.add(new State("Idaho","ID"));
		states.add(new State("Illinois","IL"));
		states.add(new State("Indiana","IN"));
		states.add(new State("Iowa","IA"));
		states.add(new State("Kansas","KS"));
		states.add(new State("Kentucky","KY"));
		states.add(new State("Louisiana","LA"));
		states.add(new State("Maine","ME"));
		states.add(new State("Manitoba","MB"));
		states.add(new State("Maryland","MD"));
		states.add(new State("Massachusetts","MA"));
		states.add(new State("Michigan","MI"));
		states.add(new State("Minnesota","MN"));
		states.add(new State("Mississippi","MS"));
		states.add(new State("Missouri","MO"));
		states.add(new State("Montana","MT"));
		states.add(new State("Nebraska","NE"));
		states.add(new State("Nevada","NV"));
		states.add(new State("New Brunswick","NB"));
		states.add(new State("New Hampshire","NH"));
		states.add(new State("New Jersey","NJ"));
		states.add(new State("New Mexico","NM"));
		states.add(new State("New York","NY"));
		states.add(new State("Newfoundland","NF"));
		states.add(new State("North Carolina","NC"));
		states.add(new State("North Dakota","ND"));
		states.add(new State("Northwest Territories","NT"));
		states.add(new State("Nova Scotia","NS"));
		states.add(new State("Nunavut","NU"));
		states.add(new State("Ohio","OH"));
		states.add(new State("Oklahoma","OK"));
		states.add(new State("Ontario","ON"));
		states.add(new State("Oregon","OR"));
		states.add(new State("Pennsylvania","PA"));
		states.add(new State("Prince Edward Island","PE"));
		states.add(new State("Puerto Rico","PR"));
		states.add(new State("Quebec","QC"));
		states.add(new State("Rhode Island","RI"));
		states.add(new State("Saskatchewan","SK"));
		states.add(new State("South Carolina","SC"));
		states.add(new State("South Dakota","SD"));
		states.add(new State("Tennessee","TN"));
		states.add(new State("Texas","TX"));
		states.add(new State("Utah","UT"));
		states.add(new State("Vermont","VT"));
		states.add(new State("Virgin Islands","VI"));
		states.add(new State("Virginia","VA"));
		states.add(new State("Washington","WA"));
		states.add(new State("West Virginia","WV"));
		states.add(new State("Wisconsin","WI"));
		states.add(new State("Wyoming","WY"));
		states.add(new State("Yukon Territory","YT"));
		}
		return states;
	}
}
