<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
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
          
            
</style>
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

<div class="Appointment form">
  <h2>Book Appointment</h2>
  <form name="bookappt" action="/siteapp/bookappt" method="post" role="form">
    <div class="form-group">
      <input type="text" name="patientid" class="form-control" id="patid" placeholder="Patient ID">
    </div>
    <div class="form-group">
      <input type="text" name="patfirst_name" class="form-control" id="patfname" placeholder="Patient First Name">
    </div>
    <div class="form-group">
      <input type="text" name="patlast_name" class="form-control" id="patlname" placeholder="Patient Last Name">
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
         <div class="input-group input-append date" id="dateRangePicker"  style="width:40%">
                <input type="text" class="form-control" name="appoint_date" >
                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
            </div>
        </div>
        <div class="form-group" style="width:40%;float:left">
        <select name="hours" class="form-control" id="hours" >
        <option value="" disabled selected>Hours</option>
        <option>10</option>
        <option>11</option>
        <option>12</option>
        <option>13</option>
        <option>14</option>
        <option>15</option>
        <option>16</option>
        <option>17</option>
               </select>
        <select name="mins" class="form-control" id="mins" >
        <option value="" disabled selected>Minutes</option>
        <option>00</option>
        <option>15</option>
        <option>30</option>
        <option>45</option>
               </select>
    </div>
    
    <div class="form-group">
        <div class="col-xs-5 col-xs-offset-3" style="margin-left:10%">
            <button type="submit" class="btn btn-info">Submit</button>
        </div>
        <label>${statusmsg}</label>
    </div>
  </form>
</div>


</div>
<div class="container footer-image" >
</div>
</body>
</html>