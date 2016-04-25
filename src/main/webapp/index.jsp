<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>JoaquinaDental</title>

<link href="css/bootstrap.min.css" rel="stylesheet">

<link href="css/stylish-portfolio.css" rel="stylesheet">

<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=Crimson+Text" />
<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=Fjord+One" />
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Source+Sans Pro:200italic,200,300italic,300,400italic,400,600italic,600,700italic,700,900italic,900"/>	

<link rel="stylesheet" type="text/css" href="css/main.css">

<!-- Carousel related -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
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
padding-right: 30%;
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
				<li class="active"><a href="index.jsp">HOME</a></li>
				<li><a href="aboutUs.html#intro">ABOUT US</a></li>
				<li><a href="#popup">LOGIN</a></li>
				<li><a href="#footer">CONTACT US</a></li>
				<li><a href="homeEsp.html"><i>Español</i></a></li>
			</ul>
			



		</div>
		<div id="popup" class="overlay">
			<div class="popup">
				<h3>Login</h3>
				<a class="close" href="#">&times;</a>
				<div class="content">
					<form role="form" action="siteapp/Login" method="post">
						<div class="form-group">
							<input placeholder="Email" name="email" type="email"
								class="form-control" id="email">
						</div>
						<div class="form-group">
							<input placeholder="Password" name="password" type="password"
								class="form-control" id="pwd">
						</div>
						<button type="submit" class="btn btn-default">Submit</button>
						<h5>Not registered? <a href="siteapp/createAccount" style="color:#33B749">Create an account</a></h5>
					</form>
				</div>
			</div>
		</div>
	</header>



	<!-- About 
    <section id="about" class="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Stylish Portfolio is the perfect theme for your next project!</h2>
                    <p class="lead">This theme features some wonderful photography courtesy of <a target="_blank" href="http://join.deathtothestockphoto.com/">Death to the Stock Photo</a>.</p>
                </div>
            </div>
        </div>
    </section>
    -->


	<!-- Services -->
	<!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
	<section id="services" class="services bg-primary">
		<div class="container">
			<div class="row text-center">
				<div class="col-lg-10 col-lg-offset-1">
					<!--  <h2>Our Services</h2> -->
					<hr class="small">
					<div class="row">
						<div class="col-md-4 col-sm-6">
							<div class="service-item">
								<span class="fa-stack fa-4x"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-cloud fa-stack-1x text-primary"></i>
								</span>
								<h4 style="font-family: 'Fjord One', sans-serif;">
									<strong>Trust</strong>
								</h4>
								<p style="font-family: 'Sans Pro', sans-serif; ">
								<center>The preeminent dentists in Englewood are
									available at your service and you can rely on them blindfolded.</center>
								</p>
								<a href="#" class="btn btn-light">Learn More</a>
							</div>
						</div>
						<div class="col-md-4 col-sm-6">
							<div class="service-item">
								<span class="fa-stack fa-4x"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-compass fa-stack-1x text-primary"></i>
								</span>
								<h4 style="font-family: 'Fjord One', sans-serif;">
									<strong>Quality</strong>
								</h4>
								<p style="font-family: 'Sans Pro', sans-serif; ">
								<center>Our exquisite quality of service and a penchant
									for customer care will put that smile back on your face.</center>
								</p>
								<a href="#" class="btn btn-light">Learn More</a>
							</div>
						</div>
						<div class="col-md-4 col-sm-6">
							<div class="service-item">
								<span class="fa-stack fa-4x"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-flask fa-stack-1x text-primary"></i>
								</span>
								<h4 style="font-family: 'Fjord One', sans-serif;">
									<strong>Professional</strong>
								</h4>
								<p style="font-family: 'Sans Pro', sans-serif; ">
								<center>We care for you and your time and thus kept a
									simple appointment scheduling and check-in process.</center>
								</p>
								<a href="#" class="btn btn-light">Learn More</a>
							</div>
						</div>
						
				</div>
				<!-- /.col-lg-10 -->
			</div>
			<!-- /.row -->
		</div>
		</div>
		<!-- /.container -->
	</section>

	<!-- Callout -->
	<aside class="callout">
		<div class="text-vertical-center">
			<p id="head3" style="font-family: 'Crimson Text', sans-serif; ">
				"We are making the world a better place! <br>One smile at a
				time..."
			</p>
		</div>
	</aside>




	<!-- Portfolio -->
	<section id="portfolio" class="portfolio">
		<div class="container">
			<div class="row text-center">
				<div class="col-lg-10 col-lg-offset-1">

					<hr class="small">
					<div class="row">
						<div class="col-md-6 col-sm-6">
							<a id="head1" style="font-family: 'Fjord One', sans-serif; color: black;" href="aboutUs.html#team" >Our Doctors</a>
							<div class="portfolio-item">

								<div class="container">

									<br>
									<div id="myCarousel" class="carousel slide"
										data-ride="carousel">

										<!-- Wrapper for slides -->
										<div class="carousel-inner" role="listbox">
											<div class="item active">
												<img src="images/1.png" alt="Chania" width="230"
													height="172">
												<p id="imgtxt" style="font-family: 'Crimson Text', sans-serif; ">Dr. Jeffery Hill</p>
												<p id="imgtxt1" style="font-family: 'Crimson Text', sans-serif; ">Dentist</p>
											</div>

											<div class="item">
												<img src="images/2.png" alt="Chania" width="230"
													height="172">
												<p id="imgtxt" style="font-family: 'Crimson Text', sans-serif; ">Dr. Lori Lovette</p>
												<p id="imgtxt1" style="font-family: 'Crimson Text', sans-serif; ">Oral Surgeon</p>
											</div>

											<div class="item">
												<img src="images/3.png" alt="Flower" width="230"
													height="172">
												<p id="imgtxt" style="font-family: 'Crimson Text', sans-serif; ">Dr. Clinton Reid</p>
												<p id="imgtxt1" style="font-family: 'Crimson Text', sans-serif; ">Endodontist</p>
											</div>


										</div>
									</div>
								</div>

							</div>
						</div>
						<!--   <div class="col-md-4"></div>	 -->
						<div class="col-md-6 col-sm-6">
							<p id="head2" style="font-family: 'Fjord One', sans-serif;">About Us</p>
							<div class="portfolio-item">
								<p id="abtus" style="font-family: 'Sans Pro', sans-serif; ">
									Joaquina Dental is based in Engelwood, Colorado. Our practice
									has developed a reputation for being professional, friendly and
									caring for over 30 years. We strive to deliver a comfortable
									and relaxed experience at every visit, while providing high
									quality and lasting dental care. <br> Our dentists always
									takes the time to keep you informed about your dental health
									and explain any conditions that you might have. We offer a wide
									variety of treatment options so that you can choose the best
									possible care for your individual needs.... <a href="#">Read
										more.</a>
								</p>
							</div>
						</div>
						<!--  
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="#">
                                    <img class="img-portfolio img-responsive" src="img/portfolio-3.jpg">
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="#">
                                    <img class="img-portfolio img-responsive" src="img/portfolio-4.jpg">
                                </a>
                            </div>
                        </div>
                        -->
					</div>
					<!-- /.row (nested) 
                    <a href="#" class="btn btn-dark">View More Items</a>
                </div>
                -->
					<!-- /.col-lg-10 -->

					<!-- /.row -->
				</div>
				<!-- /.container -->
			</div>
	</section>

	<!-- Call to Action
    <aside class="call-to-action bg-primary">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h3>The buttons below are impossible to resist.</h3>
                    <a href="#" class="btn btn-lg btn-light">Click Me!</a>
                    <a href="#" class="btn btn-lg btn-dark">Look at Me!</a>
                </div>
            </div>
        </div>
    </aside>
     -->

	<!-- Map AIzaSyCHmqeurcN1kYAdahELWoc8zkFK5Q82KoM-->
	<section id="contact" class="map">
		<iframe width="100%" height="100%" frameborder="0" style="border: 0"
			src="https://www.google.com/maps/embed/v1/place?q=place_id:EiUxMTU2IFMgSGlnaCBTdCwgRGVudmVyLCBDTyA4MDIxMCwgVVNB&key=AIzaSyCHmqeurcN1kYAdahELWoc8zkFK5Q82KoM"
			allowfullscreen></iframe>
	</section>


	<!-- Footer -->
	<footer>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-4 text-justified" id="footer">
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

	<!-- jQuery -
		->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

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
											if (location.pathname.replace(
													/^\//, '') == this.pathname
													.replace(/^\//, '')
													|| location.hostname == this.hostname) {

												var target = $(this.hash);
												target = target.length ? target
														: $('[name='
																+ this.hash
																		.slice(1)
																+ ']');
												if (target.length) {
													$('html,body')
															.animate(
																	{
																		scrollTop : target
																				.offset().top
																	}, 1000);
													return false;
												}
											}
										});
					});
				</script>

</body>

</html>
