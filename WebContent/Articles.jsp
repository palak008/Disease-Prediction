<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.List"%>
<%@ page import="java.io.IOException"%>
<%@ page import="org.jsoup.Jsoup"  %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page  import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Articles</title>
</head>
<style>
 h1
{
font-size:50px;
text-align:center;
color:black;
text-shadow: 3px 3px lightgrey;
font-family:"Georgia" ,serif;
}
.one
{
background-image:url(bkg1.jpg);
background-repeat: no-repeat;
background-position:top left;
background-size:1400px 700px;
background-color:	black;
background-attachment:fixed;
}
.two
{
float:right;
}
h2
{
text-align:center;
color:red;
text-decoration:underline;
text-shadow: 1px 1px blue;
}
</style>
<body class="one">
<p style="float:right;text-decoration:underline;font-size:20px;color:black">
<% String username=(String)session.getAttribute("currentSessionUser");
out.print("Hi "+username+"!");%>
</p>
<h1>HealthyYou</h1>
<%String dis=request.getParameter("dis");%>
<h2>Articles on <% out.print(dis) ;%></h2>
<div class="two">
<%
         final String GOOGLE_SEARCH_URL = "https://www.google.com/search";
         String searchTerm="";
         searchTerm=request.getParameter("dis");
		int num = 10;
		String searchURL = GOOGLE_SEARCH_URL + "?q="+searchTerm+"&num="+num;
		//without proper User-Agent, we will get 403 error
		Document doc = Jsoup.connect(searchURL).userAgent("Mozilla/5.0").get();
		
		//below will print HTML data, save it to a file and open in browser to compare
		//System.out.println(doc.html());
		
		//If google search results HTML change the <h3 class="r" to <h3 class="r1"
		//we need to change below accordingly
		Elements results = doc.select("h3.r > a");

		for (Element result : results) {
			String linkHref = result.attr("href");
			String linkText = result.text();
			request.setAttribute( "link",linkHref.substring(7, linkHref.indexOf("&")));
			%>
			<h3><%= linkText %></h3>
			<h4>Url:<a href="<c:url value="${link}" />" >${link}</a></h4></br>
		<%
		}
        %>
</div>      
</body>
</html>