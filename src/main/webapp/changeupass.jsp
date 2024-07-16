<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%-- <%@page import="com.connect.conn"%> --%>
<%@page import="java.security.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <!-- custom css file link  -->
   <!-- <link rel="stylesheet" href="prostyle.css"> -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Boxicons -->
  <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

  <!-- My CSS -->
  <link rel="stylesheet" href="dashstyle.css">
  <link rel="stylesheet" href="changepassstyle.css">

  <title>view bookpackage</title>
  <style>
      .link {
     list-style-type: none;
     padding-left: 500px;
     margin-top: 20px;

}
.link a{
text-decoration: none;
background-color:hotpink;
display: inline;
float:left;
color:white;
font-size: 20px;
padding: 5px;
margin-left: 5px;
height: 40px;
width: 40px;
padding-left: 15px;
}
.link a:hover{
background-color:white;
color: hotpink;


}

.link ul li {
    display: none;
}

    .add {
    text-decoration: none;
    padding: 2px 5px;
    background: hotpink;
    color: white;
    border-radius: 3px;
    font-size: 20px;
    font-family: Arial, Helvetica, sans-serif;
}
h1{
  color: hotpink;
  text-align: center;
}
  
  .edit {
    text-decoration: none;
    padding: 2px 5px;
    background: #2E8B57;
    color: white;
    border-radius: 3px;
    

}

.del {
    text-decoration: none;
    padding: 2px 5px;
    color: white;
    border-radius: 3px;
    background: #800000;
}

#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
  margin-top: 20px;
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
  background-color: hotpink;
  color: white;
}
h1{
  color: hotpink;
  text-align: center;
  

}
  </style>
</head>
<body>


  <!-- SIDEBAR -->
	<section id="sidebar">
		<a href="#" class="brand">
			<!-- <i class='bx bxs-smile'></i> -->
			<span class="text">customer</span>
		</a>
		<ul class="side-menu top">
			<li class="active">
				<a href="udash.jsp">
					<i class='bx bxs-dashboard' ></i>
					<span class="text">Dashboard</span>
				</a>
			</li>
			<li>
				<a href="udash.jsp">
					<i class='bx bxs-user-detail'></i>
					<!-- <i class='bx bxs-shopping-bag-alt' ></i> -->
					<span class="text">View Details</span>
				</a>
			</li>
		
			<li>
				<a href="viewcapooin.jsp">
					<!-- <i class='bx bxs-message-dots' ></i> -->
					<i class='bx bx-spreadsheet'></i>
					<span class="text">View Appointments</span>
				</a>
			</li>
			
			<li>
<a href="viewcbookpack.jsp">
					<!-- <i class='bx bxs-group' ></i> -->
					<i class='bx bxs-add-to-queue'></i>
					<span class="text">View book package</span>
				</a>
			</li>
			
			<li>
				<a href="viewcorder.jsp">
					<!-- <i class='bx bxs-group' ></i> -->
					<i class='bx bxs-shopping-bag-alt'></i>
					<span class="text">View Product Order</span>
				</a>
			</li>

			<li>
				<a href="viewcpayment.jsp">
					<!-- <i class='bx bxs-group' ></i> -->
					<i class='bx bx-spreadsheet'></i>
					<span class="text">View Paymnet</span>
				</a>
			</li>
			<li>
				<a href="viewcf.jsp">
					<!-- <i class='bx bxs-group' ></i> -->
					<i class='bx bx-spreadsheet'></i>
					<span class="text">View Feedback</span>
				</a>
			</li>

		</ul>
		<ul class="side-menu">
			<!-- <li>
				<a href="#">
					<i class='bx bxs-cog' ></i>
					<span class="text">Settings</span>
				</a>
			</li> -->
			<li>
				<a href="logout.jsp" class="logout">
					<i class='bx bxs-log-out-circle' ></i>
					<span class="text">Logout</span>
				</a>
			</li>
		</ul>
	</section>
  <!-- SIDEBAR -->




  <!-- CONTENT -->
  <section id="content">
    <!-- NAVBAR -->
    <nav>
      <i class='bx bx-menu' ></i>
      <a href="#" class="nav-link">Categories</a>
      <form action="">
        <div class="form-input">
          <input type="search" placeholder="Search...">
          <button type="submit" class="search-btn"><i class='bx bx-search' ></i></button>
        </div>
      </form>
      <input type="checkbox" id="switch-mode" hidden>
      <label for="switch-mode" class="switch-mode"></label>
      <a href="#" class="notification">
        <i class='bx bxs-bell' ></i>
        <span class="num">8</span>
      </a>
      <a href="#" class="profile">
        <img src="dashimg/people.png">
      </a>
    </nav>
    <!-- NAVBAR -->

    <!-- MAIN -->
    <main>
      <div class="head-title">
        <div class="left">
          <h1>Dashboard</h1>
          <ul class="breadcrumb">
            <li>
              <a href="#">Dashboard</a>
            </li>
            <li><i class='bx bx-chevron-right' ></i></li>
            <li>
              <a class="active" href="index.jsp">Home</a>
            </li>
          </ul>
        </div>
     
<!-- product -->
<%
 
String session_name = (String)session.getAttribute("user_email");
String sessionid = (String)session.getAttribute("user_id");


                    if(session.getAttribute("user_id")== null)
                    {
                    	response.sendRedirect("login.jsp");	
                    }
                   
                    
                    
                    
                    %>





<!-- <div class="container"> -->


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
<form  method="post" class="form" enctype="multipart/form-data">
   <h3 class="form__title">Change Password</h3>
	
    <div class="form__div">
                    <input type="password" class="form__input" placeholder=" " name="password">
                    <label for="" class="form__label"> Password</label>
                </div>

  <div class="form__div">
                    <input type="password" class="form__input" placeholder=" " name="confirmPassword">
                    <label for="" class="form__label">Confirm Password</label>
                </div>
               




   <input type="submit" value="Change Password" name="submit" class="form__button">
  </form>


<%
if(request.getParameter("submit") != null){
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");
		String mail = (String)session.getAttribute("user_email");
		String pwd = request.getParameter("password");
		String user = (String)session.getAttribute("user");
		String cpwd = request.getParameter("confirmPassword");
		String hashValue;
		
		
		
		MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(pwd.getBytes());
			byte[] hash = md.digest();
			String hashpass = new String(Base64.getEncoder().encode(hash));
			
			
			
		if(pwd.equals(cpwd)){
			PreparedStatement p = con.prepareStatement("update "+ user + " set password = '"+hashpass+"' where email= '"+mail+"';");
			p.executeUpdate();
			if(user.equals("reg"))
			{
				response.sendRedirect("login.jsp");	
			}
			else{
				//response.sendRedirect("login-candidates.jsp");
			}
			
		}else{
			out.println("<script>alert('Enter password properly..');</script>");
		}
	}catch(Exception e){
		System.out.println(e);
	}
}
%>

</div>

</div>
</div>
</div>



<section class="edit-form-container">

  

  

</section>

</div>


<section class="edit-form-container">

  

  

</section>

</div>
 

<!-- end product -->

  <script src="dashscript.js"></script>
</body>
</html>

