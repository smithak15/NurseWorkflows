<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Setup Profile | Create Project</title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/styles.css">
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
		    			<li><a href="dataCollection.do">Data Collection</a></li>
	    				<li><a href="viewWorkFlow.jsp">View Workflow</a></li>
  					</ul>	
  				</div>
  				</div>
  				<div class="row bs-wizard" style="border-bottom:0;">
                
                <div class="col-xs-2 col-md-offset-2 bs-wizard-step active">
                  <div class="text-center bs-wizard-stepnum">Step 1</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                  <div class="bs-wizard-info text-center">Create Project</div>
                </div>
                
                <div class="col-xs-2 bs-wizard-step disabled">
                  <div class="text-center bs-wizard-stepnum">Step 2</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                 <div class="bs-wizard-info text-center">Add Participants</div>
                </div>
                
                <div class="col-xs-2 bs-wizard-step disabled">
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
		  		<form class="form-horizontal" role="form" action="addProject.do" id="pageForm">
		  		<div class="form-group">
		    		<label class="control-label col-sm-6" id="projName">Project Name:</label>
		    		<div class="col-sm-4">
		      			<input type="text" class="form-control" id="projName" name="projName" placeholder="Enter project name">
		    		</div>
		  		</div>
		  		<div class="form-group">
		    		<label class="control-label col-sm-6">Project Description:</label>
		    		<div class="col-sm-4"> 
		    			<textarea class="form-control" rows="5" id="projDesc" name="projDesc" placeholder="Enter project description.."></textarea>
		    		</div>
		  		</div>
		  		<div class="form-group">
		    		<label class="control-label col-sm-6">Choose Layout:</label>
		    		<div class="col-sm-4"> 
						  <select class="form-control" id="layoutId" name="layoutId">
						    <option selected disabled>Please Select</option>
						    <option value="1">Layout 1</option>
						  </select>
		    		</div>
		  		</div>
		  		<div class="form-group"> 
		  			<div class="col-md-offset-6 col-md-6">
		      			<button type="button" class="btn btn-default col-md-4" id="cancel">Cancel</button>
		      			<button type="submit" id="sub" class="btn btn-success col-md-4">Next</button>
		    		</div>
		  		</div>
				</form>
				</div>
			</div>
	</body>
	<script type="text/javascript">
		$("#cancel").click(function(){
			$("#pageForm").attr("action","cancelFunction.do");
			$("#pageForm").submit();
		});
	</script>
</html>
