package com.joaquinadental.siteapp.service;

import java.util.List;

import com.joaquinadental.siteapp.DAO.NotificationDAO;

public class NotificationService {

	public static List<String> getGeneralNotifications() throws Exception {
		List<String> notifications = NotificationDAO.getGeneralNotifications();
		return notifications;
	}
}
