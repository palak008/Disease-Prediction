<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login | Signup</title>
 <link rel="stylesheet" href="css/style_login.css">
<style>
.one
{
background-image:url(bkg.jpg);
background-repeat: no-repeat;
background-position:60% 60%;
background-size:1400px 900px;
background-color:	black;
height:700px;
}
h3
{
font-size:30px;
color:black;
text-shadow: 3px 3px white;
font-family:"Georgia" ,serif;
}

</style>
</head>
<body class="one">
<h3>HealthyYou</h3>
<div class="login-page">
  <div class="form">
    <form class="register-form" action="Signup" >
      <input type="text" name="name" placeholder="name"  autofocus required/>
      <input type="email" name="email" placeholder="email address " required/>
      <input type="password" name="pwd" placeholder="password" required/>
      <button>create</button>
      <p class="message">Already registered? <a href="#">Sign In</a></p>
    </form>
    <form class="login-form" action="Login">
      <input type="email" name="email" placeholder="username" autofocus required/>
      <input type="password" name="pwd" placeholder="password" required/>
      <button>login</button>
      <p class="message">Not registered? <a href="#">Create an account</a></p>
    </form>
  </div>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script src="js/index.js"></script>
</form>
</body>
</html>