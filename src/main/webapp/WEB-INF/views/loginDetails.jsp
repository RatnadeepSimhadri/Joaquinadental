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
<body onload="openLoginDetails()">
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
<form:form id="personalForm" class="form-horizontal" action="savePatient" method="post">

		<div class="row">
  				
  				<div class="form-group col-sm-4">
    				<input required="required" placeholder="Email *" value="${patient.email}" name="email" type="email" class="form-control" id="email">
				</div>
  				<div class="form-group col-sm-4">
    				<input required="required" placeholder="Password *" value="${patient.password}" name="password" type="password" class="form-control" id="password">
				</div>
  				<div class="form-group col-sm-4">
  				<input required="required" placeholder="Re-enter Password *" value="${patient.password}"  type="password" class="form-control" id="password2">
  				</div>
  			
			</div>
			
			
			
			
			<div class="row">
				<div class="form-group col-sm-6">
				<button type="button" onclick =getContactDetails() class="btn btn-info">Back</button>
				</div>
				<div class="form-group col-sm-6">
				<button type="button" onclick =createAccount() class="btn btn-info">Continue</button>
				</div>
		   </div>
				
</form:form>
</div>
	

</div>
</div>
</div>
</div>
<div class="container footer-image" >
</div>
</body>
<script>
function getContactDetails(){
	
}

function createAccount(){
	if(!document.getElementById("password").value == document.getElementById("password2").value){
		alert("Passwords donot match");
		return;
	}
	document.getElementById("personalForm").submit();
}
</script>
</html>