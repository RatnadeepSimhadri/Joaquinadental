<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Fonts used -->

<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Crimson+Text" />
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Fjord+One" />

<!-- End of Fonts used -->
  
  <link rel="stylesheet" href="http://cdn.datatables.net/plug-ins/725b2a2115b/integration/bootstrap/3/dataTables.bootstrap.css"> 
   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">  
<link rel="stylesheet" href="https://rawgit.com/wenzhixin/bootstrap-table/master/dist/bootstrap-table.min.css">
   <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css">
  
   <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.css">
   <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
   <link rel="stylesheet" href="https://rawgit.com/wenzhixin/bootstrap-table/master/src/bootstrap-table.css">
  
    
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="http://cdn.datatables.net/plug-ins/725b2a2115b/integration/bootstrap/3/dataTables.bootstrap.js"></script>

 <script src="../js/bootstrap.min.js"></script>

  <script src="https://rawgit.com/wenzhixin/bootstrap-table/master/src/bootstrap-table.js"></script>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.10.0/lodash.min.js"></script>
  
  <script src="https://rawgit.com/wenzhixin/bootstrap-table/master/dist/bootstrap-table.min.js"></script>
  
  <link href="../css/stylish-portfolio.css" rel="stylesheet">

<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<style type="text/css">


  #mainview{
padding-top:40%;
}  
        
        
</style>


<link href="css/stylish-portfolio.css" rel="stylesheet">

<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<script>
      
$(function() {
	    $("#datepicker").datepicker();
	  });
      
      var data = ${jsondata};
         

      $(function () {
    	  $('#table').bootstrapTable({
	          data: data
	      });
    	  
    	  $('#table').on('click-row.bs.table', function (e, row, $element) {
    		  $('.success').removeClass('success');
          		$($element).addClass('success');
        	});
          $('#editbutton').click(function () {
          		
        	   
        	  var shrs=(getSelectedRow().appointment_time).substring(0,2);
        	  var ihrs= parseInt(shrs);
        	  if(ihrs <6){
        		  ihrs=ihrs+12;
        		       	  }
        	  var hrs= ihrs.toString();
        	  
        	  
        	   $("#h_appt_id").val(getSelectedRow().appointment_id);
        	   $("#h_pat_name").val(getSelectedRow().patientName);
        	   $("#h_doc_name").val(getSelectedRow().dentistName);
        	   $("#h_appt_date").val(getSelectedRow().appointment_Date);
        	   $("#h_appt_hrs").val(hrs);
        	  
        	   
          });
         
          $("#dialog").dialog({
        	   autoOpen: false,
        	   modal: true,
        	   buttons : {
        	        "Confirm" : function() {
        	        	$("#h_appt_id").val(getSelectedRow().appointment_id);
        	        	document.getElementById("crud").submit();
        	        },
        	        "Cancel" : function() {
        	          $(this).dialog("close");
        	        }
        	      }
        	    });

        	$("#cancelbutton").on("click", function(e) {
        	    e.preventDefault();
        	    $("#dialog").dialog("open");
        	});
        	
        	 

        	$(document.body ).on( 'click', '.dropdown-menu li', function( event ) {
        	   
        	      var $target = $( event.currentTarget );
                  alert("hi");
        	      $target.closest( '.btn-group' )
        	         .find( '[data-bind="label"]' ).text( $target.text() )
        	            .end()
        	         .children( '.dropdown-toggle' ).dropdown( 'toggle' );

        	      return false;

        	   });
        	
        	
        	
         /*  $("#date_picker_2").datepicker({autoclose:true}); */
          
          $(".dropdown-menu li a").click(function(){
         	 var selText = $(this).text();
         	  $(this).parents('.btn-group').find('.dropdown-toggle').html(selText+' <span class="caret"></span>');
         	  
         	  $("#docdropdown").val(selText);	
          });  
        
          
      });

      function getSelectedRow() {
    	  
    	 var index = $('#table').find('tr.success').data('index');
          return $('#table').bootstrapTable('getData')[index];}
      
        	
    	
    
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
				<li><a href="../aboutUs.html#intro">ABOUT US</a></li>
				<li><a href="../index.jsp">LOGOUT</a></li>
				<li><a href="#footer">CONTACT US</a></li>
			</ul>
		</div>
		
	</header>
	
	<section id="mainview">
