<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- Fonts used -->

<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Crimson+Text" />
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Fjord+One" />

<!-- End of Fonts used -->

  
<!-- Jquery Libraries for ticker -->
  
  <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>  
<script src="http://www.aakashweb.com/resources/js/jquery.easing.js"></script>
<script src="http://www.aakashweb.com/resources/js/jquery.easy-ticker.js"></script>

<!-- End of Jquery Libraries for ticker -->

  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />

<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
  <script src="../js/Dateminmax.js"></script>
  <style type="text/css">
.form-control{
				width:80%;
				}
.form-group {
                width:80%;
            }

/* Styling for ticker */

.demo1{
    /* border: 1px solid #ccc; */
    margin-top: 10px;
}
.demo1 div div{
    padding: 5px;
   /*  border-bottom: 1px solid #ccc; */
}

.et-run{
    background-color: #0cf;
    color: white;
    border: 1px solid black;
}     
        
        
        
</style>


<script>

/* Script for ticker */

$(document).ready(function(){

	$('.demo1').easyTicker({
		interval: 1500,
	    speed: 'slow',
		direction: 'up'
	});

	});

/* Script for Back button */

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
    <div class="col-sm-4 hidden-xs"><h2 style="font-family: 'Fjord One' , sans-serif;color:rgba(53, 144, 180, 0.64)" align="center">Notifications</h4></div>
    <div class="col-sm-8" style="font-family: 'Fjord One' , sans-serif" align="center"><h2 style="font-family: 'Fjord One' , sans-serif;color:rgba(53, 144, 180, 0.64)">Book Appointment</h4></div>
 </div>
 
 <div class="row">
 <div class="col-sm-4 hidden-xs"  style= "font-family: 'Crimson text', sans-serif; margin-left: 0px;font-size:1.8em">
 <div class="demo1">
    <div>
        <c:if test="${not empty notifications }">
 		<c:forEach var="notification" items="${notifications}">
 		<div style= "font-family: 'Crimson text', sans-serif;font-size:0.7em">
		<p>${notification}<p>
 		</div>
 		</c:forEach>
 		</c:if> 
 
        
    </div>
</div>
 

 </div>
 
 
  <div class="col-sm-8" align="center">
<div class="Appointment form">
 
  <form name="bookappt" action="/siteapp/bookappt" method="post" role="form">
    <div class="form-group">
      <input type="text" name="patientid" class="form-control" id="patid" placeholder="Patient ID" required>
    </div>
    <div class="form-group">
      <input type="text" name="patfirst_name" class="form-control" id="patfname" placeholder="Patient First Name" required>
    </div>
    <div class="form-group">
      <input type="text" name="patlast_name" class="form-control" id="patlname" placeholder="Patient Last Name" required>
    </div>
    <div class="form-group">
        <select name="doctor_name" class="form-control" id="docname" >
        <option value="" disabled selected>List of Doctors</option>
        <option>Jeffrey Hill</option>
        <option>Alton Watson</option>
        <option>Clinton Reid</option>
        <option>Michael Chandler</option>
        <option>Lori LoVette</option>
        </select>
    </div>
    <div class="form-group">
         <div class="input-group input-append date" id="dateRangePicker"  style="width:80%">
                <input type="text" class="form-control" placeholder="Appointment Date" name="appoint_date" required>
                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
            </div>
        </div>
        <div class="form-group" align="center">
        <select name="hours" class="form-control" id="hours" >
        <option value="" disabled selected>Appointment Time</option>
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
        <div class="col-xs-18 col-sm-3 col-md-5" >
           <button type="button" class="btn btn-primary btn-lg btn-block" onclick="goBack()">Go Back</button>
            </div>
            <div class="col-xs-18 col-sm-2 col-md-2" >
            </div>
            <div class="col-xs-18 col-sm-3 col-md-5" >
            <button type="submit" class="btn btn-primary btn-lg btn-block" >Submit</button>
        </div>
        <label>${statusmsg}</label>
    </div>
  </form>
</div>

</div>
</div>

</div>
<br>

<div class="container footer-image" >
</div>
</body>
</html>