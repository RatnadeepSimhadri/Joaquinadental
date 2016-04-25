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
  <script src="http://www.aakashweb.com/resources/js/jquery.easing.js"></script>
  <script src="http://www.aakashweb.com/resources/js/jquery.easy-ticker.js"></script>
  <link rel="stylesheet" type="text/css" href="../css/main.css">
  <link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=Crimson+Text" />
<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=Fjord+One" />
		<link href="../css/stylish-portfolio.css" rel="stylesheet">

<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<title>Joaquina Dental </title>
<style>
.demo1 {
	/* border: 1px solid #ccc; */
	margin-top: 10px;
}

.demo1 div div {
	padding: 5px;
	/*  border-bottom: 1px solid #ccc; */
}

.et-run {
	background-color: #0cf;
	color: white;
	border: 1px solid black;
}

#mainview
{
padding-top:40%
}
</style>
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
  
/* Script for ticker */
$(document).ready(function() {
	$('.demo1').easyTicker({
		interval : 1500,
		speed : 'slow',
		direction : 'up'
	});
	
});


</script>
</head>
<body onload="openPersonalDetails()">
<!-- Header -->
	<header id="top" class="header">
		<div class="text-vertical-center"></div>
		<button id="navbutton" type="button" class="navbar-toggle"
			data-toggle="collapse" data-target="#jdNavBar">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="jdNavBar">
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="../index.jsp">HOME</a></li>
				<li><a href="aboutUs.html#intro">ABOUT US</a></li>
				<li><a href="#footer">CONTACT US</a></li>
				
			</ul>
			



		</div>
		<div id="popup" class="overlay">
			<div class="popup">
				<h3>Login</h3>
				<a class="close" href="#">&times;</a>
				<div class="content">
					<form role="form" action="Login" method="post">
						<div class="form-group">
							<input placeholder="Email" name="email" type="email"
								class="form-control" id="email">
						</div>
						<div class="form-group">
							<input placeholder="Password" name="password" type="password"
								class="form-control" id="pwd">
						</div>
						<button type="submit" class="btn btn-default">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</header>
<section id="mainview">
<div class="container main-content" >
<div class="row">
    <div class="col-sm-4 hidden-xs"><h4 style="font-family: 'Fjord One', sans-serif; color: rgba(53, 144, 180, 0.64)"
						align="center">Notifications</h4></div>
    <div class="col-sm-8"><h4 style="font-family: 'Fjord One', sans-serif; color: rgba(53, 144, 180, 0.64)"
						align="center">Patient Registration</h4></div>
 </div>
 <!-- Main content Div -->
 <div class="row">
 <div class="col-sm-4 hidden-xs" style="font-family: 'Crimson text', sans-serif; font-size: 1.8em">
<div class="demo1">
<div>
<c:if test="${not empty notifications }">
<c:forEach var="notification" items="${notifications}">
<div style="font-family: 'Crimson text', sans-serif; font-size: 0.7em">
${notification}
</div>
</c:forEach>
</c:if>
</div>
</div>
</div>
 <div class="col-sm-8">
 <div class="row">
 <div class="row">
 <ul class="nav nav-pills">
 
  <li class="col-sm-3" ><a id="pdlink"  onClick="openPersonalDetails()" >Personal Details</a></li>
  <li class="col-sm-3" ><a id="cdlink"  onclick="openContactDetails()" >Contact Details</a></li>
  <li class="col-sm-3" ><a id="lilink"  onclick="openLoginDetails()" >Login Information</a></li>

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
				<div class="form-group col-sm-4">
				<button type="button"  onclick=getContactForm() class="btn btn-primary btn-sm btn-block">Continue</button>
				</div>
		   </div>
				
</form:form>
</div>
	

</div>
</div>
</div>
<script type="text/javascript">
function getContactForm(){
	
	if(document.getElementById("firstName").value==null||document.getElementById("firstName").value==""){
		alert("Please enter First Name");
		return;
	}
	if(document.getElementById("lastName").value==null||document.getElementById("lastName").value==""){
		alert("Please enter Last Name");
		return;
	}
	if(document.getElementById("minor").value=="na"){
		alert("Please choose if you are a major");
		return;
	}
	if(document.getElementById("ssn").value==null||document.getElementById("ssn").value==""){
		alert("Please enter Last Name");
		return;
	}
	if(document.getElementById("dob").value==null||document.getElementById("dob").value==""){
		alert("Please enter Date of Birth");
		return;
	}
	if(document.getElementById("ssn").value.length>10){
		alert("Invalid SSN");
		return;
	}
	var form = document.getElementById("personalForm");
	form.submit();
}

</script>
</div>
</section>
<footer>
			<div class="row">
				<div class="col-xs-4 text-justified" id="footer">
					<p>
					<h4 style="color:black;">
						<i> Joaquina Dental Group<br>1156 High Street<br>Englewood,
							<br> CO 95064
						</i>
					</h4>
					</p>
				</div>

				<div class="col-xs-8 text-right">
					<ul class="list-unstyled">
						<h4 style="color:black;">
							<i>
								<li><i class="fa fa-phone fa-fw"></i> (123) 456-7890</li>
								<li><i class="fa fa-envelope-o fa-fw"></i> <a
									href="mailto:name@example.com">questions@jqd.com</a></li>
							</i>
						</h4>
					</ul>

					<br>
					<ul class="list-inline">
						<li><a href="#"><i class="fa fa-facebook fa-fw fa-3x"></i></a>
						</li>
						<li><a href="#"><i class="fa fa-twitter fa-fw fa-3x"></i></a>
						</li>
						<li><a href="#"><i class="fa fa-dribbble fa-fw fa-3x"></i></a>
						</li>
					</ul>
				</div>
			</div>
			<hr class="small">

			<p class="text-muted">
			<center>Copyright &copy; JoaquinaDental 2016. All rights reserved.</center>
			</footer>
</body>

</html>