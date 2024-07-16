<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
           <%@ page import="java.sql.*"%>
    <!DOCTYPE html>
<html lang="en">
<head>
    <style>
        
        .error{
            color: red;
            margin-top: 0px;
            padding-top: 0px;
        }
    </style>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit service Form</title>
    <!-- CSS File -->
    <link rel="stylesheet" href="addservice.css">
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
</head>
<body>
    

    <!-- header start -->
     <header class="header" id="header">
        <div class="navbar">
            <div class="logo">
                <img src="logo (1).svg">
            </div>
            <nav class="nav-menu" id="nav-menu">
                <ul class="nav-list">
                    <li><a href="#" class="nav-link active">home</a></li>
                    <li><a href="#about" class="nav-link">about</a></li>
                    <li><a href="#services" class="nav-link">services</a></li>
                    <li><a href="#package" class="nav-link">package</a></li>
                    <li><a href="#gallery" class="nav-link">gallery</a></li>
                    <li><a href="#product" class="nav-link">products</a></li>
                    <li><a href="#contact" class="nav-link">contact</a></li>
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
                   <!--  <img src="img/b1.jpg" class="I"> -->
                </div>
                 <div class="L">
                     <div class="l-form">
                      <%
String session_name = (String)session.getAttribute("user_email");
String sessionid = (String)session.getAttribute("user_id");

%>
                     
                     <%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");


try{
	if(request.getParameter("update")!= null)
	{
	 String update = request.getParameter("update");
		
		//display the data


		Statement s = (Statement)con.createStatement();
		ResultSet rs = s.executeQuery("select * from reg where rid ="+update+"");
		
		while(rs.next())
		{



%>
			
		
           <form action="" class="form" method="post">
                <h1 class="form__title">Registration</h1>
               
                <br></br>
                <div class="form__div">
                    <input type="text" class="form__input" placeholder=" " name="name"  value="<%= rs.getString("name") %>">
                    <label for="" class="form__label">Name</label>
                </div>
              
                <br></br>
                <div class="form__div">
                    <input type="text" class="form__input" placeholder=" " name="email"  value="<%= rs.getString("email") %>">
                    <label for="" class="form__label">Email</label>
                </div>
             
                <br></br>
                <div class="form__div">
                    <input type="text"  class="form__input" placeholder=" " name="add"  value="<%= rs.getString("address") %>">
                    <label for="" class="form__label">Address</label>
                </div>
               
                <br></br>
                 <div class="form__div">
                    <input type="date" class="form__input" placeholder=" " name="dob"  value="<%= rs.getString("dob") %>">
                    <label for="" class="form__label">Date of Birth</label>
                </div>
             
                <br></br>
                <div class="form__div">
                    <input type="contactnumber" class="form__input" placeholder=" " name="num"  value="<%= rs.getString("number") %>">
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

  <% 
            if(request.getParameter("update")!= null)
	{
	
		Statement st =con.createStatement();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String add = request.getParameter("add");
		String dob = request.getParameter("dob");
		String num = request.getParameter("num");
		String password = request.getParameter("password");
		
		String id = request.getParameter("update");

    	
		     PreparedStatement ps = con.prepareStatement("update reg set name=?,email=?,address=?,dob=?,number=?, where id = ?;");
		    ps.setString(1,name);
		    ps.setString(2,email);
		    ps.setString(3,add);
		    ps.setString(4,dob);
		    ps.setString(5,num);
		    ps.setString(6,sessionid);
		   
		    ps.setString(3,id);
		 
		    int x = ps.executeUpdate();
	  
		   response.sendRedirect("manageservice.jsp"); 
		
		
	}
           
		}
		
		
	}

}
catch(Exception e)
{
	//out.println(e);
}

%>
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
    <script src="addservice.js"></script>
</body>
</html>