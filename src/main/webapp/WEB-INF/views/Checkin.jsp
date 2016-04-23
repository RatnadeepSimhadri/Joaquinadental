<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.3.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.js"></script>



<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

  
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />

<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
  
  <style type="text/css">

input {
    border:1px solid #cccccc;
    border-radius: 3px 3px 3px 3px;
    width: 370px;
    padding: 9px 9px 9px 9px;
    margin: 3px 0px 3px 3px;
    color: #e1e1e1;
}
    
input:focus {
    border-color:#00cc33;
    box-shadow:0 0 10px #d5d5d9;
    -webkit-box-shadow:outset 0 1px 9px #d5d5d9;
    -moz-box-shadow:outset 0 1px 9px #d5d5d9;
    color:  #676767;
}

/* min Jquery CSS elements for autocomplete */
.ui-autocomplete { position: absolute; cursor: default; }    
.ui-menu { list-style:none; padding: 2px; margin: 0; display:block; float: left; background-color:#f9f9f9; border: 1px solid #efefef; border-radius: 3px 3px 3px 3px; }

.ui-menu .ui-menu {
        margin-top: -3px;
}
.ui-menu .ui-menu-item {
        margin:0;
        padding: 0;
        zoom: 1;
        float: left;
        clear: left;
        width: 100%;
        font-family:arial;
}
.ui-menu .ui-menu-item a {
        text-decoration:none;
        display:block;
        padding:.1em .3em;
        line-height:1.5;
        zoom:1;
}
.ui-menu .ui-menu-item a.ui-state-hover, .ui-menu .ui-menu-item a.ui-state-active {
        font-weight: bold;
}
</style>
<script>

$(document).ready(function() {
    
    var aTags = ["ask","always", "all", "alright", "one", "foo", "blackberry", "tweet","force9", "westerners", "sport"];

    $( "#tags" ).autocomplete({
        source: aTags
    });
    
});

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

<input type='text' title='Tags' id='tags' />


</div>
<div class="container footer-image" >
</div>
</body>
</html>
</body>
</html>