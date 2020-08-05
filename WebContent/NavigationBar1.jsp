<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="header">
					<div class="top-header">
						<div class="wrap">
						<div class="top-header-left">
							<p>+9650131165</p>
						</div>
						<div class="right-left">
							<ul>
								<li class="login"><a href="#">Login</a></li>
								<li class="sign"><a href="#"><% String username=(String)session.getAttribute("currentSessionUser");
out.print("Hi "+username+"!");%></a></li>
							</ul>
						</div>
						<div class="clear"> </div>
					</div>
				</div>
				<div class="main-header">
						<div class="wrap">
							<div class="logo">
									Healthy You
							</div>
													<div class="clear"> </div>
						</div>
					</div>
					<div class="clear"> </div>
					<div class="top-nav">
						<div class="wrap">
							<ul>
								<li class="active"><a href="index.jsp">Home</a></li>
								<li><a href="AboutUs.jsp">About</a></li>
								<li><a href="Home.jsp">All Diseases</a></li>
								<li><a href="SymptomChecker.jsp">Symptom Checker</a></li>
								<li><a href="findHospitals.jsp">Find Hospitals</a></li>
								<li><a href="Buy.jsp">Buy</a></li>
								<div class="clear"> </div>
							</ul>
						</div>
					</div>
			</div>
</body>
</html>