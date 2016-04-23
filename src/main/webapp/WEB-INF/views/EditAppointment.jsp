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
  
   <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  
  <script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>
  
  <!-- <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />

<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script> -->
  <script src="../js/Dateminmax.js"></script>
  <style type="text/css">
.form-control{
				width:80%;
				}
.form-group {
                width:80%;
            }
          
            
</style>

<script>
function goBack() {
    window.history.back();
}
</script>


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
<div id="popup" class="overlay">
	<div class="popup">
		<h3>Login</h3>
		<a class="close" href="#">&times;</a>
		<div class="content">
			<form role="form" action="siteapp/Login" method="post">
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

<div class="row">
    <div class="col-sm-4 hidden-xs"><h4>Notifications</h4></div>
    <div class="col-sm-8"><h4>Edit Appointment</h4></div>
 </div>
 
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
<div class="Appointment form">
 
  <form name="updateappt" id="updateappt" action="/siteapp/updappt" method="post" >
    <div class="form-group">
     
     <input type="hidden" id="appt_id" value="${Editlist.appointment_id}" name="appt_id">
          <input type="text" value="Appointment ID: ${Editlist.appointment_id}" name="appt1_id" class="form-control" readonly>
      <br>
      <input type="text" value=" Patient Name: ${Editlist.patientName}" name="patientname" class="form-control" id="patientname" readonly>
    </div>
    
       
    <div class="form-group">
         <select name="doctor_name" class="form-control" id="doctor_name" >
        <option value="${Editlist.dentistName}" disabled selected>Doctor Name: ${Editlist.dentistName}</option>
        <option>Jeffrey Hill</option>
        <option>Alton Watson</option>
        <option>Clinton Reid</option>
        <option>Michael Chandler</option>
        <option>Lori LoVette</option>
        </select>
    </div>
    <div class="form-group" style="width:80%">
         <input type="text" class="form-control" value=" Date: ${Editlist.appointment_Date}" id="datepicker">
         </div>
        
        <div class="form-group" style="width:80%">
        <select name="hours" class="form-control" id="hours" >
        <option value="" disabled selected>Time: ${Editlist.hours}</option>
        <option>08:00</option>
        <option>09:00</option>
        <option>10:00</option>
        <option>11:00</option>
        <option>12:00</option>
        <option>13:00</option>
        <option>14:00</option>
        <option>15:00</option>
        <option>16:00</option>
        <option>17:00</option>
              </select>
    
    </div>
    
    <div class="form-group">
        <div class="col-xs-5 col-xs-offset-3" style="margin-left:10%">
            <button class="btn btn-info" onclick="goBack()">Go Back</button>
            <button type="submit" class="btn btn-info" style="margin-left:35%">Submit</button>
        </div>
        <label>${statusmsg}</label>
    </div>
  </form>
</div>

</div>
</div>

</div>
<div class="container footer-image" >
</div>
</body>


</html>