<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.List"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/autocomplete.js"></script>
<title>Home</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  
<style>
.foot
{
text-align:center;
background:#303030;
padding-top:20px;
padding-bottom:20px;
color: #858484;
border-left: 1px solid rgba(153, 153, 153, 0.13);
}
.foot h3
{

	font-size:1.2em;
	font-family: 'Open Sans', sans-serif;
	color:#007DAD;

}
input[type=text] {
    width: 80%;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
    background-image: url('search_icon.png');
    background-size:40px 40px;
    background-position:2px 2px;
    background-repeat: no-repeat;
    padding: 12px 20px 12px 40px;
}
.submit
{
box-sizing:border-box;
color:#FAFAFA;
background-color:#207CCA;
border-radius:4px;
height:50px;
width:100px;
border:2px solid black;
}

</style>
 
  <link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="css/responsiveslides.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script src="js/responsiveslides.min.js"></script>
		  <script>
		    // You can also use "$(window).load(function() {"
			    $(function () {
			      // Slideshow 1
			      $("#slider1").responsiveSlides({
			        maxwidth: 2500,
			        speed: 600
			      });
			});
		  </script>
</head>
<body>
<s:include value="NavigationBar1.jsp"></s:include>

			<!---End-header---->
			<!---start-images-slider---->
			<div class="image-slider">
						<!-- Slideshow 1 -->
					    <ul class="rslides rslides1" id="slider1" style="max-width: 2500px;">
					      <li id="rslides1_s0" class="" style="display: block; float: none; position: absolute; opacity: 0; z-index: 1; -webkit-transition: opacity 600ms ease-in-out; transition: opacity 600ms ease-in-out;">
					      	<img src="images/slider3.png" alt="">
					      	<div class="slider-info">
					      		<p>Check Your Symptoms</p>
					      		<span>Our website helps you to diagnose diseases </span>
					      		
					      	</div>
					      </li>
					      <li id="rslides1_s1" class="" style="float: none; position: absolute; opacity: 0; z-index: 1; display: list-item; -webkit-transition: opacity 600ms ease-in-out; transition: opacity 600ms ease-in-out;"><img src="images/slider2.png" alt="">
					      	<div class="slider-info">
					      		<p>Find Hospitals near you</p>
					      		<span>Find Hospitals, Pharmacies and Gymnasiums around you</span>
					      		
					      	</div>
					      </li>
					      <li id="rslides1_s2" class="rslides1_on" style="float: left; position: relative; opacity: 1; z-index: 2; display: list-item; -webkit-transition: opacity 600ms ease-in-out; transition: opacity 600ms ease-in-out;"><img src="images/slider2.png" alt="">
					      	<div class="slider-info">
					      		<p>Buy medicines at low cost</p>
					      		<span>Buy medicines at reasonable prices </span>
					      		
					      	</div>
					      </li>
					    </ul>
						 <!-- Slideshow 2 -->
					</div>
			<!---End-images-slider---->
			<!----start-content----->
			
			<div class="content">
				<div class="content-top-grids">
					<div class="wrap">
						<div class="content-top-grid">
							<div class="content-top-grid-header">
								<div class="content-top-grid-pic">
									<a href="#"><img src="images/timer.png" title="image-name" /></a>
								</div>
								<div class="content-top-grid-title">
									<h3>24x7 Services</h3>
								</div>
								<div class="clear"> </div>
							</div>
								<p>We endeavour to provide 24*7 Services to you so that you can diagnose the disease from which you may be suffering early and take necessary measures so that you stay healthy and happy always.</p>
								<a class="grid-button" href="#">READ MORE</a>
								<div class="clear"> </div>
						</div>
						<div class="content-top-grid">
							<div class="content-top-grid-header">
								<div class="content-top-grid-pic">
									<a href="#"><img src="images/tool.png" title="image-name" /></a>
								</div>
								<div class="content-top-grid-title">
									<h3>FIND HOSPITALs</h3>
								</div>
								<div class="clear"> </div>
							</div>
								<p>By entering your city and distance in meters you can find hospitals pharmacies and gymnasiums around you.All the relevant places are marked on the Google Maps</p>
								<a class="grid-button" href="#">Try it</a>
								<div class="clear"> </div>
						</div>
						<div class="content-top-grid">
							<div class="content-top-grid-header">
								<div class="content-top-grid-pic">
									<a href="#"><img src="images/inject.png" title="image-name" /></a>
								</div>
								<div class="content-top-grid-title">
									<h3>SYMPTOM CHECKER</h3>
								</div>
								<div class="clear"> </div>
							</div>
								<p>We have developed a symptom checker which lets you enter symptoms and predict the most probable disease and thereafter suggests diagnosis methods and treatments.</p>
								<a class="grid-button" href="#">Try it</a>
								<div class="clear"> </div>
						</div>
						<div class="clear"> </div>
					</div>
				</div>
				<div class="clear"> </div>

<!---End-wrap---->
		<!---start-footer---->
		<div class="foot">
						<h3>CONTACTS</h3>
						 <p>Palak Bansal</p>
						 <p>palakbansalgp8@gmail.com</p>
						 <span>+91-9650131165</span>
					
		</div>
		<!---End-footer---->
 

</body>
</html>