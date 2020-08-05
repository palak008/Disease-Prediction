<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/style_homepage.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/autocomplete.js"></script>
<title>SymptomChecker</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<style>
.one
{
background-color:lightgrey;
}
h1
{
font-size:50px;
text-align:center;
color:black;
text-shadow: 3px 3px white;
font-family:"Georgia" ,serif;
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
footer
{
margin-top:22em;
font-size:20px;
background-color:black;
text-align:center;
color:white;
}
.cb
{
font-size:20px;
color:black;
margin-left:2em;
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

</style>
<body class="one">
<s:include value="NavigationBar.jsp"></s:include>
<p style="float:right;text-decoration:underline;font-size:20px;color:black">
<% String username=(String)session.getAttribute("currentSessionUser");
out.print("Hi "+username+"!");%>
</p>
<h1>HealthyYou</h1>
<strong><h2>Enter the symptoms you are facing:</h2></strong>
 <form action="MyClassifier" style="margin-left:5em;margin-top:2em;">
  <input type="text" name="symp1" id="tags" value="" placeholder="Enter your symptoms here:(Eg: fever,chills etc )" required autofocus >
  <input type="submit" style="margin-left:2em" value="Submit" name="submit" class="submit">
</form> 
</body>
</html>