<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.min.css" rel="stylesheet">

<link href="../css/stylish-portfolio.css" rel="stylesheet">

<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<link rel="stylesheet" type="text/css" href="../css/main.css">

<script src="../js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../js/bootstrap.min.js"></script>

<!-- Scrolling Nav JavaScript -->
<script src="../js/jquery.easing.min.js"></script>
<script src="../js/scrolling-nav.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>



<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script>
	function ticker() {
	    $('#ticker li:first').slideUp(function() {
	        $(this).appendTo($('#ticker')).slideDown();
	    });
	}
	setInterval(ticker, 3000);
</script>

<script>
	$(document)
			.ready(
					function() {
						var i = 1;
						$("#add_row")
								.click(
										function() {
											/*   $('#addr'+i).html("<td>"+ (i+1) +"</td><td><input name='name"+i+"' id = 'tags' placeholder='Service' class='form-control'  /></td>"); */
											$('#addr' + i)
													.html(
															"<td>"
																	+ (i + 1)
																	+ "</td><td><div><select id = 'ddown' class='form-control'> <option value='periodic oral evaluation - established patient'>periodic oral evaluation - established patient</option><option value='limited oral evaluation - problem focused'>limited oral evaluation - problem focused</option>"
																	+ "<option value='comprehensive oral evaluation - new or established'>comprehensive oral evaluation - new or established</option>"
																	+ "<option value='intraoral - complete series (including bitewings)'>intraoral - complete series (including bitewings)</option>"
																	+ "<option value='intraoral - periapical first film'>intraoral - periapical first film</option>"
																	+ "<option value='intraoral - periapical each additional film'>intraoral - periapical each additional film</option>"
																	+ "<option value='bitewing - single film'>bitewing - single film</option>"
																	+ "<option value='bitewings - two films'>bitewings - two films</option>"
																	+ "<option value='bitewings - three films'>bitewings - three films</option>"
																	+ "<option value='bitewings - four films'>bitewings - four films</option>"
																	+ "<option value='panoramic film'>panoramic film</option>"
																	+ "<option value='prophylaxis - adult'>prophylaxis - adult</option>"
																	+ "<option value='prophylaxis - child'>prophylaxis - child</option>"
																	+ "<option value='sealant - per tooth'>sealant - per tooth</option>"
																	+ "<option value='space maintainer - fixed - unilateral'>space maintainer - fixed - unilateral</option>"
																	+ "<option value='space maintainer - fixed - bilateral'>space maintainer - fixed - bilateral</option>"
																	+ "<option value='space maintainer - removable - unilateral'>space maintainer - removable - unilateral</option>"
																	+ "<option value='space maintainer - removable - bilateral'>space maintainer - removable - bilateral</option>"
																	+ "<option value='amalgam - one surface, primary or permanent'>amalgam - one surface, primary or permanent</option>"
																	+ "<option value='amalgam - two surfaces, primary or permanent'>amalgam - two surfaces, primary or permanent</option>"
																	+ "<option value='amalgam - three surfaces, primary or permanent'>amalgam - three surfaces, primary or permanent</option>"
																	+ "<option value='amalgam - four or more surfaces, primary or perman'>amalgam - four or more surfaces, primary or perman</option>"
																	+ "<option value='resin-based composite - one surface, anterior'>resin-based composite - one surface, anterior</option>"
																	+ "<option value='resin-based composite - two surfaces, anterior'>resin-based composite - two surfaces, anterior</option>"
																	+ "<option value='resin-based composite - three surfaces, anterior'>resin-based composite - three surfaces, anterior</option>"
																	+ "<option value='resin-based composite - four or more surfaces or i'>resin-based composite - four or more surfaces or i</option>"
																	+ "<option value='resin-based composite - one surface, posterior'>resin-based composite - one surface, posterior</option>"
																	+ "<option value='resin-based composite - two surfaces, posterior'>resin-based composite - two surfaces, posterior</option>"
																	+ "<option value='resin-based composite - three surfaces, posterior'>resin-based composite - three surfaces, posterior</option>"
																	+ "<option value='resin-based composite - four or more surfaces, pos'>resin-based composite - four or more surfaces, pos</option>"
																	+ "<option value='crown - resin-based composite (indirect)'>crown - resin-based composite (indirect)</option>"
																	+ "<option value='crown - resin with high noble metal'>crown - resin with high noble metal</option>"
																	+ "<option value='crown - porcelain fused to high noble metal'>crown - porcelain fused to high noble metal</option>"
																	+ "<option value='crown - porcelain fused to predominantly base meta'>crown - porcelain fused to predominantly base meta</option>"
																	+ "<option value='crown - porcelain fused to noble metal'>crown - porcelain fused to noble metal</option>"
																	+ "<option value='crown - full cast high noble metal'>crown - full cast high noble metal</option>"
																	+ "<option value='crown - full cast predominantly base metal'>crown - full cast predominantly base metal</option>"
																	+ "<option value='prefabricated stainless steel crown - primary toot'>prefabricated stainless steel crown - primary toot</option>"
																	+ "<option value='prefabricated stainless steel crown - permanent to'>prefabricated stainless steel crown - permanent to</option>"
																	+ "<option value='core buildup, including any pins'>core buildup, including any pins</option>"
																	+ "<option value='pin retention - per tooth, in addition to restorat'>pin retention - per tooth, in addition to restorat</option>"
																	+ "<option value='post and core in addition to crown, indirectly fab'>post and core in addition to crown, indirectly fab</option>"
																	+ "<option value='prefabricated post and core in addition to crown'>prefabricated post and core in addition to crown</option>"
																	+ "<option value='pulp cap - direct (excluding final restoration)'>pulp cap - direct (excluding final restoration)</option>"
																	+ "<option value='pulp cap - indirect (excluding final restoration)'>pulp cap - indirect (excluding final restoration)</option>"
																	+ "<option value='therapeutic pulpotomy (excluding final restoration'>therapeutic pulpotomy (excluding final restoration</option>"
																	+ "<option value='endodontic therapy, anterior tooth (excluding fina'>endodontic therapy, anterior tooth (excluding fina</option>"
																	+ "<option value='endodontic therapy, bicuspid tooth (excluding fina'>endodontic therapy, bicuspid tooth (excluding fina</option>"
																	+ "<option value='endodontic therapy, molar (excluding final restora'>endodontic therapy, molar (excluding final restora</option>"
																	+ "<option value='gingivectomy or gingivoplasty - four or more conti'>gingivectomy or gingivoplasty - four or more conti</option>"
																	+ "<option value='periodontal scaling and root planing - four or mor'>periodontal scaling and root planing - four or mor</option>"
																	+ "<option value='periodontal maintenance'>periodontal maintenance</option>"
																	+ "<option value='complete denture - maxillary'>complete denture - maxillary</option>"
																	+ "<option value='complete denture - mandibular'>complete denture - mandibular</option>"
																	+ "<option value='immediate denture - maxillary'>immediate denture - maxillary</option>"
																	+ "<option value='immediate denture - mandibular'>immediate denture - mandibular</option>"
																	+ "<option value='maxillary partial denture - resin base (including '>maxillary partial denture - resin base (including </option>"
																	+ "<option value='mandibular partial denture - resin base (including'>mandibular partial denture - resin base (including</option>"
																	+ "<option value='maxillary partial denture - cast metal framework w'>maxillary partial denture - cast metal framework w</option>"
																	+ "<option value='mandibular partial denture - cast metal framework '>mandibular partial denture - cast metal framework </option>"
																	+ "<option value='adjust complete denture - maxillary'>adjust complete denture - maxillary</option>"
																	+ "<option value='adjust complete denture - mandibular'>adjust complete denture - mandibular</option>"
																	+ "<option value='repair broken complete denture base'>repair broken complete denture base</option>"
																	+ "<option value='replace missing or broken teeth - complete denture'>replace missing or broken teeth - complete denture</option>"
																	+ "<option value='repair or replace broken clasp'>repair or replace broken clasp</option>"
																	+ "<option value='add tooth to existing partial denture'>add tooth to existing partial denture</option>"
																	+ "<option value='add clasp to existing partial denture'>add clasp to existing partial denture</option>"
																	+ "<option value='reline complete maxillary denture (chairside)'>reline complete maxillary denture (chairside)</option>"
																	+ "<option value='reline complete mandibular denture (chairside)'>reline complete mandibular denture (chairside)</option>"
																	+ "<option value='reline maxillary partial denture (chairside)'>reline maxillary partial denture (chairside)</option>"
																	+ "<option value='reline mandibular partial denture (chairside)'>reline mandibular partial denture (chairside)</option>"
																	+ "<option value='reline complete maxillary denture (laboratory)'>reline complete maxillary denture (laboratory)</option>"
																	+ "<option value='reline complete mandibular denture (laboratory)'>reline complete mandibular denture (laboratory)</option>"
																	+ "<option value='pontic - porcelain fused to high noble metal'>pontic - porcelain fused to high noble metal</option>"
																	+ "<option value='pontic - porcelain fused to predominantly base met'>pontic - porcelain fused to predominantly base met</option>"
																	+ "<option value='pontic - porcelain fused to noble metal'>pontic - porcelain fused to noble metal</option>"
																	+ "<option value='crown - porcelain fused to high noble metal'>crown - porcelain fused to high noble metal</option>"
																	+ "<option value='crown - porcelain fused to predominantly base meta'>crown - porcelain fused to predominantly base meta</option>"
																	+ "<option value='crown - porcelain fused to noble metal'>crown - porcelain fused to noble metal</option>"
																	+ "<option value='extraction, erupted tooth or exposed root (elevati'>extraction, erupted tooth or exposed root (elevati</option>"
																	+ "<option value='surgical removal of erupted tooth requiring remova'>surgical removal of erupted tooth requiring remova</option>"
																	+ "<option value='removal of impacted tooth - soft tissue'>removal of impacted tooth - soft tissue</option>"
																	+ "<option value='removal of impacted tooth - partially bony'>removal of impacted tooth - partially bony</option>"
																	+ "<option value='removal of impacted tooth - completely bony'>removal of impacted tooth - completely bony</option>"
																	+ "<option value='surgical removal of residual tooth roots (cutting '>surgical removal of residual tooth roots (cutting </option>"
																	+ "<option value='alveoloplasty in conjunction with extractions - fo'>alveoloplasty in conjunction with extractions - fo</option>"
																	+ "<option value='alveoloplasty not in conjunction with extractions '>alveoloplasty not in conjunction with extractions </option>"
																	+ "<option value='incision and drainage of abscess - intraoral soft '>incision and drainage of abscess - intraoral soft </option>"
																	+ "<option value='palliative (emergency) treatment of dental pain - '>palliative (emergency) treatment of dental pain - </option>"
																	+ "<option value='local anesthesia in conjunction with operative or '>local anesthesia in conjunction with operative or </option>"
																	+ "<option value='inhalation of nitrous oxide / anxiolysis, analgesi'>inhalation of nitrous oxide / anxiolysis, analgesi</option>"
																	+ "<option value='occlusal adjustment - limited'>occlusal adjustment - limited</option>"
																	+ "<option value='occlusal adjustment - complete'>occlusal adjustment - complete</option>"
																	+ "</select></div></td>");
											$('#tab_logic').append(
													'<tr id="addr' + (i + 1)
															+ '"></tr>');
											i++;
										});
						$("#delete_row").click(function() {
							if (i > 1) {
								$("#addr" + (i - 1)).html('');
								i--;
							}
						});

					});
