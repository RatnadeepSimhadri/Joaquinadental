<%@ page language="java" contentType="text/html; charset=charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%-- For Dropdown css --%>
<style>
.btn-input {
   display: block;
}

.btn-input .btn.form-control {
    text-align: left;
}

.btn-input .btn.form-control span:first-child {
   left: 10px;
   overflow: hidden;
   position: absolute;
   right: 25px;
}

.btn-input .btn.form-control .caret {
   margin-top: -1px;
   position: absolute;
   right: 10px;
   top: 50%;
}
</style>


  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://cdn.datatables.net/plug-ins/725b2a2115b/integration/bootstrap/3/dataTables.bootstrap.css"> 
   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">  
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://rawgit.com/wenzhixin/bootstrap-table/master/dist/bootstrap-table.min.css">
   <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css">
 <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
  
   <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
   <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.css">
   <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
   <link rel="stylesheet" href="https://rawgit.com/wenzhixin/bootstrap-table/master/src/bootstrap-table.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="http://cdn.datatables.net/plug-ins/725b2a2115b/integration/bootstrap/3/dataTables.bootstrap.js"></script>
<script src="http://rawgit.com/hhurz/tableExport.jquery.plugin/master/tableExport.js"></script>
   


 <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
 <script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
 
 
 
  
  <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/js/bootstrap.min.js"></script>
  

  <script src="https://rawgit.com/wenzhixin/bootstrap-table/master/src/bootstrap-table.js"></script>


  <script src="https://rawgit.com/wenzhixin/bootstrap-table/master/src/extensions/export/bootstrap-table-export.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.10.0/lodash.min.js"></script>

  
  <script src="https://rawgit.com/wenzhixin/bootstrap-table/master/dist/bootstrap-table.min.js"></script>
<script>
      
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
          		
        	   
        	  var hrs=(getSelectedRow().appointment_time).substring(0,2);
        	  var mins=(getSelectedRow().appointment_time).substring(3,5);
        	  
        	   $("#h_appt_id").val(getSelectedRow().appointment_id);
        	   $("#h_pat_name").val(getSelectedRow().patientName);
        	   $("#h_doc_name").val(getSelectedRow().dentistName);
        	   $("#h_appt_date").val(getSelectedRow().appointment_Date);
        	   $("#h_appt_hrs").val(hrs);
        	   $("#h_appt_mins").val(mins);
        	   
          });
         
          $("#dialog").dialog({
        	   autoOpen: false,
        	   modal: true,
        	   buttons : {
        	        "Confirm" : function() {
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
        	
        	

        	$( document.body ).on( 'click', '.dropdown-menu li', function( event ) {
        	   
        	      var $target = $( event.currentTarget );

        	      $target.closest( '.btn-group' )
        	         .find( '[data-bind="label"]' ).text( $target.text() )
        	            .end()
        	         .children( '.dropdown-toggle' ).dropdown( 'toggle' );

        	      return false;

        	   });
          $("#date_picker_2").datepicker({autoclose:true});
          
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
			<form role="form" action="siteapp/login" method="post">
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
<form name="admappt" action="/siteapp/admappt" method="post">
<div class="form-group" style="margin-top:2%">
    
   
  <input type="text" name="patientid" id="patientid" placeholder="Enter Patient ID" style="float:left;height:34px" >
    
  <input type="hidden" id="docdropdown" name="docdropdown" >
  
  <div class="btn-group" style="padding-left:2.5%;float:left">
                 <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" id="testbtn">
                   <span data-bind="label">List of Doctors</span>&nbsp;<span class="caret"></span>
                 </button>
                 <ul class="dropdown-menu" role="menu">
                   <li><a href="#">Jeffrey Hill</a></li>
                   <li><a href="#">Alton Watson</a></li>
                   <li><a href="#">Clinton Reid</a></li>
                   <li><a href="#">Micheal Chandler</a></li>
                   <li><a href="#">Lori LoVette</a></li>
                 </ul>
                
  </div>
  

      
       <div class="input-group" style="width:20%;padding-left:2.5%;float:left">
                <input id="date_picker_2" name="val_date_picker" type="text" class="date-picker form-control" style="height:2%" />
                <label for="date_picker_2" class="input-group-addon btn"><span class="glyphicon glyphicon-calendar"></span>
                </label>
                
            </div>
      <div style="float:left;padding-left:2.5%">
      
       <input type="submit" class="btn btn-info" value="Submit" >
       </div>
       
       
       </div>
	
   </form>    
  
  
  
  <br>
  <br>
<form name="crud" action="/siteapp/CancelAppointment">

<input type="hidden" id="h_appt_id" name="h_appt_id" >
<input type="hidden" id="h_pat_name" name="h_pat_name" >
<input type="hidden" id="h_doc_name" name="h_doc_name" >
<input type="hidden" id="h_appt_date" name="h_appt_date" >
<input type="hidden" id="h_appt_hrs" name="h_appt_hrs" >
<input type="hidden" id="h_appt_mins" name="h_appt_mins" >
       <button type="submit" name="addbutton" id="addbutton" class="btn btn-info" role="button" formmethod="post" formaction="/siteapp/BookAppointment.jsp">Add Appointment</button>
           <button type="submit" name="editbutton" id="editbutton" class="btn btn-warning" role="button" formmethod="post" formaction="/siteapp/EditAppointment.jsp">EditAppointment</button> 
          <button id="cancelbutton" class="btn btn-danger" role="button">Cancel Appointment</button>
            <div id="dialog" title="Confirmation Required">
  			Are you sure about this?
			</div>​
           <button id="checkinbutton" class="btn btn-success" role="button">Appointment Check-In</button>
           </form>
        </div>

<div id="tablediv">


<table id="table" class="table table-striped table-hover"
 data-pagination="true"
               data-click-to-select="true"
               data-toolbar=".toolbar"  >
           
    <thead class="filters">
     <tr>
        <th data-field="appointment_id" data-align="right" >Appointment ID</th>
        <th data-field="patientName" data-align="center" > Patient Name </th>
        <th data-field="dentistName">Dentist Name</th>
        <th data-field="appointment_Date">Appointment Date</th>
        <th data-field="appointment_time">Appointment Time</th>
    </tr>
    </thead>
</table>
           
    
</div>




</div>

<div class="container footer-image" >
</div>
</body>
</html>