<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/main.css">
<title>View Appointments </title>
</head>
<body>
<div class="container banner-image" >
<button id="navbutton" type="button" class="navbar-toggle" data-toggle="collapse" data-target="#jdNavBar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
</button>
<div class="collapse navbar-collapse" id="jdNavBar">
<ul class="nav navbar-nav navbar-right">
      <li class="active"><a href="#">HOME</a></li>
      <li><a href="#">ABOUT US</a></li>
      <li><a href="#">SERVICES</a></li> 
      <li><a href="#">FORMS</a></li>
  </ul>
</div>
<div id="popup" class="overlay">
	<div class="popup">
		<h3>Login</h3>
		<a class="close" href="#">&times;</a>
		<div class="content">
			<form role="form" action="siteapp/login" method="post">
  				<div class="form-group">
    				  <input placeholder="Email" name="email" type="email" class="form-control" id="email">
  				</div>
  				<div class="form-group">
    				<input placeholder="Password" name="password" type="password" class="form-control" id="pwd">
  				</div>
  					<button type="submit" class="btn btn-default">Submit</button>
			</form>
		</div>
	</div>
</div>
</div>
<div class="container main-content" >
	<!-- <div class="container-fluid">
  		<div class="row">
		    <div class="col-sm-1" style="background-color:lavender;">id</div>
		    <div class="col-sm-2" style="background-color:lavenderblush;">dentist_id</div>
		    <div class="col-sm-3" style="background-color:lavender;">patient_id</div>
		    <div class="col-sm-3" style="background-color:lavenderblush;">appointment_date</div>
		    <div class="col-sm-3" style="background-color:lavender;">appointment_time</div>
  		</div>
	</div> -->
	<%-- <table cellpadding="1" border="1">
    <c:forEach items="${Appointment}" var="appointment">
        <tr>
            <td>${appointment.appointment_id}</td>
            <td><c:out value="${appointment.dentist_id}" /></td>
            <td><c:out value="${appointment.patient_id}" /></td>
        </tr>
    </c:forEach>
</table> --%>
<%@ page import="com.joaquinadental.siteapp.DAO.*" %>
<%@ page import="com.joaquinadental.siteapp.bean.*" %>
<%@ page import="java.util.*" %>

<%!
List<ViewAppointment>results = new ArrayList<ViewAppointment>();
%>  
<%
		results = SiteAppDAO.viewAppointments();
%>

<div class="container-fluid">
	<div align="center"><h3><i>List of appointments</i></h3></div>
<div class="row" style="border: 5px">
		    <div class="col-sm-4" style="background-color:#e6f9ff;" align="center"><b>S. No.</b></div>
		    <div class="col-sm-4" style="background-color:#ccf3ff;" align="center"><b>Patient Name</b></div>
		    <div class="col-sm-4" style="background-color:#e6f9ff;" align="center"><b>Appointment Time</b></div>
		 
		    
  		</div>
  		<%
  			for(int i=0; i<results.size();i++)
  			{ %>
  				<div class="row">
  			    <div class="col-sm-4" style="background-color:#e6f9ff;" align="center"><% out.print(i + 1); %></div>
  			    <div class="col-sm-4" style="background-color:#ccf3ff;" align="center"><%out.print(results.get(i).getPatientName()); %></div>
  			    <div class="col-sm-4" style="background-color:#e6f9ff;" align="center"><%out.print(results.get(i).getAppointment_time()); %></div>
  	  		</div>
  			<% }
  		%>
	</div>

</div>
<div class="container footer-image" >
</div>
</body>
</html>