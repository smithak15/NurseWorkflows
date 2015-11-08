<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<style>
			.center_div{
 			   	margin: 0 auto;
    			width:80% /* value of your choice which suits your alignment */
			}
			.mapImage{
				width:808;
				height:520;
			}
		</style>
	</head>
	<body>
	
	<div class="container-fluid .center_div">
		
				<h3 class="text-center">Nurse Workflows</h3>
				<div class="col-md-8 col-md-offset-2">
  					<ul class="nav nav-pills nav-justified">
	    				<li><a data-toggle="pill" href="#home">Home</a></li>
		    			<li class="active"><a data-toggle="pill" href="#menu1">Setup Profile</a></li>
		    			<li><a data-toggle="pill" href="#menu2">Data Collection</a></li>
	    				<li><a data-toggle="pill" href="#menu3">View Workflow</a></li>
  					</ul>	
  				</div>
  				
  				<div class="well col-md-8 col-md-offset-2">
  					<img src="images/LibMap3.jpg" class="mapImage"></img>
  					<div class="col-md-offset-8 col-md-6">
		      			<button type="button" class="btn btn-default col-md-4">Cancel</button>
		      			<button type="button" class="btn btn-success col-md-4">Finish</button>
		    		</div>
  				</div>
		  	</div>
  	</body>
  </html>