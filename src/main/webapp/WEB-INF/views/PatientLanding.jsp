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

<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=Crimson+Text" />
<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=Fjord+One" />

<!-- End of Fonts used -->
<!-- Jquery Libraries for ticker -->
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script src="http://www.aakashweb.com/resources/js/jquery.easing.js"></script>
<script
	src="http://www.aakashweb.com/resources/js/jquery.easy-ticker.js"></script>
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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<link rel="stylesheet" type="text/css" href="../css/main.css">


<!--<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
 <script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
<style>

/* Styling for ticker */
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
	$(document).ready(function() {
		$('.demo1').easyTicker({
			interval : 1500,
			speed : 'slow',
			direction : 'up'
		});
	});
</script>
</head>

<body>

	<div class="collapse navbar-collapse" id="jdNavBar">
		<ul class="nav navbar-nav navbar-right">
			<li class="active"><a href="#">HOME</a></li>
			<li><a href="#">ABOUT US</a></li>
			<li><a href="#">SERVICES</a></li>
			<li><a href="#">FORMS</a></li>
			<li><a href="#popup">LOGOUT</a></li>
		</ul>
	</div>
	<!--  comment log in part	<div id="popup" class="overlay">
					<div class="popup">
						<h3>Login</h3>
						<a class="close" href="#">&times;</a>
						<div class="content">
							<form role="form" action="siteapp/login" method="post">
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
					</div> -->
	</div>

	<!-- Header -->
	<header id="top" class="header">
		<div class="text-vertical-center"></div>
	</header>
	<section>
		<div class="container main-content">
			<%--  jd <div class="row">
				<div class="col-sm-4 hidden-xs">
					<h4 align="center" style="color: rgba(53, 144, 180, 0.64);">Notifications</h4>
				</div>
				<div class="col-sm-8">
					<h4 align="center" style="color: rgba(53, 144, 180, 0.64);">Upcoming
						Appointments</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 hidden-xs"></div>
				<div class="col-sm-8" align="center">
					<label>${status}</label>
				</div>
			</div>

			<div class="col-sm-4 hidden-xs"
				style="font-family: Tahoma, 'Times New Roman', sans-serif;">
				<c:if test="${not empty notifications }">
					<c:forEach var="notification" items="${notifications}">
						<div style="margin-left: 0px;" class="row">${notification}</div>
						<br>
					</c:forEach>
				</c:if>
			jd </div> --%>
			<div class="row">
				<div class="col-sm-4 hidden-xs">
					<h2
						style="font-family: 'Fjord One', sans-serif; color: rgba(53, 144, 180, 0.64)"
						align="center">
						Notifications
						</h4>
				</div>
				<div class="col-sm-8" style="font-family: 'Fjord One', sans-serif"
					align="center">
					<h2
						style="font-family: 'Fjord One', sans-serif; color: rgba(53, 144, 180, 0.64)">
						Book Appointment
						</h4>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-4 hidden-xs"
					style="font-family: 'Crimson text', sans-serif; margin-left: 0px; font-size: 1.8em">
					<div class="demo1">
						<div>
							<c:if test="${not empty notifications }">
								<c:forEach var="notification" items="${notifications}">
									<div
										style="font-family: 'Crimson text', sans-serif; font-size: 0.7em">
										<p>${notification}
										<p>
									</div>
								</c:forEach>
							</c:if>


						</div>
					</div>

				</div>





				<div class="col-sm-8">
					<c:if test="${not empty lists }">
						<c:forEach var="appointment" items="${lists}">
							<div class="row"
								style="background-color: #EEE; margin-left: 0px;">
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
								<div class="col-md-4 col-md-offset-1 col-sm-3 col-xs-18">
									<button type="button" id="bookAppointment"
										class="btn btn-primary btn-lg btn-block"
										onclick="redirectAppointment()">Book Appointment</button>
								</div>
								<div class="col-md-2  col-sm-2 col-xs-18">&nbsp;</div>
								<div class="col-md-5 col-sm-3 col-xs-18">
									<button type="button" id="accountDetails"
										class="btn btn-primary btn-lg btn-block"
										onclick="redirectAccount()">Account Details</button>
								</div>
							</form>
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



	<!-- Footer -->
	<footer>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-4 text-justified">
					<p>
					<h4>
						<i> Medical Care Group<br>1156 High Street<br>Englewood,
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
