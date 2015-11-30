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
<title>Max Tri Pyramid</title>
</head>
<body>

<div class="main" id="dimensionsNotRound" data-role="tooltip">
    <!--<label class="grid-8">Dimensions:</label>-->
    <h2 class="title"> Instructions for finding Max Volume of Triangular Pyramid  </h2>

<form method="get">
    

    <div class="col-xs-12 subclass">
        <div class="col-xs-4 "> 
        	<label>Final Triangular Pyramid Side Length</label>
            <input class="form-control" id="op-sidelen" name="op-length" type="text" value="${side}" onchange="return getValue();"  disabled/> 
        </div>
        <div class="col-xs-4 "> 
        	<label>Wood Cut Length</label>
            <input class="form-control" id="op-sidelen1" name="op-legnth1" type="text" value="${sidelen1}" disabled /> 
        </div>
		
        <div class="col-xs-4"> 
        	<label>Triangular Pyramid Volume</label>
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