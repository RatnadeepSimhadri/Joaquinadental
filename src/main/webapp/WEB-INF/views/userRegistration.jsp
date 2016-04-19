<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="../css/main.css">
<title>Joaquina Dental </title>
<script type="text/javascript">
function openContactDetails(){
	document.getElementById("cdlink").parentNode.classList.add("active");
	
	document.getElementById("pdlink").parentNode.classList.remove("active");
	
	document.getElementById("lilink").parentNode.classList.remove("active");
	
	document.getElementById("actualForm").innerHTML=document.getElementById("cdDiv").innerHTML;
	
	return true;
	
}
function openLoginDetails(){
	document.getElementById("lilink").parentNode.classList.add("active");
	
	document.getElementById("pdlink").parentNode.classList.remove("active");
	
	document.getElementById("cdlink").parentNode.classList.remove("active");
	
	document.getElementById("actualForm").innerHTML=document.getElementById("ldDiv").innerHTML;
	
	return true;
	
}
function openPersonalDetails(){
	document.getElementById("pdlink").parentNode.classList.add("active");
	
	document.getElementById("lilink").parentNode.classList.remove("active");
	
	document.getElementById("cdlink").parentNode.classList.remove("active");
	
	document.getElementById("actualForm").innerHTML=document.getElementById("pdDiv").innerHTML;
	
	return true;
	
}
</script>
</head>
<body onload="openPersonalDetails()">
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
    <div class="col-sm-4 hidden-xs"><h4>Notifications</h4></div>
    <div class="col-sm-8"><h4>User registration</h4></div>
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
 <div class="row" style="margin-left: 0px;">
 <ul class="nav nav-pills">
  <li><a id="pdlink"  onClick="openPersonalDetails()" >Personal Details</a></li>
  <li><a id="cdlink"  onclick="openContactDetails()" >Contact Details</a></li>
  <li><a id="lilink"  onclick="openLoginDetails()" >Login Information</a></li>
</ul>
<div id="personalForm">
<form:form action="getContactForm" method="post">
  				<div class="form-group">
    				  <input placeholder="First Name" value="${patient.firstName}" name="firstName" type="text" class="form-control" id="firstName">
  				</div>
  				<div class="form-group">
    				<input placeholder="Last Name" value="${patient.lastName}" name="lastName" type="text" class="form-control" id="lastName">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>

</form:form>
</div>
	

</div>
</div>
</div>
<div class="container footer-image" >
</div>
</body>

</html>