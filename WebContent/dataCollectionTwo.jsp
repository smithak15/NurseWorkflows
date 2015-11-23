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
			
			.mapImage{ /* sets width and height for the floorplan image */
				width:808;
				height:520;
			}
			.rectangle { /* style for the rectangles to be drawn */
    			border: 4px solid #FF0000;
    			position: absolute;
    			background : rgba(242,242,242,0.7);
			}
			#svg { /* style for svg */
    			position: absolute;
    			top: 0;
   				left: 0;
    			z-index: 2;
    			display: inline-block;
			}
		</style>
	</head>
	<body>
	<%-- Container Body --%>
		<div class="container-fluid .center_div">
			<%-- Page Header --%>
			<div class="jumbotron new-color col-md-8 col-md-offset-2 row">
				<h2 class="text-center">Nurse Workflows</h2>
				<div class="col-md-12 row">
  					<ul class="nav nav-pills nav-justified">
	    				<li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span> Home</a></li>
		    			<li><a href="setupProfile.jsp">Setup Profile</a></li>
		    			<li class="active"><a href="dataCollection.do">Data Collection</a></li>
	    				<li><a href="#menu3">View Workflow</a></li>
  					</ul>	
  				</div>
  			</div>
  			<div class="row">
  					<div id="canvas">
  					
  					</div>
  			</div>
  			
  			<div class="modal fade" id="myModal_1" role="dialog">
			    <div class="modal-dialog">
			    
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">Track Activities</h4>
			        </div>
			        <div class="modal-body">
			          <p>Click on an activity when the nurse starts performing it</p>
						<table class="table table-bordered">
						    <thead>
						      <tr>
						        <th>Activities</th>
						        <th>Location</th>
						      </tr>
						    </thead>
						    <tbody>
						      <tr>
						        <td id="td1">
						        	<button type="button" class="btn btn-default" id="btn1">Prepare for surgery</button>
						        	<span id="btn1ok" class="glyphicon glyphicon-ok" style="display:none"></span>
						        </td>
						        <td rowspan="2">Surgery
						        <div id="bowlG" style="display:none">
									<div id="bowl_ringG">
										<div class="ball_holderG">
											<div class="ballG">
											</div>
										</div>
									</div>
								</div>
						        </td>
						      </tr>
						      <tr>
						        <td id="td2">
						        <button type="button" class="btn btn-default" id="btn2">Assist Surgery</button>
						        </td>
						      </tr>
						    </tbody>
						  </table>
			        </div>
			        <div class="modal-footer">
			          <button type="button" id="closeBtn" class="btn btn-danger" data-dismiss="modal">Close</button>
			        </div>
			      </div>
			      
			    </div>
 			 </div>
  			 <div class="modal fade" id="myModal_2" role="dialog">
			    <div class="modal-dialog">
			    
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" id="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">Track Activities</h4>
			        </div>
			        <div class="modal-body">
			          <p>Click on an activity when the nurse starts performing it</p>
						<table class="table table-bordered">
						    <thead>
						      <tr>
						        <th>Activities</th>
						        <th>Location</th>
						      </tr>
						    </thead>
						    <tbody>
						      <tr>
						        <td>
						        <button type="button" class="btn btn-default" id="btn3">Take patient blood samples</button>
						        <span id="btn3ok" class="glyphicon glyphicon-ok" style="display:none"></span>
						        </td>
						        <td rowspan="2">Laboratory
						        <div id="bow2G" style="display:none">
									<div id="bowl_ringG">
										<div class="ball_holderG">
											<div class="ballG">
											</div>
										</div>
									</div>
								</div>
						        </td>
						      </tr>
						      <tr>
						        <td><button type="button" class="btn btn-default" id="btn4">Collect blood sample report</button>
						        <span id="btn4ok" class="glyphicon glyphicon-ok" style="display:none"></span>
						        </td>
						      </tr>
						    </tbody>
						  </table>
			        </div>
			        <div class="modal-footer">
			          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			        </div>
			      </div>
			      
			    </div>
 			 </div>
		</div>
  			
  		</div>
	</body>
	<script type="text/javascript">
	var width = 808; //height and width for svg
	var height = 520;
	var svg;
	var canvasx;
	var canvasy;
	
	$("#btn1").click(function(){
		$("#bowlG").hide();
		$("#bowlG").fadeIn(3000);
	});
	$("#btn2").click(function(){
		$("#btn1").attr("disabled","true");
		$("#btn1ok").show(1000);
		$("#bowlG").hide();
		$("#bowlG").fadeIn(3000);
	});
	
	$("#btn3").click(function(){
		$("#bow2G").hide();
		$("#bow2G").fadeIn(3000);
	});
	$("#btn4").click(function(){
		$("#btn3").attr("disabled","true");
		$("#btn3ok").show(1000);
		$("#bow2G").hide();
		$("#bow2G").fadeIn(3000);
	});
	
	$(document).ready (function(){
		 // when document is ready, create svg element and append canvas div and load map image and append to it
			svg = d3.select("body").select("#canvas").append("svg").attr("width", width).attr("height", height);
			var imgs = svg.selectAll("image").data([0])
			.enter()
	        .append("svg:image")
	        .attr("id","mapImage")
	        .attr("xlink:href", "images/Floor2.jpg")
	        .attr("width", width)
	        .attr("height", height)
			.attr("class","col-md-12");
			
			var canvas = document.getElementById('canvas');
			var canvasElement = document.getElementById('mapImage');
	    	var position = canvasElement.getBoundingClientRect();
	    	var canvasx = position.left;
	    	var canvasy = position.top;
	        
		
		$.ajax({
		    type: "POST",
		    url: "setupProfile.do?getJson=true",
		    contentType: "application/json; charset=utf-8",
		    dataType: "json",
		    success: function(json){
		    	console.log(JSON.stringify(json));
		    	   $.each(json.rectangles, function(index, rectangle){
		    	    // alert(rectangle.id);
		    	     element = document.createElement('button');
		    	     element.type = "button";
		    	     element.id = rectangle.id;
		    	     element.className = 'rectangle';
		    	     $(element).attr("data-toggle","modal");
		    	     $(element).attr("data-target","#myModal_"+rectangle.id);
		    	     element.style.left = rectangle.left+"px";
		    	     element.style.top = (rectangle.top + canvasy )+ "px";
		    	     element.style.width = rectangle.width + "px";
		    	     element.style.height = rectangle.height + "px";
		    	     element.innerHTML = rectangle.location;
		    	     canvas.appendChild(element);
		    	   });
		    },
		    failure: function(errMsg) {
		        alert(errMsg);
		    }
		});
	});
	</script>
</html>
