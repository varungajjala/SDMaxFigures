<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>Max Cube</title>
</head>
<body>

<div class="main" id="dimensionsNotRound" data-role="tooltip">
    <!--<label class="grid-8">Dimensions:</label>-->
    <h2 style="text-align:center; color:red"> Find Max Cube </h2>

<form action="/ramachandra/restservice" method="post">
    <div class="col-xs-12 subclass"> 
        <div class="col-xs-12">
	        <div class="col-xs-3 length-label">Enter Length of the Wood below</div>
	        <div class="col-xs-3 length-label">Please select units from the drop down below</div>
            
        </div>
        
        <div class="col-xs-3">
            <input class="numeric-textbox form-control col-xs-3" name="inp-length" type="text" value="${len}"/>  
        </div>
            
       	<div class="col-xs-3">    
            <select class="form-control units" name="inp-units" id="inp1" onchange="return setValue();">            	
                <option value="Inches">Inches</option>
                <option value="Centimeters">Centimeters</option>
                <option value="Meters">Meters</option>
                <option value="Feet">Feet</option>
                <option value="Yards">Yards</option>
              
            </select>
        </div>
    </div>    
    <div class="col-xs-12 subclass">
        <div class="col-xs-3">            
            <input type="submit" id="calcbtn" value="Calculate Result" >
        </div>
        <div class="col-xs-3">
            <select class="form-control units" name="output-units" id="inp">
                 <option value="Inches">Inches</option>
                  <option value="Centimeters">Centimeters</option>
                  <option value="Meters">Meters</option>
                  <option value="Feet">Feet</option>
                  <option value="Yards">Yards</option>                  
            </select>
        </div>
    </div>
    

    <div class="col-xs-12 subclass">
        <div class="col-xs-4 "> <span class="labels">Cube Side</span>
            <input class="numeric-textbox form-control" id="op-sidelen" name="op-length" type="text" value="${side}" onchange="return getValue();" /> 
        </div>
        <div class="col-xs-4 "> <span class="labels">Triangular Pyramid Side</span>
            <input class="numeric-textbox form-control" id="op-sidelen" name="op-length" type="text" value="${side1}" onchange="return getValue();" /> 
        </div>
        <div class="col-xs-4"> <span class="labels">Rectangular Pyramid Side</span>
            <input class="numeric-textbox form-control" id="op-sidelen" name="op-length" type="text" value="${side2}" onchange="return getValue();" /> 
        </div>
		
        <div class="col-xs-4"> <span class="labels">Cube Volume</span>
            <input class="numeric-textbox form-control" name="op-vol" value="${volume}" type="text"/>
            
        </div>
        <div class="col-xs-4"> <span class="labels">Triangular Pyramid Volume</span>
            <input class="numeric-textbox form-control" name="op-vol" value="${volume1}" type="text"/>            
        </div>
        <div class="col-xs-4"> <span class="labels">Rectangular Pyramid Volume</span>
            <input class="numeric-textbox form-control" name="op-vol" value="${volume2}" type="text"/>
            
        </div>
    </div>
    <input type="hidden" id="op-int" value="${type}"/>
</form>
<div class="col-xs-12 subclass">
	<div id="cube" class="col-xs-4 container"></div>
	<div id ="triangular" class="col-xs-4 container"></div>
	<div id="square" class="col-xs-4 container"></div>
</div>
</div>


<script>
function setValue(){
	document.getElementById("inp").value=document.getElementById("inp1").value;
	return true;
	}

function getValue(){
	document.getElementById("inp1").value=document.getElementById("op-int").value;
	document.getElementById("inp").value=document.getElementById("inp1").value;
	return true;
	}
<%= "setValue();" %>
<%= "getValue();" %>

var camera, controls,camera1, controls1, camera2, controls2,scene,scene1,scene2, renderer,renderer1,renderer2;
var  material, material1, material2, mesh,mesh1,mesh2, directionalLight, pointLight, ambient, directionalLight1, pointLight1, ambient1, directionalLight2, pointLight2, ambient2;
var start = Date.now();
var clock = new THREE.Clock();

var canvas_width = 500;
var canvas_height = 500;
renderer = new THREE.CanvasRenderer();
renderer1 = new THREE.CanvasRenderer();
renderer2 = new THREE.CanvasRenderer();
renderer.setSize( canvas_width, canvas_height);
renderer1.setSize( canvas_width, canvas_height);
renderer2.setSize( canvas_width, canvas_height);