<div class="container main-content"  >
<div class="row" >
    <div  class="col-sm-4 hidden-xs"><h2 style="font-family: 'Fjord One' , sans-serif;color:rgba(53, 144, 180, 0.64)" align="center">Notifications</h2></div>
    <div  class="col-sm-8" style="font-family: 'Fjord One' , sans-serif" align="center"><h2 style="font-family: 'Fjord One' , sans-serif;color:rgba(53, 144, 180, 0.64)">Search Appointments</h2></div>
 </div>
 
 <div class="row">
 
 <div class="col-md-4 hidden-xs"></div>
 <div class="col-md-8">
   <h3 style="font-family: 'Crimson text', sans-serif;font-size:1.5em;color:rgba(53, 144, 180, 0.64)">${statusmsg}</h3>
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
   

 <div class="col-sm-8" style= "font-family: 'Crimson text', sans-serif;">
 <div class="row">

<form name="admappt" action="/siteapp/admappt" method="post">
<!-- <input type="hidden" id="docdropdown" name="docdropdown"> -->

    <div class="col-xs-18 col-sm-3 col-md-3">
  <input type="text" name="patientid" id="patientid" placeholder="Enter Patient ID" style="float:left;height:34px" >
    </div>
  <div class="col-xs-18 col-sm-3 col-md-3">
  
  
 
 <div class="form-group" align="center">
        <select name="docdropdown" class="form-control" id="docdropdown" >
        <option value="" disabled selected>List of Doctors</option>
        <option>Jeffrey Hill</option>
        <option>Alton Watson</option>
        <option>Clinton Reid</option>
        <option>Micheal Chandler</option>
        <option>Lori LoVette</option>
        </select>
       
    </div>
    
  </div>
  <div class="col-xs-18 col-sm-3 col-md-3">
  <div class="form-group">
         <input type="text" class="form-control" value=" Date: ${Editlist.appointment_Date}" id="datepicker" name="val_date_picker">
         </div>

   </div>   
      
      
      <div class="col-xs-18 col-sm-3 col-md-3">
      <!-- <div style="float:left;padding-left:2.5%"> -->
      
       <input type="submit" class="btn btn-info" value="Submit" >
      
       </div>
       
        
   </form>    
  </div>
  
  
<div class="row" >
<form id="crud" action="/siteapp/CancelAppointment" method="post">


<input type="hidden" id="h_appt_id" name="h_appt_id">
<input type="hidden" id="h_pat_name" name="h_pat_name" >
<input type="hidden" id="h_doc_name" name="h_doc_name" >
<input type="hidden" id="h_appt_date" name="h_appt_date" >
<input type="hidden" id="h_appt_hrs" name="h_appt_hrs" >

       <div class="col-xs-18 col-sm-3 col-md-3">
              <button type="submit" name="addbutton" id="addbutton" class="btn btn-primary btn-lg btn-block" formmethod="post" formaction="/siteapp/BookAppointmentAdmin">Add Appointment</button>
              </div>
       <div class="col-xs-18 col-sm-3 col-md-3">
       <button type="submit" name="editbutton" id="editbutton" class="btn btn-primary btn-lg btn-block"  formmethod="post" formaction="/siteapp/EditAppointment">Edit Appointment</button> 
       </div>
       <div class="col-xs-18 col-sm-3 col-md-3">
       <button id="cancelbutton" class="btn btn-danger btn-lg btn-block" style="background-color: #f44336">Cancel Appointment</button>
       <div id="dialog" title="Confirmation Required">
  			<span>Are you sure about this</span>
		</div></div><div class="col-xs-18 col-sm-3 col-md-3"><button id="checkinbutton" class="btn btn-primary btn-lg btn-block " disabled>Appointment Check In</button></div>
		
</form>
</div>
        
        
        
<div class="row">
<div class="col-xs-18 col-sm-12 col-md-12">
<div id="tablediv">


<table id="table" class="table table-striped table-hover"
 data-pagination="true"
               data-click-to-select="true"
               data-toolbar=".toolbar"  >
           
    <thead class="filters">
     <tr>
        <th data-field="appointment_id" data-sortable="true" data-align="center" >Appointment ID</th>
        <th data-field="patientName" data-sortable="true" data-align="center" > Patient Name </th>
        <th data-field="dentistName" data-sortable="true" data-align="center">Dentist Name</th>
        <th data-field="appointment_Date" data-sortable="true" data-align="center">Appointment Date</th>
        <th data-field="appointment_time" data-sortable="true" data-align="center">Appointment Time</th>
    </tr>
    </thead>
</table>
       </div>   
       </div> 
       </div>
    
</div>
</div>

</div>

</section>
	<!-- Footer -->
	<footer>
		<div class="container-fluid">
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
			<center>Copyright &copy; JoaquinaDental 2016. All rights
				reserved.
		</div>
	</footer>
</body>
</html>