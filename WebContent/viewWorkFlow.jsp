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
		<script src="//d3js.org/d3.v3.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		
		<style>
		
		.bar {
  fill: steelblue;
}

.bar:hover {
  fill: #2ca25f;
}

.axis {
  font: 10px sans-serif;
}

.axis path,
.axis line {
  fill: none;
  stroke: #000;
  shape-rendering: crispEdges;
}

.x.axis path {
  display: none;
}
			.center_div{
 			   	margin: 0 auto;
    			width:80% /* value of your choice which suits your alignment */
			}
			
			.chart div {
                            font: 10px sans-serif;
                            background-color: steelblue;
                            text-align: right;
                            padding: 3px;
                            margin: 1px;
                            color: white;
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
		    			<li><a href="dataCollection.do">Data Collection</a></li>
	    				<li class ="active"><a href="viewWorkflow.jsp">View Workflow</a></li>
  					</ul>	
  				</div>
  				</div>
  				
  		<div class="well col-md-8 col-md-offset-2 row">
		  		<form class="form-horizontal" role="form">
		  		<div class="form-group">
		    		<label class="control-label col-sm-6" id="projName">Project Name:</label>
		    		<!--additional code rmeoved <div class="dropdown">
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
                        <option value="one">Select</option>
                        <option value="two">Floor 1</option>
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
                        <option value="one">Select</option>
                        <option value="two">Joseph</option>
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
		    		    <label class="control-label col-sm-5">floor1_Joseph.csv</label>
		      		</div>
		      		
		    		<div id="downloadRecordsButton" class="col-md-offset-6 col-md-6" >
		      			<button type="button" onclick="location.href='floor1_Joseph.csv';" class="btn btn-primary col-md-5">Download Records</button>
		    		</div>
		    		
		    		
		    		
		  		</div>
		  		  <div id="title_graph">
		  		     <h3 align="center">Comparative view of time spent in each room</h3></div>
		  		   <div id="graph"  >
		      			
		    		</div>
				</form>
				</div>
    </div>
    
   
</body>


<script type="text/javascript">

	$(document).ready (function(){
        $("#downloadRecordsButton").hide();
        $("#filelink").hide();
        $("#title_graph").hide();
		$("#viewRecordsButton").click(function(){
			$("#filelink").show();
			$("#downloadRecordsButton").show();
			$("#title_graph").show();
			var margin = {top: 20, right: 20, bottom: 30, left: 40},
		    width = 900 - margin.left - margin.right,
		    height = 500 - margin.top - margin.bottom;

		var x = d3.scale.ordinal()
		    .rangeRoundBands([0, width], .1);

		var y = d3.scale.linear()
		    .range([height, 0]);

		var xAxis = d3.svg.axis()
		    .scale(x)
		    .orient("bottom");

		var yAxis = d3.svg.axis()
		    .scale(y)
		    .orient("left")
		    .ticks(10);
		
		
		var svg = d3.select("body").select("#graph").append("svg")
	    .attr("width", width + margin.left + margin.right)
	    .attr("height", height + margin.top + margin.bottom)
	  .append("g")
	    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

	d3.tsv("data.tsv", type, function(error, data) {
	  if (error) throw error;

	  x.domain(data.map(function(d) { return d.letter; }));
	  y.domain([0, d3.max(data, function(d) { return d.frequency; })]);

	  svg.append("g")
	      .attr("class", "x axis")
	      .attr("transform", "translate(0," + height + ")")
	      .call(xAxis);

	  svg.append("g")
	      .attr("class", "y axis")
	      .call(yAxis)
	    .append("text")
	      .attr("transform", "rotate(-90)")
	      .attr("y", 6)
	      .attr("dy", ".71em")
	      .style("text-anchor", "end")
	      .text("Duration spent(in mins.)");

	  svg.selectAll(".bar")
	      .data(data)
	    .enter().append("rect")
	      .attr("class", "bar")
	      .attr("x", function(d) { return x(d.letter); })
	      .attr("width", x.rangeBand())
	      .attr("y", function(d) { return y(d.frequency); })
	      .attr("height", function(d) { return height - y(d.frequency); })
	      ;
	});

	function type(d) {
	  d.frequency = +d.frequency;
	  return d;
	}

			
		});
		
		
        $("#downloadRecordsButton").click(function() {
        	
        	
           
        });
        
        
	});
		</script>

</html>
