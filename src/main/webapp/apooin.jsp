<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>appointment</title>
    <!-- CSS File -->
    <link rel="stylesheet" href="apooin.css">
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
   <style>
       
       .se{

       }
   </style>

  </head>
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
                   <li><a href="index.jsp" class="nav-link active">home</a></li>
                    <li><a href="about.jsp" class="nav-link">about</a></li>
                    <li><a href="newservices.jsp" class="nav-link">services</a></li>
                    <li><a href="index.jsp#package" class="nav-link">package</a></li>
                    <li><a href="index.jsp#gallery" class="nav-link">gallery</a></li>
                    <li><a href="displayproduct.jsp" class="nav-link">products</a></li>
                    <li><a href="index.jsp#contact" class="nav-link">contact</a></li>
                   
 <%
 
String session_name = (String)session.getAttribute("user_email");
String sessionid = (String)session.getAttribute("user_id");


                    
                    %>
                   
                    <% 
                   
                    if(session.getAttribute("user_id")== null)
                    {
                    	response.sendRedirect("login.jsp");
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
    <!-- login form -->

            <div class="M">
                <div class="F">
                     <!-- <section class="gallery-slider">
        <div class="slide">
         </div>
    </section> -->

                  <!--   <img src="b1.jpg" class="I">  -->
                </div>
                 <div class="L">
                     <div class="l-form">
            <form action="" class="form" method="post">
                <h1 class="form__title">BOOK APPOINTMENT</h1>
                <div class="form__div">
           
                
                <%
               
                Statement stmt = null;
               
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");
               
                stmt = con.createStatement();
               // ResultSet result1=null;
               
                ResultSet rs1  = stmt.executeQuery("SELECT * FROM reg where rid ="+sessionid+" ");
                while(rs1.next()) {
                
                %>
                
                
                <%
                
                if(request.getParameter("submit") != null)
            	{
                	
            		
            		if(request.getParameter("name") != null || request.getParameter("email") != null || request.getParameter("number") != null || request.getParameter("date") != null || request.getParameter("time") != null || request.getParameter("service") != null)
            		{
            			Statement st =con.createStatement();

            			String name = request.getParameter("name");
            			String email = request.getParameter("email");
            			String number = request.getParameter("number");
            			String date = request.getParameter("date");
            			String time = request.getParameter("time");
            			String service[] = request.getParameterValues("service");
            			String s = String.join(",", service);
            			
            		    PreparedStatement ps = con.prepareStatement("insert into bookappointment(name,email,number,date,time,service,user_id,status) values(?,?,?,?,?,?,?,?);");
            		    ps.setString(1,name);
            		    ps.setString(2,email);
            		    ps.setString(3,number);
            		    ps.setString(4,date);
            		    ps.setString(5,time);
            		    ps.setString(6,s);
            		    ps.setString(7,sessionid);
            		    ps.setString(8,"panding");
            		 
            		    int x = ps.executeUpdate();
            		 // response.sendRedirect("manageservice.jsp");
            		  
            		}
            		else
            		{
            			 out.print("enter the details");
            			/* String er = "enter the details"; */
            		}
            		
            	}
                
                
                
                
                %>
                
                
                
                    <input type="text" class="form__input" placeholder=" " name="name" value="<%= rs1.getString(2) %>">
                    <label for="" class="form__label">Name</label>
                </div>
                <div class="form__div">
                    <input type="text" class="form__input" placeholder=" " name="email" value="<%= rs1.getString(3) %>">
                    <label for="" class="form__label">Email</label>
                </div>

                <div class="form__div">
                    <input type="contactnumber" class="form__input" placeholder=" " name="number" value="<%= rs1.getString(6) %>">
                    <label for="" class="form__label">contact number</label>
                </div>
                
                <%
                }
                
                %>
                <div class="form__div">
                    <input type="date" class="form__input" placeholder=" " name="date" >
                    <label for="" class="form__label">book date</label>
                </div>
                <div class="form__div">
                    <input type="time" class="form__input" placeholder=" " name="time">
                    <label for="" class="form__label">Appointment Time</label>
                </div>
                <div class="form__div" >
                
               
                <select class="form__input" name="service" multiple>
    <option>select service</option>
    <% 
    String sql = "SELECT servicename,cost FROM service";
    ResultSet result1 = stmt.executeQuery(sql);

    while(result1.next()) {
        String serviceName = result1.getString("servicename");
        int cost = result1.getInt("cost");
%>
        <option value="<%= serviceName %>, cost=<%= cost %>"><%= serviceName %>, cost=<%= cost %></option>
<% 
    }
%>
</select>





    

            </div>


                <!--  <div class="form__div">
                    <input type="text" class="form__input" placeholder=" ">
                    <label for="" class="form__label">service</label>
                </div> -->

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
    <script>
     
    </script>
</body>
</html>