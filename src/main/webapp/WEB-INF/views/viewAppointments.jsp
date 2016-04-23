<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="../css/main.css">
<title>Joaquina Dental </title>
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
      <li><a href="#popup">LOGIN</a></li> 
  </ul>
</div>
</div>
<div class="container main-content" >
<div class="row">
    <div class="col-sm-4 hidden-xs"><h4 align="center">Notifications</h4></div>
    <div class="col-sm-8"><h4 align="center">Scheduled Appointments</h4></div>
 </div>
 <!-- Main content Div -->
 <div class="row">
 <div class="col-sm-4 hidden-xs" style= "font-family: Tahoma, 'Times New Roman', sans-serif;">
 <c:if test="${not empty notifications }">
 <c:forEach var="notification" items="${notifications}">
 <div style="margin-left: 0px;" class="row">
 ${notification}
 </div>
 <br>
 </c:forEach>
 </c:if>
 </div>
  <div class="col-sm-8">
  <c:if test="${not empty lists }">
 <c:forEach var="appointment" items="${lists}">
 <div class="row" style="background-color:#EEE; margin-left: 0px;">
 ${appointment}
 </div>
 <br>
 </c:forEach>
 </c:if>
  </div>
  </div>
</div>

<div class="container footer-image" >
</div>
</body>
</html>