<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=s, initial-scale=1.0">
    <title>services</title>
    <link rel="stylesheet" href="newservices.css">
    <link rel="stylesheet" href="feedback.css">
     <%


response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");    
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
%>
</head>
<style> 
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}
 

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color:hotpink;
  color: white;
}
h1{
    color: hotpink;
    text-align: center;
}

</style>





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
                    <li><a href="index.jsp#contact" class="nav-link">contact</a></li>
                   
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




    <div class="full-img" id="fullimgbox">
        <img src="s (1).jpg" alt="" id="fullimg">
        <span onclick="closefullimg()">X</span>
    </div>
    <div class="img-gallery">
        <img src="s (1).jpg" alt="" onclick="openfullimg(this.src)">
        <img src="s (2).jpg" alt="" onclick="openfullimg(this.src)">
        <img src="s (3).jpg" alt="" onclick="openfullimg(this.src)">
        <img src="s (11).jpg" alt="" onclick="openfullimg(this.src)">
        <img src="s (4).jpg" alt="" onclick="openfullimg(this.src)">
        <img src="s (10).jpg" alt="" onclick="openfullimg(this.src)">
        <img src="s (5).jpg" alt="" onclick="openfullimg(this.src)">
        <img src="s (6).jpg" alt="" onclick="openfullimg(this.src)">
        <!-- <img src="s (13).jpg" alt="" onclick="openfullimg(this.src)"> -->
    </div>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");

//display the data


Statement s = (Statement)con.createStatement();
ResultSet rs = s.executeQuery("select * from service ");
%>



   





<div class="container">



<section class="display-product-table">

   <table id ="customers">
 <h1> View Service</h1>
      <thead>
         
         <th>Service</th>
         <th>cost</th>
         
        

      </thead>

      <tbody>
       

       <%
       
       
while(rs.next())
{
	
%>
<tr>
<td> <%= rs.getString(2) %></td>
<td> <%= rs.getString(3) %></td>




</tr>
<%
}%>


   </table>

 <ul class="link">

 
  
</section>

<section class="edit-form-container">

  

  

</section>

</div>

<!-- footer start -->




    <script>
        var fillimgbox = document.getElementById("fullimgbox");
        var fillimg = document.getElementById("fullimg");

        function openfullimg(pic){
            fullimgbox.style.display = "flex";
            fullimg.src = pic;
            
        }
        function closefullimg() {
            fullimgbox.style.display = "none";
        }
    </script>

    <script src="feedback.js"></script>
</body>
</html>