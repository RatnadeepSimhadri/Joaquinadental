<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
  <link href="http://code.jquery.com/ui/1.10.4/themes/cupertino/jquery-ui.css" rel="stylesheet">
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="../css/main.css">
<title>Joaquina Dental </title>
<script type="text/javascript">
function openContactDetails(){
	document.getElementById("cdlink").parentNode.classList.add("active");
	
	document.getElementById("pdlink").parentNode.classList.remove("active");
	
	document.getElementById("lilink").parentNode.classList.remove("active");
	
	
	return true;
	
}
function openLoginDetails(){
	document.getElementById("lilink").parentNode.classList.add("active");
	
	document.getElementById("pdlink").parentNode.classList.remove("active");
	
	document.getElementById("cdlink").parentNode.classList.remove("active");
	

	
	return true;
	
}
function openPersonalDetails(){
	document.getElementById("pdlink").parentNode.classList.add("active");
	
	document.getElementById("lilink").parentNode.classList.remove("active");
	
	document.getElementById("cdlink").parentNode.classList.remove("active");
	
	
	
	return true;
	
}

$(function() {
    $( "#dob" ).datepicker();
  });
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
    <div class="col-sm-8"><h4>Patient Registration</h4></div>
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
 <div class="row">
 <ul class="nav nav-pills">
 
  <li class="col-xs-3" ><a id="pdlink"  onClick="openPersonalDetails()" >Personal Details</a></li>
  <li class="col-xs-3" ><a id="cdlink"  onclick="openContactDetails()" >Contact Details</a></li>
  <li class="col-xs-3" ><a id="lilink"  onclick="openLoginDetails()" >Login Information</a></li>

</ul>
  </div>
<br>
<div >
<form:form id="personalForm" class="form-horizontal" action="getContactForm" method="post">

		<div class="row">
  				
  				<div class="form-group col-sm-3">
    				<input required="required" placeholder="First Name*" value="${patient.firstName}" name="firstName" type="text" class="form-control" id="firstName">
				</div>
  				<div class="form-group col-sm-3">
    				<input required="required" placeholder="Family Name*" value="${patient.lastName}" name="lastName" type="text" class="form-control" id="lastName">
				</div>
  				<div class="form-group col-sm-3">
  				<input placeholder="Middle Name" value="${patient.middleName}" name="middleName" type="text" class="form-control" id="middleName">
  				</div>
  			
			</div>
			
			<div class="row">
			<div class="form-group col-sm-3">
    				<input required="required" placeholder="Date of Birth *" value="${patient.dob}" name="dob" type="text" class="form-control" id="dob">
			</div>
			
  			
			<div class="form-group col-sm-3">
  				<select id="minor" name="minor" required="required" class="form-control" >
  				<option value="na">Are you a Major? </option>
    			<option value="0">Yes</option>
    			<option value="1">No</option>
    			</select>
  			</div>
  			
			<div class="form-group col-sm-3">
    				<input required="required" placeholder="SSN*" value="${patient.ssn}" name="ssn" type="text" class="form-control" id="ssn">
			</div>
			</div>
			
			<div class="row">
				<div class="form-group col-sm-6">
    				<input placeholder="Alergies" value="${patient.alergies}" name="alergies" type="text" class="form-control" id="alergies">
			</div>
			<div class="form-group col-sm-6">
    				<input  placeholder="Head of Household" value="${patient.headOfHouse}" name="headOfHouse" type="text" class="form-control" id="headOfHouse">
			</div>

		   </div>
			
			<div class="row">
				<div class="form-group col-sm-12">
				<button type="button"  onclick=getContactForm() class="btn btn-info">Continue</button>
				</div>
		   </div>
				
</form:form>
</div>
	

</div>
</div>
</div>
<script type="text/javascript">
function getContactForm(){
	if(document.getElementById("minor").value=="na"){
		alert("Please choose if you are a major");
		return;
	}
	var form = document.getElementById("personalForm");
	form.submit();
}

</script>
</div>
<div class="container footer-image" >
</div>
</body>

</html>