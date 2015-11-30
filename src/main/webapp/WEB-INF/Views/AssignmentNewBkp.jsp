<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>    
	<script src="http://www.html5canvastutorials.com/libraries/three.min.js"></script>  
	<link href="<c:url value="/resources/Custom.css" />" rel="stylesheet">
	<script src="http://www.html5canvastutorials.com/libraries/three.min.js"></script>
<title>Software Design Project</title>
</head>
<body>

<div class="main" id="dimensionsNotRound" data-role="tooltip">
    <!--<label class="grid-8">Dimensions:</label>-->
    <h2 class="title"> Find Max Cube, Triangular Pyramid, Rectangular Pyramid </h2>

<form method="post">

    <div class="col-xs-12 subclass"> 
        <div class="col-xs-12">
	        <p class="subtitle ">Enter Length of the Wood below</p>
	        <div class="form-group col-xs-12">
	        	<label class=" col-sm-2 length-label">Length</label>
	        	<input class="form-control col-sm-8" name="inp-length" type="text" value="${length}"></input>	        	
	        </div>
	        <div class="form-group col-xs-12">
	        	<label class=" col-sm-2 length-label">Width</label>
	        	<input class="form-control col-sm-8" name="inp-width" type="text" value="${width}"></input>	        	
	        </div>
	        <div class="form-group col-xs-12">
	        	<label class="col-sm-2 length-label">Height</label>
	        	<input class="form-control col-sm-8" name="inp-height" type="text" value="${height}"></input>	        	
	        </div>	      
        </div>
        
        <div class="col-xs-12">
	        <p class="subtitle">Please select units from the drop down below</p>
			<div class="form-group col-xs-12">
	        	<label class="col-sm-2">Input units</label>
	        	<div class="col-sm-8">
		        	<select class="form-control" name="inp-units" id="inp1" onchange="return setValue();">            	
	                	<option value="Inches">Inches</option>
		                <option value="Centimeters">Centimeters</option>
		                <option value="Meters">Meters</option>
		                <option value="Feet">Feet</option>
		                <option value="Yards">Yards</option>              
	            	</select>	        	
            	</div>
	        </div>
	        
	        
            <div class="form-group col-xs-12">
            	<label class="col-sm-2 length-label">Output units</label>
            	<div class="col-sm-8">
		            <select class="form-control" name="output-units" id="inp">            	
		                <option value="Inches">Inches</option>
		                <option value="Centimeters">Centimeters</option>
		                <option value="Meters">Meters</option>
		                <option value="Feet">Feet</option>
		                <option value="Yards">Yards</option>
		              
		            </select>
	            </div>
            </div>	                            
        </div>
                    
       	
    </div>    
    <div class="col-xs-4 subclass">
        <div class="buttoncenter">            
            <input type="submit" class="btn btn-success" id="calcbtn" name="calcube" value="Calculate Cube" >
        </div>
    </div>
    <div class="col-xs-4 subclass">
        <div class="buttoncenter">            
            <input type="submit" class="btn btn-success" id="calcbtn" name="caltri" value="Calculate Triangular Pyramid" >
        </div>
    </div>
    <div class="col-xs-4 subclass">
        <div class="buttoncenter">            
            <input type="submit" class="btn btn-success" id="calcbtn" name="calrect" value="Calculate Rectangular Pyramid" >
        </div>
    </div>
    

    <div class="col-xs-12 subclass">
        <div class="col-xs-4 "> 
        	<label>Final Cube Side</label>
            <input class="form-control" id="op-sidelen" name="op-length" type="text" value="${side}" onchange="return getValue();"  disabled/> 
        </div>
        <div class="col-xs-4 "> 
        	<label>Cube Side Cut Length 1</label>
            <input class="form-control" id="op-sidelen1" name="op-legnth1" type="text" value="${sidelen1}" disabled /> 
        </div>
        <div class="col-xs-4 "> 
        	<label>Cube Side Cut Length 2</label>
            <input class=" form-control" id="op-sidelen2" name="op-length2" type="text" value="${sidelen2}" disabled/> 
        </div>
		
        <div class="col-xs-4"> 
        	<label>Cube Volume</label>
            <input class="form-control" name="op-vol" value="${volume}" type="text" disabled/>
            
        </div>
        
    </div>
    <input type="hidden" id="op-int" value="${type}"/>
</form>
	<div class=col-xs-12><label class="labels">${message}</label></div>
	<div class=col-xs-12><label class="labels">${message1}</label></div>
	<div id="cube" class="col-xs-8 container"></div>

</div>


<script>
	var img = '<img src="image.jpg" width="300" height="300">';

	$('.figuredisplay').html(img);
</script>

</body>
</html>