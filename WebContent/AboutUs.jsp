<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style_homepage.css">
<title>About</title>
</head>
<style>
.one
{
background-image:url(ab.jpg);
background-repeat: no-repeat;
background-position:60% 60%;
background-size:1400px 750px;
background-color:	black;
}
h1
{
font-size:50px;
text-align:center;
color:black;
text-shadow: 3px 3px white;
font-family:"Georgia" ,serif;
}
div
{
color:darkblue;
font-size:17px;
}
</style>
<body class="one">
<s:include value="NavigationBar.jsp"></s:include>
<p style="float:right;text-decoration:underline;font-size:20px;color:black">
<% String username=(String)session.getAttribute("currentSessionUser");
out.print("Hi "+username+"!");%>
</p>
<h1>HealthyYou</h1>
<div>
<p>
With the digitalization of the world everyone depends on the internet for 
everything hence there should be an online portal which could recommend 
prescription drugs as a remedy on the basis of the symptoms entered by the user.
This project will not only help the patients with doctor's fees but also it will
 avoid the lone patients to leave their house to get medicines and medical help.
</p>
<h3>Overview</h3>
<p>
All existing medical WSEs (Web Search Engines) assume that searchers can form 
appropriate queries by themselves. However, most Internet users do not have much
 medical knowledge. Frequently, a medical information searcher has only a vague 
 idea about the problem that he is facing and does not know the proper way to 
 clearly describe his situation in sufficient detail. As a result, 
 appropriate guidance is highly necessary during the medical search process. 
 This can be illustrated by an analogy to the medical diagnosis process existing 
 WSEs is unsuitable for medical search when the searcher does not know the proper
  way to clearly describe his situation in sufficient detail. Especially, the 
  searcher often has no idea about what information is important for finding the
 desired results.
</p>
<p>
The idea deals with the symptoms of the user to analyze the disease and will
 suggest the required drugs as a cure. For a country like India where people do
  not much believe in allopathic medicines hence natural remedies will also be
   suggested as a remedy. And the preventions for the disease will also be mentioned
    so as for a better and faster cure. For the diseases with unconfirmed symptoms some
     tests will be suggested and also the nearest health care centers will be mentioned 
     where the tests can be carried out.
</p>

<h2> DEVELOPERS</h2>
<p>
Palak Bansal</p>
<p>
Paras Mehta</p>
<p>Saurabh Agrawal
</p>
</div>
</body>
</html>