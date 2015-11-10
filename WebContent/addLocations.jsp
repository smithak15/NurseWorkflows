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
			.mapImage{
				width:808;
				height:520;
			}
			.rectangle {
    			border: 4px solid #FF0000;
    			position: absolute;
			}
			#svg {
    position: absolute;
    top: 0;
    left: 0;
    z-index: 2;
    display: inline-block;
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
                
                <div class="col-xs-2 bs-wizard-step complete">
                  <div class="text-center bs-wizard-stepnum">Step 3</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                  <div class="bs-wizard-info text-center">Add Activities</div>
                </div>
                
                <div class="col-xs-2 bs-wizard-step active">
                  <div class="text-center bs-wizard-stepnum">Step 4</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                  <div class="bs-wizard-info text-center">Add Locations </div>
                </div>
			</div>
			<!-- <div id="coords" class="col-md-2">
  					Text
			   </div> -->
			   <div class="row">
			<div class="col-md-4 col-md-offset-4">
  					<ul class="nav nav-pills nav-justified">
        				<li>
	        				<a id="drawButton" href="#" class="btn btn-info btn-lg col-sm-offset-1">
	          					<span class="glyphicon glyphicon-pencil"></span> Draw 
	        				</a>
	        			</li>
				        <li>
	        				<a href="#" class="btn btn-info btn-lg col-sm-offset-1">
	          					<span class="glyphicon glyphicon-erase"></span> Clear 
	        				</a>
	        			</li>
			   		</ul>
			   </div>
			</div>
  				
  			<div class="row">
  					<div id="canvas">
  					
  					</div>
  			</div>
  						
  						
  					<div class="row">
			<div class="col-md-4 col-md-offset-4">
  					<ul class="nav nav-pills nav-justified">
        				<li>
	        				<a id="drawButton" href="#" class="btn btn-default btn-lg col-sm-offset-1">Cancel 
	        				</a>
	        			</li>
				        <li>
	        				<a href="#" class="btn btn-success btn-lg col-sm-offset-1">Finish 
	        				</a>
	        			</li>
			   		</ul>
			   </div>
			</div>
  					
  	
  				
  				
		</div>
  </body>
	<script type="text/javascript">
	
	var width = 808;
	var height = 520;
	var svg;
	$(document).ready (function(){
		svg = d3.select("body").select("#canvas").append("svg").attr("width", width).attr("height", height);
		var imgs = svg.selectAll("image").data([0])
		.enter()
        .append("svg:image")
        .attr("id","mapImage")
        .attr("xlink:href", "LibMap3.jpg")
        .attr("width", width)
        .attr("height", height)
		.attr("class","col-md-12");
        
	});
		//On click of draw adding crosshair cursor style
		$("#drawButton").click(function(){
			initDraw(document.getElementById('canvas'));
		})	
		
		 
		function initDraw(canvas) {
			var canvasElement = document.getElementById('mapImage');
	    	var position = canvasElement.getBoundingClientRect();
	    	var canvasx = Math.round(position.left);
	    	var canvasy = Math.round(position.top);
    		function setMousePosition(e) {
        		var ev = e || window.event; //Moz || IE
        		if (ev.pageX) { //Moz
	            mouse.absX = ev.pageX;
	            mouse.absY = ev.pageY;
	            mouse.x = ev.pageX - canvasx;
	            mouse.y = ev.pageY - canvasy;
	        } else if (ev.clientX) { //IE
	            mouse.x = ev.clientX + document.body.scrollLeft;
	            mouse.y = ev.clientY + document.body.scrollTop;
	        }
	    };
	    
	   

	    var mouse = {
	    		
	        x: 0,
	        y: 0,
	        startX: 0,
	        startY: 0,
	        absX:0,
	        absY:0
	    };
	    var element = null;

	    canvas.onmousemove = function (e) {
	        setMousePosition(e);
	         if (element !== null) {
	            element.style.width = Math.abs(mouse.absX - mouse.startX) + 'px';
	            element.style.height = Math.abs(mouse.absY - mouse.startY) + 'px';
	            element.style.left = (mouse.absX - mouse.startX < 0) ? mouse.absX + 'px' : mouse.startX + 'px';
	            element.style.top = (mouse.absY - mouse.startY < 0) ? mouse.absY + 'px' : mouse.startY + 'px';
	        } 
	    }

	    canvas.onclick = function (e) {
	    	var canvasElement = document.getElementById('mapImage');
	    	var position = canvasElement.getBoundingClientRect();
	    	var canvasx = Math.round(position.left);
	    	var canvasy = Math.round(position.top);
	        if (element !== null) {
	        	var input = document.createElement('input');
	            input.type = "text";
	            element.appendChild(input);
	            input.focus();
	            element = null;
	            canvas.style.cursor = "default";
	            console.log("finsihed.");
	        } else {
	            console.log("begun.");
	            mouse.startX = mouse.absX;
	            mouse.startY = mouse.absY;
	            element = document.createElement('div');
	            element.className = 'rectangle';
	            //alert("x: "+mouse.x+" y:"+mouse.y);
	            element.style.left = mouse.absX  + 'px';
	            element.style.top = mouse.absY  + 'px';
	            canvas.appendChild(element)
	            canvas.style.cursor = "crosshair";
	        }
	    }
	    
	    /* canvas.addEventListener('mousemove', function(e){
	    	var canvasElement = document.getElementById('mapImage');
	    	var position = canvasElement.getBoundingClientRect();
	    	var canvasx = position.left;
	    	var canvasy = position.top;
			document.getElementById('coords').innerHTML = + mouse.absX + ', ' + mouse.absY+','+window.pageXOffset+', '+Math.round(window.pageYOffset);
		}, false); */
}
	</script>
</html>
  