<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*"%>
<%@ page import="java.util.Base64" %>
<%@ page import="java.io.*"%>
<%@ page import="java.math.*"%>
<%@	page import="java.security.MessageDigest"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <!-- CSS File -->
    <link rel="stylesheet" href="login.css">
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

<style>
.er{
color:red;
text-align:center;
margin-top:70px;
margin-bottom:0px;
}
</style>
<%


response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");    
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
%>
</head>
<body>
<!-- validation start -->




<!-- validation end -->

<!-- cookies -->
 <%
    Cookie[] cookies = request.getCookies();
    String username="";
    String passw = "";
    if(cookies!=null)
    {
      for(int i=0;i<cookies.length;i++){
        Cookie cookie = cookies[i];
        if(cookie.getName().equals("username-cookie"))
        {
            username= cookie.getValue();
        }
        else if(cookie.getName().equals("password-cookie"))
        {
            passw= cookie.getValue();
        }
      }
    }
   %>
   
   <%
    String user=request.getParameter("email");
    String pass=request.getParameter("password");

    String rememberMe=  request.getParameter("rememberMe");
    if(rememberMe!=null)
    {
        Cookie usernameCookie = new Cookie("username-cookie", user);
        Cookie passwordCookie = new Cookie("password-cookie", pass);
        usernameCookie.setMaxAge(24*60*60);
        passwordCookie.setMaxAge(24*60*60);
        response.addCookie(usernameCookie);
        response.addCookie(passwordCookie);
        }
    %> 
<!-- end -->



<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");
	
	String type= "";
	int login= -1;
	
	if(request.getParameter("submit") != null)
	{
		
		if(request.getParameter("email") != null || request.getParameter("password") != null)
		{
			String uname = request.getParameter("email");
			String password = request.getParameter("password");

			// Hash the entered password
			MessageDigest md = MessageDigest.getInstance("SHA-256");
				md.update(password.getBytes());
				byte[] hash = md.digest();
				String hashpass = new String(Base64.getEncoder().encode(hash));

			PreparedStatement ps = con.prepareStatement("SELECT * FROM reg WHERE email = ? and password = ?");
			ps.setString(1, uname);
			ps.setString(2, hashpass);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				type = rs.getString("usertype");
			session.setAttribute("user_email", uname);
			session.setAttribute("user_id", rs.getString("rid"));
			session.setAttribute("user_name", rs.getString("name"));
			login=1;
			
		
		} 
			else
			{
		} 
			if(login==1)
			{
				switch(type)
				{
				  case "user":
					  response.sendRedirect("index.jsp");
					  case "admin":
						  response.sendRedirect("dashindex.jsp");
				}
			}
			else{
			%>
			<p class="er"><%out.print("invalid username and password!"); %></p>
			<% 
			
		}
		}
		else
		{
			
			

		}
		
	}

    
    }
catch(Exception e)
{
 out.println("error" +e);
}

%>
    <!-- header start -->
     <header class="header" id="header">
        <div class="navbar">
            <div class="logo">
                <img src="logo (1).svg">
            </div>
            <nav class="nav-menu" id="nav-menu">
                <ul class="nav-list">
                    <li><a href="index.jsp" class="nav-link active">home</a></li>
                    <li><a href="about.jsp" class="nav-link">about</a></li>
                    <li><a href="newservice.jsp" class="nav-link">services</a></li>
                    <li><a href="index.jsp#package" class="nav-link">package</a></li>
                    <li><a href="index.jsp#gallery" class="nav-link">gallery</a></li>
                    <li><a href="displayproduct.jsp" class="nav-link">product</a></li>
                    <li><a href="#contact" class="nav-link">contact</a></li>
                    <li><a href="reg.jsp" class="nav-link">Registration</a></li>
                   
                    <li><a href="#login" class="nav-link">login</a></li>
                </ul>
            </nav>
            <div class="nav-toggle" id="nav-toggle">
                <i class="fas fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- header end -->
    <!-- login form -->

            <div class="M">
                <div class="F">
                    <!--  <section class="gallery-slider">
        <div class="slide">
         </div>
    </section> -->

                  <!--   <img src="b1.jpg" class="I">  -->
                </div>
                 <div class="L">
                     <div class="l-form">
            <form action="" class="form" method="post" onsubmit ="return check()">
                <h1 class="form__title">Login</h1>
                <p class="err"> </p>
                <div class="form__div">
                    <input type="text" class="form__input" placeholder=" " name="email" value ="<%= username %>">
                   
                    <label for="" class="form__label" >Email</label>
                </div>
                <span id = "user-message" style="color:red"> </span>
                <div class="form__div">
                    <input type="Password" class="form__input" placeholder=" " name="password" value="<%= passw %>">
                    
                    <label for="" class="form__label">Password</label>
                </div>
                <span id = "pass-message" style="color:red"> </span>
               <!--  <div class="form__div">
                    <input type="text" class="form__input" placeholder=" " name="code">
                    
                    <label for="" class="form__label">Verification Code</label>
                </div>
                     -->
               

                <input type="submit" class="form__button" value="Submit" name="submit">
                                  
                
                 <input type="checkbox" name="rememberMe" id="rememberMe" value ="true">Remember me
           
          <!--   <a href="forgetpass.jsp">forget password</a> -->
            </form>
        </div>

                </div>

            </div>

 

<!-- footer start -->
<footer class="footer" id="contact">
        <div class="footer-list">
            <div class="footer-data">
                <h1><a href=""><img src="logo (1).svg"></a></h1>
                <div class="footer-data-social">
                    <a href=""><i class="fab fa-facebook"></i></a>
                    <a href=""><i class="fab fa-instagram"></i></a>
                    <a href=""><i class="fab fa-twitter"></i></a>
                </div>
            </div>
            <div class="footer-data">
                <h2>address</h2>
                <p>Alharm - St 26<br> Giza - Egypt</p>
            </div>
            <div class="footer-data">
                <h2>We Opened</h2>
                <p>Monday To Friday <br> From 09:00 To 18:00</p>
            </div>
            <div class="footer-data">
                <h2>Contact</h2>
                <p>(20) 1111-222-333</p>
                <p>(20) 4444-555-666</p>
            </div>
        </div>
        <div class="copy">
            <p>&copy; All Rights Reserved</p>
            <span>Created by 🤎 Web Trend</span>
        </div>
    </footer>
<!-- footer end -->
    <!-- Javascript File -->
    <script src="book.js"></script>
    <script>  
function check() {  
	var uname = document.getElementById("email").value;
	if(uname == ""){
  		document.getElementById("user-message").innerHTML = "**Fill the username please!";  
     	return false;
  	}
	
  	var pw = document.getElementById("password").value;  
  	//check empty password field  
  	if(pw == "") {  
     	document.getElementById("pass-message").innerHTML = "**Fill the password please!";  
     	return false;  
  	}  
  if(uname != null || pw != null)
	  {
	    document.getElementById("er-message").innerHTML = "**Incorrect Username and Password!";  
     	return false;
	  
	  }
  	
  }

</script>
</body>
</html>