<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="about1.css">
    <link rel="stylesheet" href="aboutstyle.css">
    <title>Preview About</title>
    <%


response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");    
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
%>
    
</head>
<body>
    <!-- header start -->
    <header class="header" id="header">
        <div class="navbar">
            <div class="logo">
                <img src="img/logo.svg">
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
                    
                    <%
                    
                   
                    
                    if(session.getAttribute("user_id")== null)
                    {
                    	%>
                    	    <li><a href="reg.jsp" class="nav-link">Registration</a></li>
                        <li><a href="login.jsp" class="nav-link">login</a></li>
                    	<% 
                    }
                    else
                    {
                    	%>
                    	
                    	<li><a href="udash.jsp" class="nav-link">Dashboard</a></li>
                    	<li><a href="logout.jsp" class="nav-link">logout</a></li>
                    	
                    <% 
                    }
                    
                    
                    
                    %>
                    
                    
                </ul>
            </nav>
            <div class="nav-toggle" id="nav-toggle">
                <i class="fas fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- header end -->

    <div class="wrapper">

        <div class="background-container">
            <div class="bg-1"></div>
            <div class="bg-2"></div>
    
        </div>
        <div class="about-container">
            
            <div class="image-container">
                <img src="ab.jpeg" alt="">
                
            </div>

            <div class="text-container">
                <h1>Studio Hair</h1>
                <p>Beauty is the gift of god and transmitted from one to the other generation. The beauty parlour shop is the need of every age of men women and children famours poet keats defined the word beauty as : " A thing of beauty is a joy for ever: Beauty parlour is a very important shop to make the people good looking by application of cosmetics treatment of hair and nourishment of skin by various methods . Also their economic independence encourages them to resort this type of services.</p>
            </div>
            
        </div>
    </div>  
    
    <!-- footer start -->
<footer class="footer" id="contact">
    <div class="footer-list">
        <div class="footer-data">
            <h1><a href=""><img src="logo.svg"></a></h1>
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
<script src="main.js"></script>
</body>
</html>