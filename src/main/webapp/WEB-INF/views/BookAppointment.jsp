<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- Fonts used -->

<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Crimson+Text" />
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Fjord+One" />

<!-- End of Fonts used -->
<link href="../css/stylish-portfolio.css" rel="stylesheet">

<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
 <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script> 

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

#mainview{
padding-top:40%;
}
       
</style>


<script>

/* Script for Back button */

function goBack() {
    window.history.back();
}
</script>



 <link rel="stylesheet" type="text/css" href="../css/main.css">
<title>Joaquina Dental </title>
</head>
<body>

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
				<li class="active"><a href="AdminDash">HOME</a></li>
				<li><a href="aboutUs.html#intro">ABOUT US</a></li>
				<li><a href="../index.jsp">LOGOUT</a></li>
				<li><a href="#footer">CONTACT US</a></li>
			</ul>
		</div>
		
	</header>
	
	<section id="mainview">
<div class="container main-content" >

<div class="row">
    <div class="col-sm-4 hidden-xs"><h2 style="font-family: 'Fjord One' , sans-serif;color:rgba(53, 144, 180, 0.64)" align="center">Notifications</h2></div>
    <div class="col-sm-8" style="font-family: 'Fjord One' , sans-serif" align="center"><h2 style="font-family: 'Fjord One' , sans-serif;color:rgba(53, 144, 180, 0.64)">Book Appointment</h2></div>
 </div>
 
 <div class="row"> 
 		<div class="col-md-4 hidden-xs"></div>
 		<div class="col-md-8">
  	 	<h3 style="font-family: 'Crimson text', sans-serif;font-size:1.5em;color:rgba(53, 144, 180, 0.64)" align="center">${statusmsg}</h3>
   		</div>
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
        <div class="col-xs-18 col-sm-5 col-md-5" >
           <button type="button" class="btn btn-primary btn-lg btn-block" onclick="goBack()">Go Back</button>
            </div>
            <div class="col-xs-18 col-sm-2 col-md-2" >
            &nbsp;
            </div>
            <div class="col-xs-18 col-sm-5 col-md-5" >
            <button type="submit" class="btn btn-primary btn-lg btn-block" >Submit</button>
        </div>
        
    </div>
  </form>
</div>

</div>
</div>

</div>
<br>
</section>

<!-- Footer -->
	<footer>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-4 text-justified">
					<p>
					<h4>
						<i> Joaquina Dental Group<br>1156 High Street<br>Englewood,
							<br> CO 95064
						</i>
					</h4>
					</p>
				</div>

				<div class="col-xs-8 text-right">
					<ul class="list-unstyled">
						<h4>
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
			<center>Copyright &copy; JoaquinaDental 2016. All rights
				reserved.
		</div>
	</footer>

</body>
</html>