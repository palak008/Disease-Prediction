<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="com.palak.Login.ConnectionManager"%>
  <%@ page import="java.sql.*" %> 
  <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Order Online</title>
<style type="text/css">
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
ul{
list-style-type: none;
color:#4000ff;
font-size:20px;
font-family: cursive, Helvetica, sans-serif;
}
.mycart{
    border: 2px solid purple;
    width: 1000px;
    margin-left:70px;
     height:150px;
    /* Border radius for Chrome, Webkit and other good browsers */
    -webkit-border-radius: 10px;
    -moz-border-radius: 10px;
    -border-radius: 10px;
    border-radius: 10px;
}

.single{
    padding: 10px;
}
span {
    float: right;
}
.submit
{
box-sizing:border-box;
color:black;
font-weight:bold;
background-color:#ffbf00;
border-radius:2px;
height:30px;
width:100px;
border:1px solid black;
}
.but
{
box-sizing:border-box;
color:white;
font-weight:bold;
background-color:gold;
border-radius:2px;
height:40px;
width:100px;
border:2px solid white;
}
input[type=text] {
    width: 70%;
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
    margin-left:50px;
}

</style>
</head>
<body class="one">
<p style="float:right;text-decoration:underline;font-size:20px;color:black">
<% String username=(String)session.getAttribute("currentSessionUser");
out.print("Hi "+username+"!");%>
</p>
<h1>HealthyYou</h1>
<p style="text-decoration:underline;font-size:30px;color:black">Here is a list of available medicines:</p>
<br/>
<br/>
<div >
<% Connection con=ConnectionManager.makeConnection();
PreparedStatement stmt;
ResultSet rs;
stmt=con.prepareStatement("Select * from medicines");
//stmt.setString(1,(String)request.getAttribute("disease1"));
rs=stmt.executeQuery();
while(rs.next())
{
%>
<div class="mycart" style="background-color:#FFB6C1;">
<ul>
<form action="YourCart">
<li>Name : <%=rs.getString(2)%><span>Price : <%=rs.getString(4)%></span></li>
<li>Unit-size : <%=rs.getString(3)%><span>Type : <%=rs.getString(5)%><span></li>
</span>
<input type="hidden" name="sno" value=<%=rs.getString(1)%>>
<input type="submit" class="submit" style="float:right" value="ADD TO CART">
</form>
</ul>
</div>
<br/>
<br/>
<%}%>
</div></body>
</html>