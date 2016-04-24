package com.joaquinadental.siteapp.bean;

public class State {
	private String stateName;
	private String stateCode;
	public String getStateName() {
		return stateName;
	}
	
	public State(String name, String code){
		this.stateName=name;
		this.stateCode=code;
	}
	public void setStateName(String stateName) {
		this.stateName = stateName;
	}
	public String getStateCode() {
		return stateCode;
	}
	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}
	
}
