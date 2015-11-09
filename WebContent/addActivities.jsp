<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Setup Profile | Add Activities</title>
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
	    				<li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span> Home</a></li>
		    			<li class="active"><a href="setupProfile.jsp">Setup Profile</a></li>
		    			<li><a href="#menu2">Data Collection</a></li>
	    				<li><a href="#menu3">View Workflow</a></li>
  					</ul>	
  				</div>
  				</div>
  				<div class="row bs-wizard" style="border-bottom:0;">
                
                <div class="col-xs-2 col-md-offset-2 bs-wizard-step complete">
                  <div class="text-center bs-wizard-stepnum">Step 1</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                  <div class="bs-wizard-info text-center">Create Project</div>
                </div>
                
                <div class="col-xs-2 bs-wizard-step complete">
                  <div class="text-center bs-wizard-stepnum">Step 2</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                 <div class="bs-wizard-info text-center">Add Participants</div>
                </div>
                
                <div class="col-xs-2 bs-wizard-step active">
                  <div class="text-center bs-wizard-stepnum">Step 3</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                  <div class="bs-wizard-info text-center">Add Activities</div>
                </div>
                
                <div class="col-xs-2 bs-wizard-step disabled">
                  <div class="text-center bs-wizard-stepnum">Step 4</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                  <div class="bs-wizard-info text-center">Add Locations</div>
                </div>
            </div>
		  		<div class="well col-md-8 col-md-offset-2 row">
		  		<form class="form-horizontal" role="form">
		  		<div class="form-group">
		    		<label class="control-label col-sm-6" id="projName">Activity Name:</label>
		    		<div class="col-sm-4">
		      			<input type="email" class="form-control" id="email" placeholder="Enter activity name">
		    		</div>
		  		</div>
		  		<div class="form-group">
		    		<label class="control-label col-sm-6">Activity Description:</label>
		    		<div class="col-sm-4"> 
		    			<textarea class="form-control" rows="5" id="projDesc" placeholder="Enter activity description.."></textarea>
		    		</div>
		  		</div>
		  		<div class="form-group">
		    		<div id="addButton" class="col-md-offset-6 col-md-6">
		      			<button type="button" class="btn btn-danger col-md-4">Add</button>
		    		</div>
		  		</div>
		  		<div class="form-group" id="successGroup">
		  			<div id="success-alert" class="alert alert-success col-md-offset-6 col-md-6">
  						<strong>Success!</strong> You have successfully added the activity.
					</div>
		  		</div>
		  		<div class="form-group">
		  			<div class="list-group col-md-offset-6 col-md-6" id="listGroup">
    					<a href="#" class="list-group-item active">Activities</a>
    					<a href="#" class="list-group-item">Check Blood Pressure</a>
  					</div>
		  		</div>
		  		<div class="form-group"> 
		  			<div class="col-md-offset-6 col-md-6">
		      			<button type="button" class="btn btn-default col-md-4">Cancel</button>
		      			<button type="button" class="btn btn-success col-md-4" onclick="window.location.href='addLocations.jsp'">Next</button>
		    		</div>
		  		</div>
				</form>
				</div>
			</div>
	</body>
	<script type="text/javascript">
	$(document).ready (function(){
        $("#success-alert").hide();
        $("#listGroup").hide();
		$("#addButton").click(function(){
			$("#listGroup").show();
			$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
		    	$("#success-alert").alert('hide');
			});
		});
	});
		</script>
</html>