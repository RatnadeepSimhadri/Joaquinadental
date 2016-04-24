<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>JoaQuinaDental</title>

    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <link rel="stylesheet" type="text/css" href="css/main.css">
	 <!-- Carousel related -->
	  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>
  
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 26%;
      height: 26%
  }

  #imgtxt{
	margin-left: 1em;
	padding-top: 1em; 
	font: italic bold 2em Georgia, serif;
	align: center;
  
  }
  
  #imgtxt1{
	margin-left: 2.3em;
	font: italic 2em Georgia, serif;
  	align: center;
  }
  
  #abtus{
  margin-top: 1em;
  font: italic 2em serif;
  background-color: #fff;
  }
  
  #head1{
  margin-left: 13%;
  font: bold italic 2em Helvetica;
  }
  
  #head2{
  font: bold italic 2em Helvetica;
  text-align: center;
  }
  
   #head3{
  font: bold italic 3em Helvetica;
  text-align: center;
  }
  </style>
  
  
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#accordion" ).accordion({
    	 heightStyle: "content"
    		
    });
    $( "#accordion" ).accordion({
    	collapsible: true
   		
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
			
		

    <!-- Header -->
    <header id="top" class="header">
	        <div class="text-vertical-center">
	
			</div>
    </header>
<section>
<div class="container main-content" >
<div class="row">
    <div class="col-sm-4 hidden-xs"><h4 align="center" style="color: rgba(53, 144, 180, 0.64);">Notifications</h4></div>
    <div class="col-sm-8"><h4 align="center" style="color: rgba(53, 144, 180, 0.64);">Account Details</h4></div>
  </div>
	 <div class="row ">
	 <div class="col-sm-4 hidden-xs"></div>
	 <div class="col-sm-8"><h4 align="center">Your current account balance due is ${balance}$</h4></div>
  </div>

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
  <c:if test="${not empty list }">
  <label style="color: rgba(74, 145, 223, 0.8);">Your visit history is as follows</label>
  <div id="accordion">
 <c:forEach var="visit" items="${list}">
 <!-- <div class="row" style="background-color:#EEE; margin-left: 0px;"> jd -->
  ${visit}
  <!-- </div> -->

 </c:forEach>
 </div>
 </c:if>
 
  </div>
 
  
  
   <div class="row">
   <div class="col-md-5 col-sm-4 hidden-xs">
  <!-- <label>${status}</label> --> 
  </div>
  <div class="col-md-7 col-sm-8 col-xs-18" >
   <div class="row">
   <form role="form" action="siteapp/PatientLanding" id="form1" method="post">
  <div class="col-md-5 col-sm-3 col-xs-18">
  <button type="button" id="bookAppointment" class="btn btn-primary btn-lg btn-block" onclick="back()" >Back</button>
  </div>
  <div class="col-md-2 col-sm-2 col-xs-18">
  &nbsp; </div>
  <div class="col-md-5 col-sm-3 col-xs-18">
   <button type="button" id="MakePayment" class="btn btn-primary btn-lg btn-block disabled" onclick="" >Make Payment</button>
   </div>
   </form>
  </div> 
   </div>
 </div>
</div>
<script type="text/javascript">
function back()
{
	
	var myForm= document.getElementById("form1");
	myForm.action="PatientLanding" ;
	myForm.submit();
	}
	
</script>	
</section>

    

    <!-- Footer -->
	<footer>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-4 text-justified">
					<p><h4><i>
						Medical Care Group<br>1156 High Street<br>Englewood, 
						<br> CO 95064</i></h4>
					</p>
				</div>
				
				<div class="col-xs-8 text-right">
					<ul class="list-unstyled"><h4><i>
						<li><i class="fa fa-phone fa-fw"></i> (123) 456-7890</li>
						<li><i class="fa fa-envelope-o fa-fw"></i> <a href="mailto:name@example.com">questions@jqd.com</a></li></i></h4>
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

			<p class="text-muted"><center>Copyright &copy; JoaquinaDental 2016. All rights
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
