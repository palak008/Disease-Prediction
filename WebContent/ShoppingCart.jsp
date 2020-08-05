<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="com.palak.Login.Cart1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="css/style_homepage.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Your cart</title>
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
h2
{
margin-left:50px;
color:#4000ff;
}
.but
{
float:center;
box-sizing:border-box;
color:black;
font-weight:bold;
background-color:lightgreen;
border-radius:2px;
height:40px;
width:100px;
border:2px solid white;
}
table {
color:#333;
font-size:20px;
font-family:Helvetica,Arial,sans-serif;
width:100%;
border-spacing:1px;
border-collapse:separate;
padding:5px 3px;
}

td, th {
height:45px;
transition:all 1s;
text-align:center;
width:auto;
}
.qty{
color:black;
}
th {
background:darkcyan;
font-weight:700;
border-radius: 5px;
color:white;
}

td {
background:#FAFAFA;
}

tr:nth-child(even) td {
background:#ffe1e6;
}

tr:nth-child(odd) td {
background:#ffc4cd;
}

tr td:hover {
background:#666;
color:#FFF
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
<h2>SHOPPING CART</h2>

<% 
Cart1 shoppingCart=(Cart1)session.getAttribute("cart");
HashMap<String,Float> items = shoppingCart.getCartItems();
//HashMap<String,Float> shoppingCart=(HashMap)request.getAttribute("cart");
%>
<table id="myTable">
<thead>
<tr>
<th>Medicine/ProductName</th>
<th>Price(Rs)</th>
</tr></thead>
<tbody>
<% 
//HashMap<String, Float> items = shoppingCart.getCartItems();
            for(HashMap.Entry<String,Float> entry : items.entrySet()) {
            	out.println("<tr><td>"+entry.getKey()+" </td>");%>
           <% out.println("<td>"+entry.getValue()+" </td></tr>"); 
           }%>
</tbody>
</table>
<br/>
<br/>
<div style="text-align:center">
<a href="Buy.jsp"><button class="but">BUY MORE</button></a>
</div>

</body>
</html>