</script>
<style>
#mncontent {
	padding: 2%;
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
				<li><a href="">LOGOUT</a></li>
				<li><a href="#footer">CONTACT US</a></li>
			</ul>
		</div>
	</header>


	<section id='mncontent'>
		<div class="container">
			<div class="row clearfix">

				<div class="col-sm-4 hidden-xs">
					<h2
						style="font-family: 'Fjord One', sans-serif; color: rgba(53, 144, 180, 0.64)"
						align="center">Notifications</h2>
				</div>
				<div class="col-sm-8" style="font-family: 'Fjord One', sans-serif"
					align="center">
					<h2
						style="font-family: 'Fjord One', sans-serif; color: rgba(53, 144, 180, 0.64)">Account
						Details</h2>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-4 hidden-xs"></div>
				<div class="col-sm-8" align="center"
					style="font-family: 'Crimson text', sans-serif; font-size: 1.2em">
					<h4>Your account balance amount due is $ ${balance}</h4>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-4 hidden-xs"
					style="font-family: 'Crimson text', sans-serif; margin-left: 0px; font-size: 1.8em">
					<!--  	<div class="demo1"> -->
					<div>
						<c:if test="${not empty notifications }">
							<div class="ticker" style="font-family: 'Crimson text', sans-serif;">
								<ul id="ticker"
									style="font-family: 'Crimson text', sans-serif; font-size: 0.7em">
									<c:forEach var="notification" items="${notifications}">
										<li>${notification}</li>


									</c:forEach>
								</ul>
							</div>
						</c:if>

					</div>
					<!-- </div> -->
				</div>

				<div class="col-md-8 column">
					<span class="lead">Appointment ID: &nbsp;&nbsp;</span> <span
						class="lead">Doctor's Name: &nbsp;&nbsp;</span> <span class="lead">Patient
						Name: &nbsp;&nbsp;</span> <br>
					<br>

					<form class="form-inline">
						<div class="col-sm-6 form-group">
							<label>Visit Date</label> <input id="" placeholder="" type="text"
								class="form-control"></input>
						</div>
						<div class="col-sm-6 form-group">
							<label>Visit Time</label> <input id="" placeholder="" type="text"
								class="form-control"></input>
						</div>

					</form>
					<br> <br>
					<br>
					<table class="table table-bordered table-hover" id="tab_logic">
						<thead>
							<tr>
								<th class="text-center">#</th>
								<th class="text-center">Service(s)</th>
							</tr>
						</thead>
						<tbody>
							<tr id='addr0'>
								<td>1</td>
								<td>
									<!-- <input id = "tags" type="text" name='name0'  placeholder='Name' class="form-control"/> -->

									<div>
										<select id='ddown' class="form-control">
											<option
												value='periodic oral evaluation - established patient'>periodic
												oral evaluation - established patient</option>
											<option value='limited oral evaluation - problem focused'>limited
												oral evaluation - problem focused</option>
											<option
												value='comprehensive oral evaluation - new or established'>comprehensive
												oral evaluation - new or established</option>
											<option
												value='intraoral - complete series (including bitewings)'>intraoral
												- complete series (including bitewings)</option>
											<option value='intraoral - periapical first film'>intraoral
												- periapical first film</option>
											<option value='intraoral - periapical each additional film'>intraoral
												- periapical each additional film</option>
											<option value='bitewing - single film'>bitewing -
												single film</option>
											<option value='bitewings - two films'>bitewings -
												two films</option>
											<option value='bitewings - three films'>bitewings -
												three films</option>
											<option value='bitewings - four films'>bitewings -
												four films</option>
											<option value='panoramic film'>panoramic film</option>
											<option value='prophylaxis - adult'>prophylaxis -
												adult</option>
											<option value='prophylaxis - child'>prophylaxis -
												child</option>
											<option value='sealant - per tooth'>sealant - per
												tooth</option>
											<option value='space maintainer - fixed - unilateral'>space
												maintainer - fixed - unilateral</option>
											<option value='space maintainer - fixed - bilateral'>space
												maintainer - fixed - bilateral</option>
											<option value='space maintainer - removable - unilateral'>space
												maintainer - removable - unilateral</option>
											<option value='space maintainer - removable - bilateral'>space
												maintainer - removable - bilateral</option>
											<option value='amalgam - one surface, primary or permanent'>amalgam
												- one surface, primary or permanent</option>
											<option value='amalgam - two surfaces, primary or permanent'>amalgam
												- two surfaces, primary or permanent</option>
											<option
												value='amalgam - three surfaces, primary or permanent'>amalgam
												- three surfaces, primary or permanent</option>
											<option
												value='amalgam - four or more surfaces, primary or perman'>amalgam
												- four or more surfaces, primary or perman</option>
											<option value='resin-based composite - one surface, anterior'>resin-based
												composite - one surface, anterior</option>
											<option
												value='resin-based composite - two surfaces, anterior'>resin-based
												composite - two surfaces, anterior</option>
											<option
												value='resin-based composite - three surfaces, anterior'>resin-based
												composite - three surfaces, anterior</option>
											<option
												value='resin-based composite - four or more surfaces or i'>resin-based
												composite - four or more surfaces or i</option>
											<option
												value='resin-based composite - one surface, posterior'>resin-based
												composite - one surface, posterior</option>
											<option
												value='resin-based composite - two surfaces, posterior'>resin-based
												composite - two surfaces, posterior</option>
											<option
												value='resin-based composite - three surfaces, posterior'>resin-based
												composite - three surfaces, posterior</option>
											<option
												value='resin-based composite - four or more surfaces, pos'>resin-based
												composite - four or more surfaces, pos</option>
											<option value='crown - resin-based composite (indirect)'>crown
												- resin-based composite (indirect)</option>
											<option value='crown - resin with high noble metal'>crown
												- resin with high noble metal</option>
											<option value='crown - porcelain fused to high noble metal'>crown
												- porcelain fused to high noble metal</option>
											<option
												value='crown - porcelain fused to predominantly base meta'>crown
												- porcelain fused to predominantly base meta</option>
											<option value='crown - porcelain fused to noble metal'>crown
												- porcelain fused to noble metal</option>
											<option value='crown - full cast high noble metal'>crown
												- full cast high noble metal</option>
											<option value='crown - full cast predominantly base metal'>crown
												- full cast predominantly base metal</option>
											<option
												value='prefabricated stainless steel crown - primary toot'>prefabricated
												stainless steel crown - primary toot</option>
											<option
												value='prefabricated stainless steel crown - permanent to'>prefabricated
												stainless steel crown - permanent to</option>
											<option value='core buildup, including any pins'>core
												buildup, including any pins</option>
											<option
												value='pin retention - per tooth, in addition to restorat'>pin
												retention - per tooth, in addition to restorat</option>
											<option
												value='post and core in addition to crown, indirectly fab'>post
												and core in addition to crown, indirectly fab</option>
											<option
												value='prefabricated post and core in addition to crown'>prefabricated
												post and core in addition to crown</option>
											<option
												value='pulp cap - direct (excluding final restoration)'>pulp
												cap - direct (excluding final restoration)</option>
											<option
												value='pulp cap - indirect (excluding final restoration)'>pulp
												cap - indirect (excluding final restoration)</option>
											<option
												value='therapeutic pulpotomy (excluding final restoration'>therapeutic
												pulpotomy (excluding final restoration</option>
											<option
												value='endodontic therapy, anterior tooth (excluding fina'>endodontic
												therapy, anterior tooth (excluding fina</option>
											<option
												value='endodontic therapy, bicuspid tooth (excluding fina'>endodontic
												therapy, bicuspid tooth (excluding fina</option>
											<option
												value='endodontic therapy, molar (excluding final restora'>endodontic
												therapy, molar (excluding final restora</option>
											<option
												value='gingivectomy or gingivoplasty - four or more conti'>gingivectomy
												or gingivoplasty - four or more conti</option>
											<option
												value='periodontal scaling and root planing - four or mor'>periodontal
												scaling and root planing - four or mor</option>
											<option value='periodontal maintenance'>periodontal
												maintenance</option>
											<option value='complete denture - maxillary'>complete
												denture - maxillary</option>
											<option value='complete denture - mandibular'>complete
												denture - mandibular</option>
											<option value='immediate denture - maxillary'>immediate
												denture - maxillary</option>
											<option value='immediate denture - mandibular'>immediate
												denture - mandibular</option>
											<option
												value='maxillary partial denture - resin base (including '>maxillary
												partial denture - resin base (including</option>
											<option
												value='mandibular partial denture - resin base (including'>mandibular
												partial denture - resin base (including</option>
											<option
												value='maxillary partial denture - cast metal framework w'>maxillary
												partial denture - cast metal framework w</option>
											<option
												value='mandibular partial denture - cast metal framework '>mandibular
												partial denture - cast metal framework</option>
											<option value='adjust complete denture - maxillary'>adjust
												complete denture - maxillary</option>
											<option value='adjust complete denture - mandibular'>adjust
												complete denture - mandibular</option>
											<option value='repair broken complete denture base'>repair
												broken complete denture base</option>
											<option
												value='replace missing or broken teeth - complete denture'>replace
												missing or broken teeth - complete denture</option>
											<option value='repair or replace broken clasp'>repair
												or replace broken clasp</option>
											<option value='add tooth to existing partial denture'>add
												tooth to existing partial denture</option>
											<option value='add clasp to existing partial denture'>add
												clasp to existing partial denture</option>
											<option value='reline complete maxillary denture (chairside)'>reline
												complete maxillary denture (chairside)</option>
											<option
												value='reline complete mandibular denture (chairside)'>reline
												complete mandibular denture (chairside)</option>
											<option value='reline maxillary partial denture (chairside)'>reline
												maxillary partial denture (chairside)</option>
											<option value='reline mandibular partial denture (chairside)'>reline
												mandibular partial denture (chairside)</option>
											<option
												value='reline complete maxillary denture (laboratory)'>reline
												complete maxillary denture (laboratory)</option>
											<option
												value='reline complete mandibular denture (laboratory)'>reline
												complete mandibular denture (laboratory)</option>
											<option value='pontic - porcelain fused to high noble metal'>pontic
												- porcelain fused to high noble metal</option>
											<option
												value='pontic - porcelain fused to predominantly base met'>pontic
												- porcelain fused to predominantly base met</option>
											<option value='pontic - porcelain fused to noble metal'>pontic
												- porcelain fused to noble metal</option>
											<option value='crown - porcelain fused to high noble metal'>crown
												- porcelain fused to high noble metal</option>
											<option
												value='crown - porcelain fused to predominantly base meta'>crown
												- porcelain fused to predominantly base meta</option>
											<option value='crown - porcelain fused to noble metal'>crown
												- porcelain fused to noble metal</option>
											<option
												value='extraction, erupted tooth or exposed root (elevati'>extraction,
												erupted tooth or exposed root (elevati</option>
											<option
												value='surgical removal of erupted tooth requiring remova'>surgical
												removal of erupted tooth requiring remova</option>
											<option value='removal of impacted tooth - soft tissue'>removal
												of impacted tooth - soft tissue</option>
											<option value='removal of impacted tooth - partially bony'>removal
												of impacted tooth - partially bony</option>
											<option value='removal of impacted tooth - completely bony'>removal
												of impacted tooth - completely bony</option>
											<option
												value='surgical removal of residual tooth roots (cutting '>surgical
												removal of residual tooth roots (cutting</option>
											<option
												value='alveoloplasty in conjunction with extractions - fo'>alveoloplasty
												in conjunction with extractions - fo</option>
											<option
												value='alveoloplasty not in conjunction with extractions '>alveoloplasty
												not in conjunction with extractions</option>
											<option
												value='incision and drainage of abscess - intraoral soft '>incision
												and drainage of abscess - intraoral soft</option>
											<option
												value='palliative (emergency) treatment of dental pain - '>palliative
												(emergency) treatment of dental pain -</option>
											<option
												value='local anesthesia in conjunction with operative or '>local
												anesthesia in conjunction with operative or</option>
											<option
												value='inhalation of nitrous oxide / anxiolysis, analgesi'>inhalation
												of nitrous oxide / anxiolysis, analgesi</option>
											<option value='occlusal adjustment - limited'>occlusal
												adjustment - limited</option>
											<option value='occlusal adjustment - complete'>occlusal
												adjustment - complete</option>


										</select>
									</div>
								</td>

							</tr>
							<tr id='addr1'></tr>
						</tbody>
					</table>
					<div class="row">
						<a id="add_row" class="btn btn-default pull-left">Add Row</a><a
							id='delete_row' class="pull-right btn btn-default">Delete Row</a>
					</div>
					&nbsp;
					<div class="row">
						<a id="calc" class="btn btn-primary pull-left">Calculate</a><a
							id='sub' class="pull-right btn btn-success">Submit</a>
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