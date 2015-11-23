<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Nurse Workflows | Home</title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/styles.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<style>
			.center_div{
 			   	margin: 0 auto;
    			width:80% /* value of your choice which suits your alignment */
			}
		</style>
	</head>
	<body>
	
	<div class="container-fluid .center_div">
		
				<div class="jumbotron new-color col-md-8 col-md-offset-2 row">
				<h2 class="text-center">Nurse Workflows</h2>
				<div class="col-md-12 row">
  					<ul class="nav nav-pills nav-justified">
	    				<li class="active"><a href="index.jsp"><span class="glyphicon glyphicon-home"></span> Home</a></li>
		    			<li><a href="setupProfile.jsp">Setup Profile</a></li>
		    			<li><a href="dataCollection.do">Data Collection</a></li>
	    				<li><a href="#menu3">View Workflow</a></li>
  					</ul>	
  				</div>
  				</div>
  				<c:if test="${param.setupProfileSuccess eq true}">
	  				<div id="success-alert" class="alert alert-success col-md-offset-2 col-md-6 row">
	  						<strong>Success!</strong> You have successfully created a profile.
					</div>
				</c:if>
  				<div class="well col-md-8 col-md-offset-2 row">
  				<p style="font-size:120%">Hello There!</p>
  				 <p style="font-size:120%">  This application is used for recording work flow of nurses over a period of time and obtaining the workflow information.</p>
  				 <p style="font-size:120%">  Please find below the purposes of various tabs available</p>
  				 <p style="font-size:120%">  1)<span style="font-weight:bold;">Setup profile:</span>   This tab takes project,participants and activities as input. It would allow user to select locations on the map and save.</p> 
  				 <p style="font-size:120%">  2)<span style="font-weight:bold;">Data Collection:</span> This would allow user to record the activities and durations in different locations.</p>
  				 <p style="font-size:120%">  3)<span style="font-weight:bold;">View Workflow:</span>   This would allow user to select and download recorded data to analyze for further use.</p>
  				
  				</div>
  	</div>	
  </body>
 </html>