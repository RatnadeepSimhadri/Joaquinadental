package com.joaquinadental.siteapp.bean;

public class Service {

	private int visitId;
	private int serviceId;
	private int completedServiceId ;
	private int serviceCost;
	private String serviceDesc ;
	

	public int getVisitId() {
		return visitId;
	}

	public void setVisitId(int visitId) {
		this.visitId = visitId;
	}

	/**
	 * @return the serviceDesc
	 */
	public String getServiceDesc() {
		return serviceDesc;
	}

	/**
	 * @param serviceDesc the serviceDesc to set
	 */
	public void setServiceDesc(String serviceDesc) {
		this.serviceDesc = serviceDesc;
	}

	/**
	 * @return the serviceCost
	 */
	public int getServiceCost() {
		return serviceCost;
	}

	/**
	 * @param serviceCost the serviceCost to set
	 */
	public void setServiceCost(int serviceCost) {
		this.serviceCost = serviceCost;
	}

	/**
	 * @return the completedServiceId
	 */
	public int getCompletedServiceId() {
		return completedServiceId;
	}

	/**
	 * @param completedServiceId the completedServiceId to set
	 */
	public void setCompletedServiceId(int completedServiceId) {
		this.completedServiceId = completedServiceId;
	}

	/**
	 * @return the serviceId
	 */
	public int getServiceId() {
		return serviceId;
	}

	/**
	 * @param serviceId the serviceId to set
	 */
	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}
}
