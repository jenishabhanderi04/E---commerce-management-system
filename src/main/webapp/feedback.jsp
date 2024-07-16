<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>feedback</title>
    <!-- CSS File -->
    <link rel="stylesheet" href="feedback.css">
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

<%


response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");    
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
%>
</head>
<body>
 <%
 
String session_name = (String)session.getAttribute("user_email");
String sessionid = (String)session.getAttribute("user_id");


                    if(session.getAttribute("user_id")== null)
                    {
                    	response.sendRedirect("login.jsp");	
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
                    <li><a href="index.jsp#contact" class="nav-link">contact</a></li>
                    
                    <li><a href="logout.jsp" class="nav-link">logout</a></li>
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
                     <section class="gallery-slider">
        <div class="slide">
         </div>
    </section>
 

   <%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");
	
	
	if(request.getParameter("submit") != null)
	{
		
		if( request.getParameter("comment") != null || request.getParameter("email") != null )
		{
			Statement st =con.createStatement();
//			String rid = request.getParameter("rid");
			
			String email = request.getParameter("email");
			String comment = request.getParameter("comment");
		
  				
		    PreparedStatement ps = con.prepareStatement("insert into feedback(email, comment,user_id) values(?,?,?);");
		  
		    ps.setString(1,email);
		    ps.setString(2,comment);
		    ps.setString(3,sessionid);
		  
		    int x = ps.executeUpdate();
		    response.sendRedirect("index.jsp");	
		   
		  
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




                   <!--  <img src="img/b1.jpg" class="I"> -->
                </div>
                 <div class="L">
                     <div class="l-form">
            <form  class="form" method="post" >
                <h1 class="form__title">Feedback</h1>

                <div class="form__div">
                    <input type="text" class="form__input" placeholder=" " name="email" >
                    <label for="" class="form__label">Email</label>
                </div>

                <div class="form__div">
                    <input type="text" class="form__input" placeholder=" " name="comment">
                    <label for="" class="form__label">Comment</label>
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
    <script src="feedback.js"></script>
</body>
</html>