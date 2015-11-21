<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Nurse Workflows | View Workflow</title>
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
		    			<li><a href="setupProfile.jsp">Setup Profile</a></li>
		    			<li><a href="dataCollection.jsp">Data Collection</a></li>
	    				<li class ="active"><a href="viewWorkflow.jsp">View Workflow</a></li>
  					</ul>	
  				</div>
  				</div>
  				
  		<div class="well col-md-8 col-md-offset-2 row">
		  		<form class="form-horizontal" role="form">
		  		<div class="form-group">
		    		<label class="control-label col-sm-6" id="projName">Project Name:</label>
		    		<!-- <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Select
                                <span class="caret"></span></button>
                                <ul class="dropdown-menu">
                                   <li><a href="#">HTML</a></li>
                                   <li><a href="#">CSS</a></li>
                                   <li><a href="#">JavaScript</a></li>
                                </ul>
                   </div> -->
                     <div class="col-sm-3">
                   <select class="form-control">
                        <option value="one">One</option>
                        <option value="two">Two</option>
                        <option value="three">Three</option>
                        <option value="four">Four</option>
                        <option value="five">Five</option>
                   </select>
                   </div>
		  		</div>
		  		<div class="form-group">
		    		<label class="control-label col-sm-6">Participant Name:</label>
		    		<!-- <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Select
                                <span class="caret"></span></button>
                                <ul class="dropdown-menu">
                                   <li><a href="#">HTML</a></li>
                                   <li><a href="#">CSS</a></li>
                                   <li><a href="#">JavaScript</a></li>
                                </ul>
                   </div> -->
                    <div class="col-sm-3">
                   <select class="form-control">
                        <option value="one">One</option>
                        <option value="two">Two</option>
                        <option value="three">Three</option>
                        <option value="four">Four</option>
                        <option value="five">Five</option>
                   </select>
                   </div>
		  		</div>
		  		<div class="form-group">
		    		<div id="viewRecordsButton" class="col-md-offset-6 col-md-6">
		      			<button type="button" class="btn btn-primary col-md-5">View Records</button>
		    		</div>
		  		</div>
		  		
		  		<div class="form-group" >
		  		
		  		    <div id="filelink"  class="col-md-offset-6 col-md-5" >
		    		    <label class="control-label col-sm-5">floor1_Joseph</label>
		      		</div>
		      		
		    		<div id="downloadRecordsButton" class="col-md-offset-6 col-md-6" >
		      			<button type="button" class="btn btn-primary col-md-5">Download Records</button>
		    		</div>
		    		
		    		
		  		</div>
		  		
				</form>
				</div>
    </div>
</body>

<script type="text/javascript">
	$(document).ready (function(){
        $("#downloadRecordsButton").hide();
        $("#filelink").hide();
		$("#viewRecordsButton").click(function(){
			$("#filelink").show();
			$("#downloadRecordsButton").show();
			
		});
		
		
        $("#downloadRecordsButton").click(function() {
        	
        	
            //window.location='C:\Sooraj\Semester 2\Software engineering\Workspace\NurseworkflowLatestLatest\WebContent\floor1_joseph.csv';
        });
	});
		</script>

</html>