var check=document.getElementById("op-sidelen").value;
if(check!="")
{
getTriPyramidGeometry();
getRectPyramidGeometry();
getCubeGeometry();
animate();
}
function getCubeGeometry(){
	document.getElementById("cube").appendChild( renderer.domElement );
	var geometry = new THREE.CubeGeometry(75,75,75);
	init(geometry);
	
}
function getRectPyramidGeometry() {
	document.getElementById("square").appendChild( renderer1.domElement );
	/////square pyramid...would prefer to be able to make rectangle base as well///
	var geometry = new THREE.CylinderGeometry( 0, 112.5, 79.6, 4, 1 );
	init1(geometry);
}
function getTriPyramidGeometry() {
	document.getElementById("triangular").appendChild( renderer2.domElement );
	var geometry = new THREE.TetrahedronGeometry( 150, 0);
	init2(geometry);
	}
function init(geometry, isCustom) {
	
	camera = new THREE.PerspectiveCamera( 75, canvas_width/canvas_height, 1, 10000 );
	camera.position.z = 300;
	
	scene = new THREE.Scene();
	
	material = new THREE.MeshLambertMaterial( { color: 0x96d3ea  } );
	mesh = new THREE.Mesh( geometry, material );
	
	if (isCustom){
		material.side = THREE.DoubleSide;
		mesh.doubleSided = true;
	}
	
	scene.add( mesh );
	
	ambient = new THREE.AmbientLight( 0x0000ff );
	ambient.position.set(0, -70, 100).normalize();
	scene.add( ambient );

	directionalLight = new THREE.DirectionalLight( 0xffffff );
	directionalLight.position = camera.position;
	scene.add( directionalLight );;

}

function init1(geometry, isCustom) {
	
	camera1 = new THREE.PerspectiveCamera( 75, canvas_width/canvas_height, 1, 10000 );
	camera1.position.z = 300;
	
	scene1 = new THREE.Scene();
	
	material1 = new THREE.MeshLambertMaterial( { color: 0x96d3ea  } );
	mesh1 = new THREE.Mesh( geometry, material1 );
	
	if (isCustom){
		material1.side = THREE.DoubleSide;
		mesh1.doubleSided = true;
	}
	
	scene1.add( mesh1 );
	
	ambient1 = new THREE.AmbientLight( 0x0000ff );
	ambient1.position.set(0, -70, 100).normalize();
	scene1.add( ambient1 );

	directionalLight1 = new THREE.DirectionalLight( 0xffffff );
	directionalLight1.position = camera1.position;
	scene1.add( directionalLight1 );;

}

function init2(geometry, isCustom) {
	
	camera2 = new THREE.PerspectiveCamera( 75, canvas_width/canvas_height, 1, 10000 );
	camera2.position.z = 300;
	
	scene2 = new THREE.Scene();
	
	material2 = new THREE.MeshLambertMaterial( { color: 0x96d3ea  } );
	mesh2 = new THREE.Mesh( geometry, material2 );
	
	if (isCustom){
		material2.side = THREE.DoubleSide;
		mesh2.doubleSided = true;
	}
	
	scene2.add( mesh2 );
	
	ambient2 = new THREE.AmbientLight( 0x0000ff );
	ambient2.position.set(0, -70, 100).normalize();
	scene2.add( ambient2 );

	directionalLight2 = new THREE.DirectionalLight( 0xffffff );
	directionalLight2.position = camera2.position;
	scene2.add( directionalLight2 );;

}



function animate() {

	// note: three.js includes requestAnimationFrame shim
	requestAnimationFrame( animate );
	render();
	render1();
	render2();
}


function render(){
	var delta = Date.now() - start;	
	directionalLight.position = camera.position;	
	//mesh.position.y = Math.abs( Math.sin( delta * 0.002 ) ) * 150;
	mesh.rotation.x = delta * 0.0003;
	mesh.rotation.z = delta * 0.0002;	
	renderer.render( scene, camera );
	

}

function render1(){
	var delta = Date.now() - start;	
	directionalLight1.position = camera1.position;	
	//mesh.position.y = Math.abs( Math.sin( delta * 0.002 ) ) * 150;
	mesh1.rotation.x = delta * 0.0003;
	mesh1.rotation.z = delta * 0.0002;	
	
	renderer1.render( scene1, camera1 );
	

}

function render2(){
	var delta = Date.now() - start;	
	directionalLight2.position = camera2.position;	
	//mesh.position.y = Math.abs( Math.sin( delta * 0.002 ) ) * 150;
	mesh2.rotation.x = delta * 0.0003;
	mesh2.rotation.z = delta * 0.0002;	
	renderer2.render( scene2, camera2 );

}

</script>

</body>
</html>