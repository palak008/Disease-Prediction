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
<link rel="stylesheet" href="css/style_homepage.css">  

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/autocomplete.js"></script>
<title>Home1</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color:#333;
}

li {
    float: right;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover:not(.active) {
    background-color:cyan;
}

 .active {
    background-color:darkcyan;
}
 dl{
    margin: 0 0 0 2em; /* Add some left margin for inner lists */
}
 dt{
    position: relative;
    display: block;
    padding: .4em .4em .4em 2em; 
    margin: .5em 0;
    background: #eee;
    color: #444;
    text-decoration: none;
    border-radius: .3em;
    font-size:20px;
     
}
dd
{
color:#800000;
line-height:140%;
font-size:18px;
font-family:Tahoma, Geneva, sans-serif;
}
 a:hover{
    background: #ddd;
}
  a:before{
    content: ">";
    position: absolute; 
    left: -1.9em;
    top: 50%;
    margin-top: -1.3em;
    background: #87ceeb;
    height: 2em;
    width: 2em;
    line-height: 2em;
    border: .3em solid #fff;
    text-align: center;
    font-weight: bold;
    border-radius: 2em;
    
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
footer
{
margin-top:20em;
font-size:20px;
background-color:black;
text-align:center;
color:white;
}
</style>
</head>
<body class="one">
<s:include value="NavigationBar.jsp"></s:include>
<p style="float:right;text-decoration:underline;font-size:20px;color:black">
<% String username=(String)session.getAttribute("currentSessionUser");
out.print("Hi "+username+"!");%>
</p>
<h1>HealthyYou</h1>
<form style="margin-left:5em;margin-top:2em;" action="Search" >
<input type="text" name="search_query" id="search_query" value="" placeholder="Enter your symptoms here:(Eg: fever,chills etc )" required autofocus >
<input type="submit" name="Search" value="Search"  class="submit"  >
</form>	
<div >
<p style="font-size:30px;text-decoration:underline;color:black">Here is a list of probable diseases :</p>
<% List dList = (List)request.getAttribute("results");
request.setAttribute("dList", dList);
List pList = (List)request.getAttribute("prob_diseases");
request.setAttribute("pList", pList);
%>
<c:forEach items="${dList}" var="disease">
    <dl >
        <dt><a href="Articles.jsp?dis=${disease.getDisease_name()}"><c:out value="${disease.getDisease_name()}"/></a></dt>
        <dd >SYMPTOMS : <c:out value="${disease.getDisease_symptoms()}"/></dd>
        <dd >TREATMENTS : <c:out value="${disease.getDisease_treatments()}"/></dd>
        <dd >PARENT DISEASE : <c:out value="${disease.getDisease_parentDisease()}"/></dd>
        <dd >RISK FACTORS : <c:out value="${disease.getDisease_riskFactors()}"/></dd>    
    </dl>
</c:forEach>
</div>
</body>
<footer>
<p>
Contact Us : +91 8130846195</p>
</footer>
</html>