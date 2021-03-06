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
		<script src="js/jquery.zoomooz.min.js"></script>
		<style>
			.center_div{
 			   	margin: 0 auto;
    			width:80% /* value of your choice which suits your alignment */
			}
			.mapImage{ /* sets width and height for the floorplan image */
				width:808;
				height:520;
			}
			.rectangle { /* style for the rectangles to be drawn */
    			border: 4px solid #FF0000;
    			position: absolute;
    			color : white;
    			background : rgba(0,0,0,0.6);
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
		    			<li class="active"><a href="setupProfile.jsp">Setup Profile</a></li>
		    			<li><a href="dataCollection.do">Data Collection</a></li>
	    				<li><a href="viewWorkFlow.jsp">View Workflow</a></li>
  					</ul>	
  				</div>
  			</div>
  			<%-- Setup Profile steps --%>
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
			<%-- Div which displayes coordinates of mouse. Let it be commented --%>
			 <!--  <div id="coords" class="col-md-2">
  					Text
			   </div>  --> 
			<div class="well">
			<%-- Draw and Clear buttons row --%>
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
	  				<ul class="nav nav-pills nav-justified">
	        			<li>
		        			<a id="drawButton" href="#" class="btn btn-default btn-lg col-sm-offset-1">
		          				<span class="glyphicon glyphicon-pencil"></span> Draw 
		        			</a>
		        		</li>
					    <li>
		        			<a id="clearButton" href="#" class="btn btn-default btn-lg col-sm-offset-1">
		          				<span class="glyphicon glyphicon-erase"></span> Clear 
		        			</a>
		        		</li>
		        		<li>
	        				<a id="cancel" href="#" class="btn btn-default btn-lg col-sm-offset-1">Cancel 
	        				</a>
	        			</li>
				        <li>
	        				<a href="#" id="finish" class="btn btn-success btn-lg col-sm-offset-1">Finish 
	        				</a>
	        			</li>
				   	</ul>
				</div>
			</div>
			<br/>
  			<%-- Floor plan image display area --%>	
  			<div class="row">
  					<div id="canvas">
  						
  					<img id="mapImage" src="images/Floor1.jpg" width="808" height="520" class="center-block" ondragstart="return false;"/>
  						
  					</div>
  			</div>
  			</div>
  			<form id="pageForm"></form>
		</div>
	</body>
	<script type="text/javascript">
	
	var width = 808; //height and width for svg
	var height = 520;
	var svg;
	var canvasx;
	var canvasy;
	var rectangleId = 0;
	$(document).ready (function(){ // when document is ready, create svg element and append canvas div and load map image and append to it
		svg = d3.select("body").select("#canvas").append("svg");
		/* var imgs = svg.selectAll("image").data([0])
		.enter()
        .append("svg:image")
        .attr("id","mapImage")
        .attr("xlink:href", "images/Floor1.jpg")
        .attr("width", width)
        .attr("height", height)
		.attr("class","col-md-12").attr("onmousedown","event.preventDefault();");    */    
	});
	
	
	//On click of draw button initialize drawing function
	$("#drawButton").click(function(){
		initDraw(document.getElementById('canvas'));
	});	
	
	$("#cancel").click(function(){
		$("#pageForm").attr("action","cancelFunction.do");
		$("#pageForm").submit();
	});
	
	$("#clearButton").click(function(){
		$(".rectangle").each(function() {
			$(this).remove();
		});
		rectangleId = 0;
	});	
	
	$("#finish").click(function(){
		
		var left = "";
		var top = "";
		var str = "";
		var width = "";
		var height = "";
		var text = '' ;
		var count = 0;
		var locName = "";
		$(".rectangle").each(function() {
		    // element is a node with the desired class name
		   
		    top = $(this).css("top");
		    top = parseInt(top);
		    top = top - canvasy;
		    left = $(this).css("left");
		    left = parseInt(left);
		    left = left - canvasx;
		    width = parseInt($(this).css("width"));
		    height = parseInt($(this).css("height"));
		    var attrId = $(this).attr("id");
		    locName = $("#locName_"+attrId).html();
		    if(count == 0){
		    	count++;
		    }else{
		    	text= text+";";
		    	count++;
		    }
		    text = text + '{"id":\"'+attrId+'\","locName":\"'+locName+'\","top":\"'+top+'\","left":\"'+left+'\","width":\"'+width+'\","height":\"'+height+'\"}';
		   
		  });
		//text = text + '}';
		//alert(text);
		$.ajax({
			    type: "POST",
			    url: "addLocations.do",
			    // The key needs to match your method's input parameter (case-sensitive).
			    data:text,
			    contentType: "application/json; charset=utf-8",
			    dataType: "json",
			    success: function(json){
			    	console.log(JSON.stringify(json));
			    	  /* $.each(json.rectangles, function(index, rectangle){
			    	     alert(rectangle.id);
			    	   }); */
			    	//callIndex();   
			    	window.location.href = "/NurseWorkflows/index.jsp?setupProfileSuccess=true";
			    },
			    failure: function(errMsg) {
			        alert(errMsg);
			    }
			}); 
		
	});		
	
	function initDraw(canvas) {
		var canvasElement = document.getElementById('mapImage');
	   	var position = canvasElement.getBoundingClientRect(); //get coordintes of map
	   	canvasx = Math.round(position.left);
	   	canvasy = Math.round(position.top);
	   	
    	function setMousePosition(e) {
       		var ev = e || window.event; //Moz || IE
       		if (ev.pageX) { //Moz
	           mouse.absX = ev.pageX;
	           mouse.absY = ev.pageY;
	           //mouse.x = ev.pageX - canvasx; 
	           //mouse.y = ev.pageY - canvasy;
	       	}else if (ev.clientX) { //IE
	           mouse.x = ev.clientX + document.body.scrollLeft;
	           mouse.y = ev.clientY + document.body.scrollTop;
	        }
	    };
	    
	    var mouse = {
	    		
	        x: 0,
	        y: 0,
	        startX: 0, //will be the position from where you started drawing
	        startY: 0,
	        absX:0,
	        absY:0
	    };
	    var element = null;

	    var moving = false;
	    canvas.onmousemove = function (e) {
	    	moving = true;
	        setMousePosition(e);
	         if (element !== null) {
	            element.style.width = Math.abs(mouse.absX - mouse.startX) + 'px'; //current mouse position - start position 
	            element.style.height = Math.abs(mouse.absY - mouse.startY) + 'px';
	            element.style.left = (mouse.absX - mouse.startX < 0) ? mouse.absX + 'px' : mouse.startX + 'px';
	            element.style.top = (mouse.absY - mouse.startY < 0) ? mouse.absY + 'px' : mouse.startY + 'px';
	        } 
	         canvasElement.style.cursor = "crosshair"; //change cursor style
	    }

	    $("#canvas").on('dragstart',function (e) { //any click on top of the floor plan
	    	if(moving){
	         //if rectangle has not been drawn yet
	            console.log("begun.");
	            mouse.startX = mouse.absX; //starting point coordinates = current mouse position
	            mouse.startY = mouse.absY;
	            element = document.createElement('div'); //make a div rectangle
	            element.className = 'rectangle';
	            //alert("x: "+mouse.x+" y:"+mouse.y);
	            element.style.left = mouse.absX  + 'px'; //set rectangles position
	            element.style.top = mouse.absY  + 'px'; 
	            rectangleId ++;
	            element.id = rectangleId;
	            canvas.appendChild(element); //append rectangle into image
	        }
	    	
	    });
	    
	    canvas.onmouseup = function (e) {
	    	if (element !== null) { //if element not equal to null means, the rectangle is already being drawn
	        	var div = document.createElement('div');
	        	div.innerHTML = "Enter Location Name:";
	        	div.id = "locName_" + rectangleId;
	        	element.appendChild(div);
	        	var input = document.createElement('input'); //add textbox into rectangle
	            input.type = "text";
	        	input.id="rectangleText_" + rectangleId;
	        	input.style.color = "black";
	            div.appendChild(input);
	            input.focus();
	            var locName;
	            $("#"+input.id).keydown(function(e){
		    		if (e.keyCode == 13) {
		    			locName = $("#"+input.id).val();
		    			div.removeChild(input);
		    			div.innerHTML = locName;
			    	}
		    	})
	           	/* var htmlCode = 'Enter Location name: <input type="text" id="rectangleText_'+element.id+'" value="" autofocus></input>';
	            $("#"+element.id).tooltip({title: htmlCode, html: true, placement: "right"}).tooltip('show');
	            $('[id^=tooltip]').each(function(){
	            	$("#canvas").append($(this));
	            }); */
	            
	            element = null; //make the element null
	            canvas.style.cursor = "default"; //reset cursor
	            console.log("finsihed.");
	        } 
	    }
	    
	    
	    
	    //Function to display coordinates. Leave it commented
	      /* canvas.addEventListener('mousemove', function(e){
	    	var canvasElement = document.getElementById('mapImage');
	    	var position = canvasElement.getBoundingClientRect();
	    	var canvasx = position.left;
	    	var canvasy = position.top;
		document.getElementById('coords').innerHTML = Math.round(mouse.absX) + ', ' + Math.round(mouse.absY)+','+Math.round(canvasx)+', '+Math.round(canvasy);
		}, false);   */
	
	}
	</script>
</html>
  