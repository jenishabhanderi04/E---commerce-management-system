<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Base64" %>
<%@ page import="java.io.*"%>
<%@ page import="java.math.*"%>
<%@	page import="java.security.MessageDigest"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>registration </title>
    <!-- CSS File -->
    <link rel="stylesheet" href="reg.css">
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
</head>
<body>
           
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");
	
	
	if(request.getParameter("submit") != null)
	{
		
		if(request.getParameter("fname") != null || request.getParameter("lname") != null || request.getParameter("email") != null ||request.getParameter("password") != null || request.getParameter("date") != null ||request.getParameter("gender") != null)
		{
			Statement st =con.createStatement();
//			String rid = request.getParameter("rid");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String add = request.getParameter("add");
			String dob = request.getParameter("dob");
			String num = request.getParameter("num");
			String password = request.getParameter("password");
			
			
			//hash password
			MessageDigest md = MessageDigest.getInstance("SHA-256");
  				md.update(password.getBytes());
  				byte[] hash = md.digest();
  				String hashpass = new String(Base64.getEncoder().encode(hash));
  				
  				
		    PreparedStatement ps = con.prepareStatement("insert into reg(name, email, address, dob,number,password,usertype) values(?,?,?,?,?,?,?);");
		    ps.setString(1,name);
		    ps.setString(2,email);
		    ps.setString(3,add);
		    ps.setString(4,dob);
		    ps.setString(5,num);
		    ps.setString(6,hashpass);
		    ps.setString(7,"user");
		   
		    int x = ps.executeUpdate();
		    response.sendRedirect("login.jsp");
		  
		}
		else
		{
			/* out.print("enter the details"); */
			/* String er = "enter the details"; */
		}
		
	}
	else
	{
		//out.print("enter the details");
	}
	}
catch(Exception e)
{
// out.println("error" +e);
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
                    <li><a href="#registration" class="nav-link">Registration</a></li>
                    <li><a href="login.jsp" class="nav-link">login</a></li>
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
            <form action="" class="form" method="post">
                <h1 class="form__title">Registration</h1>
               
                <br></br>
                <div class="form__div">
                    <input type="text" class="form__input" placeholder=" " name="name">
                    <label for="" class="form__label">Name</label>
                </div>
              
                <br></br>
                <div class="form__div">
                    <input type="text" class="form__input" placeholder=" " name="email">
                    <label for="" class="form__label">Email</label>
                </div>
             
                <br></br>
                <div class="form__div">
                    <input type="text"  class="form__input" placeholder=" " name="add">
                    <label for="" class="form__label">Address</label>
                </div>
               
                <br></br>
                 <div class="form__div">
                    <input type="date" class="form__input" placeholder=" " name="dob">
                    <label for="" class="form__label">Date of Birth</label>
                </div>
             
                <br></br>
                <div class="form__div">
                    <input type="contactnumber" class="form__input" placeholder=" " name="num">
                    <label for="" class="form__label">contact number</label>
                </div>
             
                <br></br>
                <div class="form__div">
                    <input type="password" class="form__input" placeholder=" " name="password">
                    <label for="" class="form__label">Password</label>
                </div>
               
                 

                <input type="submit" class="form__button" value="Submit" name="submit">
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
</body>
</html>