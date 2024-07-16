<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="java.sql.*"%>


<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>products</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="pstyle.css">

   <link rel="stylesheet" href="prohead.css">
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<style>
p{
  

}

</style>
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
                    	
                        <li><a href="logout.jsp" class="nav-link">logout</a></li>
                    	
                    <% 
                    }
                    
                    
                    
                    %>
       <!-- addtocart -->  
                    
                   <%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");
	
	
	if(request.getParameter("add") != null || session.getAttribute("user_id") != null)
	{
		
		if(request.getParameter("product_name") != null || request.getParameter("product_price") != null || request.getParameter("product_image") != null  || request.getParameter("service") != null)
		{
			Statement st =con.createStatement();
//			String rid = request.getParameter("rid");
			String product_name = request.getParameter("product_name");
			String product_price = request.getParameter("product_price");
			String product_image = request.getParameter("product_image");
			String service = request.getParameter("service");
		
		
		
		    PreparedStatement ps = con.prepareStatement("insert into bookpackage(name,price,service,user_id) values(?,?,?,?);");
		    ps.setString(1,product_name);
		    ps.setString(2,product_price);
		    ps.setString(3,service);
		    ps.setString(4,sessionid);
		  
		    int x = ps.executeUpdate();
		    
		    out.print("<p>book the package</p>");
		
		  
		}
		else
		{
			/* out.print("enter the details"); */
			/* String er = "enter the details"; */
			
		}
		
	}
	else
	{
		  response.sendRedirect("login.jsp");	
	
	}
	}
catch(Exception e)
{
 out.println("error" +e);
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




<div class="container">

<section class="products">

   <h1 class="heading">latest packages</h1>

   <div class="box-container">
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");

//display the data


Statement s = (Statement)con.createStatement();
ResultSet rs = s.executeQuery("select * from package ");
%>
      
       <%
       
       
while(rs.next())
{
	 String imgFileName=rs.getString("image");
%>
       <form action="" method="post">
         <div class="box">
            <img src="images/<%=imgFileName%> " alt="">
             <h3> <%= rs.getString(2) %></h3>
            <div class="price"><%= rs.getString(4) %>/-</div>
            <div class="price"><%= rs.getString(3) %></div>
            <br>
            <input type="hidden" name="product_name" value="<%= rs.getString(2) %>">
            <input type="hidden" name="product_price" value="<%= rs.getString(4) %>">
            <input type="hidden" name="product_image" value="<%=imgFileName%>">
            <input type="hidden" name="service" value="<%= rs.getString(3) %>">
            <!-- <input type="submit" class="btn" value="book package" name="add_to_cart"> -->
            <input class="btn" name="submit" type="submit" value="book package">
         </div>
      </form>
     <%
}%>
   </div>

</section>

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
<!-- custom js file link  -->
<script src="proscript.js"></script>

</body>
</html>