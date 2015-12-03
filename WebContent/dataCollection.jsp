<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Setup Profile | Add Locations</title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/styles.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
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
		    			<li class="active"><a href="dataCollection.do">Data Collection</a></li>
	    				<li><a href="viewWorkFlow.jsp">View Workflow</a></li>
  					</ul>	
  				</div>
  				</div>
  				<div class="well col-md-8 col-md-offset-2 row">
		  			<form class="form-horizontal" role="form" action="loadLayout.do">
		  				<div class="form-group">
		    				<label class="control-label col-sm-6">Choose Project:</label>
		    				<div class="col-sm-4">
		    				<c:forEach var="lang" items="${param.projList}">
		    				</c:forEach> 
						  	<select class="form-control" id="projectId" name="projectId">
							    <option selected disabled>Please Select</option>
							    <c:forEach var="proj" items="${projList}">
							    	<option value="${proj.projectId}"><c:out value="${proj.projectName}"></c:out></option>
		    					</c:forEach>
						  	</select>
		    				</div>
		  				</div>
		  				<div class="form-group">
		    				<label class="control-label col-sm-6">Choose Participant:</label>
		    				<div class="col-sm-4"> 
						  	<select class="form-control" id="participantId" name="participantId">
							    <option selected disabled>Please Select</option>
						  	</select>
		    				</div>
		  				</div>
		  				<div class="form-group"> 
				  			<div class="col-md-offset-6 col-md-6">
				      			<button type="button" class="btn btn-default col-md-4">Cancel</button>
				      			<button type="submit" class="btn btn-success col-md-4">Next</button>
				    		</div>
				  		</div>
		  			</form>
		  		</div>
  		</div>
	</body>
	<script type="text/javascript">
		$("#projectId").change(function(){
			$.ajax({
			    type: "POST",
			    url: "getParticipantsAjax.do?"+"projectId="+$(this).val(),
			    contentType: "application/json; charset=utf-8",
			    dataType: "json",
			    success: function(json){
			    	$.each(json.partiList, function(index, parti){
			    		var listContainer = $('#participantId');
			    		listContainer.append('<option value="'+parti.partiId+'"> ' + parti.partiName + '</option>')
			    	});
			    }
			})
		});
	</script>
</html>