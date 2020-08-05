<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.palak.Login.ConnectionManager"%>
    <%@ page import="java.sql.*" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="css/style_homepage.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Result</title>

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
p
{
margin-left:1em;
font-size:25px;
color:black;
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
color:darkmagenta;
line-height:140%;
font-size:18px;
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
<p>Predicted disease : <u><%out.print(request.getAttribute("disease1")); %></u></p>
<% Connection con=ConnectionManager.makeConnection();
PreparedStatement stmt=con.prepareStatement("Select * from medications where disease=?");
stmt.setString(1,(String)request.getAttribute("disease1"));
ResultSet rs=stmt.executeQuery();
String drug="";
if(rs.next())
{
	drug=rs.getString(1);
}
%>
<dl>
<%
stmt=con.prepareStatement("Select * from disease_details where disease=?");
stmt.setString(1,(String)request.getAttribute("disease1"));
rs=stmt.executeQuery();
while(rs.next())
{
%>
<dt>OVERVIEW</dt>
<dd><%=rs.getString(1)%></dd>
<dt>SYMPTOMS</dt>
<dd><%=rs.getString(2)%></dd>
<dt>DIAGNOSIS</dt>
<dd><%=rs.getString(3)%></dd>
<dt>TREATMENTS</dt>
<dd><%=rs.getString(4)%></dd>
<%}%>
</dl>
</br></br>
<p><u>ACCURACY OF THE SYSTEM IS :<%=request.getAttribute("accuracy") %>%</u></p>
<div id="chartContainer" style="height: 300px; width: 60%;">
 </div>
</body>
</html>