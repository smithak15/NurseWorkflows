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
		<script type="text/javascript" src="js/jquery.zoomooz.min.js"></script>
		<style>
		
		 .output {
		 width:120px;
		 height:25px;
		 background-color:#CCC;
		 border:1px solid #999;
		 
		 }
		 
		  .zoomContainer {
	margin:0;
    padding:0;
    width:808px;
	height:520px;
    position:relative;
    
   
}

.zoomViewport {
	margin:0;
    padding:0;
    width:808px;
	height:520px;
	border:1px solid #ccc;
	background-color: white;
	overflow:hidden;
	margin-left:auto;
	margin-right:auto;
	margin-top:1em;
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
		    			<li><a href="setupProfile.jsp">Setup Profile</a></li>
		    			<li class="active"><a href="dataCollection.do">Data Collection</a></li>
	    				<li><a href="viewWorkFlow.jsp">View Workflow</a></li>
  					</ul>	
  				</div>
  			</div>
  			<br/>
  			<div class="row">
  				
  				<div class="zoomViewport" id="viewPort">
  					<div class="zoomContainer" id="container">
	  					<div id="canvas">
	  						<img id="mapImage" src="images/Floor1.jpg" width="808" height="520" class="center-block"/>
		  				</div>
  					</div>
	  			</div>
	  		
	  		</div>
	  		
	  		<div class="row" id="buttonsRow">
	  		<br>
	  		<br>
	  			<div class="col-md-8 col-md-offset-2">
	  				<ul class="nav nav-pills nav-justified">
	        			<li>
	        				<a id="cancel" href="#" class="btn btn-default btn-lg col-sm-offset-4">Cancel 
	        				</a>
	        			</li>
	        			<li>
	        				<a href="#" id="finish" class="btn btn-success btn-lg col-sm-offset-4">Finish 
	        				</a>
	        			</li>
	        		</ul>
	        	</div>
	        	<br>
	  		<br>
	  		</div>
  			
  			
  			<div id="myModal1" style="display:none;" class="row well">
 
						<table class="table table-bordered">
						    <thead>
						      <tr>
						        <th>Activities</th>
						        <th>Record Time</th>
						        <th>Time recorded</th>
						      </tr>
						    </thead>
						    <tbody>
						      <tr>
						        <td>
						        Take patient vitals
						        </td>
						        <td>
						        	<button type="button" class="btn btn-default" id="btnStart1" >Start</button>
						        	<button type="button" class="btn btn-default" id="btnStop1">Stop</button>
						        	
						        </td>
						        <td>
						             
						            <p id="output1" class="output"></p>
						            
						        </td>
						      </tr>
						      <tr>
						        <td>Talk to the patient and record symptoms
						        </td>
						        <td>
						        	<button type="button" class="btn btn-default" id="btnStart2">Start</button>
						        	<button type="button" class="btn btn-default" id="btnStop2">Stop</button>
						        </td>
						         <td>
						             
						         <p id="output2" class="output"></p>
						            
						        </td>
						      </tr>
						      <tr>
						      <td colspan="3">
						      	<button type="button" class="btn btn-danger col-sm-offset-6 col-sm-2" id="done">Done</button>
						      </td>
						      </tr>
						    </tbody>
						  </table>
						  
  			</div>
  			<div id="myModal2" style="display:none;" class="row well">
  				
						<table class="table table-bordered">
						    <thead>
						      <tr>
						        <th>Activities</th>
						        <th>Record Time</th>
						        <th>Time recorded</th>
						      </tr>
						    </thead>
						    <tbody>
						      <tr>
						        <td>
						        Pre-op preperation
						        </td>
						        <td>
						        	<button type="button" class="btn btn-default" id="btnStart3" >Start</button>
						        	<button type="button" class="btn btn-default" id="btnStop3">Stop</button>
						        	
						        </td>
						        <td>
						             
						            <p id="output3" class="output"></p>
						            
						        </td>
						      </tr>
						      <tr>
						        <td>Surgery support
						        </td>
						        <td>
						        	<button type="button" class="btn btn-default" id="btnStart4">Start</button>
						        	<button type="button" class="btn btn-default" id="btnStop4">Stop</button>
						        </td>
						         <td>
						             
						         <p id="output4" class="output"></p>
						            
						        </td>
						      </tr>
						      <tr>
						      <td colspan="3">
						      	<button type="button" class="btn btn-danger col-sm-offset-6 col-sm-2" id="done2">Done</button>
						      </td>
						      </tr>
						    </tbody>
						  </table>
						  
  			</div>
		</div>
  			
  		<div class="modal fade" id="message" role="dialog">
  			<div class="modal-dialog">
			       <div class="modal-content">
			       		<div class="modal-body">
	  						<button type="button" class="close" id="close" data-dismiss="modal">&times;</button>
				          	<div id="danger-alert" class="alert alert-danger">
	  							<strong>Warning!</strong> Please record data for at least one activity.
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
  		</div>
  		<form id="pageForm" action="">
  		</form>
	</body>
	<script type="text/javascript">
	var width = 808; //height and width for svg
	var height = 520;
	var svg;
	var canvasx;
	var canvasy;
	
	var time1=0;
	var running1 = 0;
	
	var time2=0;
	var running2 = 0;
	
	var time3=0;
	var running3 = 0;
	
	var time4=0;
	var running4 = 0;
	
	var started = false;
	
	$("#btnStart1").click(function(){
		started = true;
	time2=0;
	running2 = 0;
	if(running1 == 0){
		running1 = 1;
		increment1();
	}
	}); 
	
	function increment1(){
		if(running1 ==1){
		setTimeout(function(){
			time1++;
			var mins= Math.floor(time1/10/60);
			var secs= Math.floor(time1/10);
			var tenths= time1 % 10;
			document.getElementById("output1").innerHTML = mins + ":" + secs + ":" + tenths;
			increment1();
		},100);
		}
	}
	
	$("#btnStop1").click(function(){
		running1 = 0;
		
	});
	
	$("#btnStart2").click(function(){
		started = true;
		time1=0;
		running1 = 0;
		if(running2 == 0){
			running2 = 1;
			increment2();
		}
	});
	$("#btnStop2").click(function(){
		
		running2 = 0;
		$("#btn4").attr("disabled","true");
		$("#bow2G").hide();
		$("#bow2G").fadeIn(3000);
	});
	
	function increment2(){
		if(running2 ==1){
		setTimeout(function(){
			time2++;
			var mins= Math.floor(time2/10/60);
			var secs= Math.floor(time2/10);
			var tenths= time2 % 10;
			document.getElementById("output2").innerHTML = mins + ":" + secs + ":" + tenths;
			increment2();
		},100);
		}
	}
	
	$("#btnStart3").click(function(){
		started = true;
		time3=0;
		running3 = 0;
		if(running3 == 0){
			running3 = 1;
			increment3();
		}
		}); 
	
	function increment3(){
		if(running3 ==1){
		setTimeout(function(){
			time3++;
			var mins= Math.floor(time3/10/60);
			var secs= Math.floor(time3/10);
			var tenths= time3 % 10;
			document.getElementById("output3").innerHTML = mins + ":" + secs + ":" + tenths;
			increment3();
		},100);
		}
	}
	$("#btnStop3").click(function(){
		running3 = 0;
	});
	
	$("#btnStart4").click(function(){
		started = true;
		time4=0;
		running4 = 0;
		if(running4 == 0){
			running4 = 1;
			increment4();
		}
		}); 
	
	function increment4(){
		if(running4 ==1){
		setTimeout(function(){
			time4++;
			var mins= Math.floor(time4/10/60);
			var secs= Math.floor(time4/10);
			var tenths= time4 % 10;
			document.getElementById("output4").innerHTML = mins + ":" + secs + ":" + tenths;
			increment4();
		},100);
		}
	}
	$("#btnStop4").click(function(){
		running4 = 0;
		
	});
	
	$(document).ready (function(){
		//$("#message").hide();
		$.zoomooz.setup({root:$("#container")});
		 // when document is ready, create svg element and append canvas div and load map image and append to it
			svg = d3.select("body").select("#canvas").append("svg");
						
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
		    	     element.className = 'rectangle zoomTarget';
		    	     element.style.left = rectangle.left+"px";
		    	     element.style.top = (rectangle.top)+ "px";
		    	     element.style.width = rectangle.width + "px";
		    	     element.style.height = rectangle.height + "px";
		    	     element.innerHTML = rectangle.location;
		    	     canvas.appendChild(element);
		    	     $('#'+element.id).click(function(evt) {
		    	    	 var id = $(this).attr("id");
		    	    	 	evt.stopPropagation();
		    	         	$("#viewPort").css("height","200px");
		    	         	$(this).zoomTo({duration:1000, targetsize:0.8});
		    	         	$("#myModal"+id).css("display","block");
		    	         	$("#buttonsRow").css("display","none");
		    	         	$(this).css("background","rgba(255,131,121,0.9)");
		    	         	$(this).css("color","black")
		    	     });  
		    	   });
		    },
		    failure: function(errMsg) {
		        alert(errMsg);
		    }
		});
	});
	
	$("#done").click(function(evt) {
		evt.stopPropagation();
		$("#viewPort").css("height","520px");
		$("#container").zoomTo({targetsize:1.0});
		$("#myModal1").css("display","none");
		//$("#myModal2").css("display","none");
		$("#buttonsRow").css("display","block");
	});
	
	$("#done2").click(function(evt) {
		evt.stopPropagation();
		$("#viewPort").css("height","520px");
		$("#container").zoomTo({targetsize:1.0});
		//$("#myModal1").css("display","none");
		$("#myModal2").css("display","none");
		$("#buttonsRow").css("display","block");
	});
	
	$("#finish").click(function(){
		if(!started){
			$("#message").modal("show");
		}else{
			window.location.href = "/NurseWorkflows/index.jsp?dataCollectionSuccess=true";
		}
	});
	$("#cancel").click(function(){
		$("#pageForm").attr("action","cancelFunction.do");
		$("#pageForm").submit();
	});
	</script>
</html>
