<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Fonts used -->
<link rel="stylesheet" type="text/css"	href="//fonts.googleapis.com/css?family=Crimson+Text" />
<link rel="stylesheet" type="text/css"	href="//fonts.googleapis.com/css?family=Fjord+One" />
<!-- End of Fonts used -->
<script src="//code.jquery.com/jquery-1.10.2.js"></script>  
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<!-- Jquery Libraries for ticker -->
<!-- End of Jquery Libraries for ticker -->
<title>JoaQuinaDental</title>

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../css/stylish-portfolio.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<link rel="stylesheet" type="text/css" href="../css/main.css">

<style>

#mainview
{
padding-top:40%;
}

.et-run {
	background-color: #0cf;
	color: white;
	border: 1px solid black;
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 26%;
	height: 26%
}

#imgtxt {
	margin-left: 1em;
	padding-top: 1em;
	font: italic bold 2em Georgia, serif;
	align: center;
}

#imgtxt1 {
	margin-left: 2.3em;
	font: italic 2em Georgia, serif;
	align: center;
}

#abtus {
	margin-top: 1em;
	font: italic 2em serif;
	background-color: #fff;
}

#head1 {
	margin-left: 13%;
	font: bold italic 2em Helvetica;
}

#head2 {
	font: bold italic 2em Helvetica;
	text-align: center;
}

#head3 {
	font: bold italic 3em Helvetica;
	text-align: center;
}
</style>
<script>
	/* Script for ticker */
	/*function ticker() {
	    $('#ticker li:first').slideUp(function() {
	        $(this).appendTo($('#ticker')).slideDown();
	    });
	}
	setInterval(ticker, 3000);
	*/
</script>
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
				<li class="active"><a href="PatientLanding">HOME</a></li>
				<li><a href="aboutUs.html#intro">ABOUT US</a></li>
				<li><a href="../index.jsp">LOGOUT</a></li>
				<li><a href="#footer">CONTACT US</a></li>
			</ul>
		</div>
	</header>

	<section id="mainview">
		<div class="container main-content">
		
			<div class="row">
				<div class="col-sm-4 hidden-xs">
					<h2
						style="font-family: 'Fjord One', sans-serif; color: rgba(53, 144, 180, 0.64)"
						align="center">Notifications</h2>
				</div>
				<div class="col-sm-8"
					style="font-family: 'Fjord One', sans-serif; font-size: 1.8em"
					align="center">
					<h2
						style="font-family: 'Fjord One', sans-serif; color: rgba(53, 144, 180, 0.64)">
						Upcoming Appointment</h2>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-4 hidden-xs"></div>
				<div class="col-sm-8" align="center" style="font-family: 'Crimson text', sans-serif; font-size: 1.2em">
					<label>${status}</label>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 hidden-xs"
					style="font-family: 'Crimson text', sans-serif; margin-left: 0px; font-size: 1.8em">
					
						<div>
							<c:if test="${not empty notifications }">
							<div class="ticker">
							<ul id="ticker" style="font-family: 'Crimson text', sans-serif; font-size: 0.7em">
								<c:forEach var="notification" items="${notifications}">
																<li>${notification}</li>
										
									
								</c:forEach>
								</ul>
								</div>
							</c:if>
							
						</div>
					
					

				</div>





				<div class="col-sm-8">
					<c:if test="${not empty lists }">
						<c:forEach var="appointment" items="${lists}">
							<div class="row"
								style="background-color: #EEE; margin-left: 0px; font-family: 'Crimson text', sans-serif; font-size: 1.2em">
								${appointment}</div>
							<br>
						</c:forEach>
					</c:if>
				</div>



				<div class="row">
					<div class="col-md-5 col-sm-4 hidden-xs">
						<!-- <label>${status}</label> -->
					</div>
					<div class="col-md-7 col-sm-8 col-xs-18">
						<div class="row">
							<form role="form" action="siteapp/PatientLanding" id="form1"
								method="post">
								<div class="col-md-4  col-sm-3 col-xs-18">
									<button type="button" id="bookAppointment"
										class="btn btn-primary btn-lg btn-block"
										onclick="redirectAppointment()">Book Appointment</button>
								</div>
								<div class="col-md-2  col-sm-2 col-xs-18"></div>
								<div class="col-md-4 col-sm-3 col-xs-18">
									<button type="button" id="accountDetails"
										class="btn btn-primary btn-lg btn-block"
										onclick="redirectAccount()">Account Details</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			function redirectAccount() {

				var myForm = document.getElementById("form1");
				myForm.action = "AccountDetails";
				myForm.submit();
			}

			function redirectAppointment() {

				var myForm = document.getElementById("form1");
				myForm.action = "BookAppointment";
				myForm.submit();
			}
		</script>
	</section>
&nbsp;


	<!-- Footer -->
	<footer>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-4 text-justified" id="footer">
					<p>
					<h4 style="color:black;">
						<i> Joaquina Dental Group<br>1156 High Street<br>Englewood,	<br> CO 95064
						</i>
					</h4>
					</p>
				</div>

				<div class="col-xs-8 text-right">
					<ul class="list-unstyled">
						<h4 style="color:black;">
							<i>
								<li><i class="fa fa-phone fa-fw"></i> (123) 456-7890</li>
								<li><i class="fa fa-envelope-o fa-fw"></i> <a  href="mailto:name@example.com">questions@jqd.com</a></li>
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

	<!-- jQuery -
		->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
	<script src="../js/bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script>
		// Closes the sidebar menu
		$("#menu-close").click(function(e) {
			e.preventDefault();
			$("#sidebar-wrapper").toggleClass("active");
		});

		// Opens the sidebar menu
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#sidebar-wrapper").toggleClass("active");
		});

		// Scrolls to the selected menu item on the page
		$(function() {
			$('a[href*=#]:not([href=#])')
					.click(
							function() {
								if (location.pathname.replace(/^\//, '') == this.pathname
										.replace(/^\//, '')
										|| location.hostname == this.hostname) {

									var target = $(this.hash);
									target = target.length ? target
											: $('[name=' + this.hash.slice(1)
													+ ']');
									if (target.length) {
										$('html,body').animate({
											scrollTop : target.offset().top
										}, 1000);
										return false;
									}
								}
							});
		});
	</script>

</body>

</html>
