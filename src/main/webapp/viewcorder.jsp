<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>




<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Boxicons -->
  <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

  <!-- My CSS -->
  <link rel="stylesheet" href="dashstyle.css">

  <title>AdminHub</title>
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
  <%


response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");    
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
%>
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


 <%
 
String session_name = (String)session.getAttribute("user_email");
String sessionid = (String)session.getAttribute("user_id");


                    if(session.getAttribute("user_id")== null)
                    {
                    	response.sendRedirect("login.jsp");	
                    }
                   
                    
                    
                    
                    %>
                    

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
              <a href="dashindex.php">Dashboard</a>
            </li>
            <li><i class='bx bx-chevron-right' ></i></li>
            <li>
              <a class="active" href="index.jsp">Home</a>
            </li>
          </ul>
        </div>
        <!-- <a href="#" class="btn-download">
          <i class='bx bxs-cloud-download' ></i>
          <span class="text">Download PDF</span>
        </a> -->
      </div>

      <!-- <ul class="box-info">
        <li>
          <i class='bx bxs-calendar-check' ></i>
          <span class="text">
            <h3>1020</h3>
            <p>New Order</p>
          </span>
        </li>
        <li>
          <i class='bx bxs-group' ></i>
          <span class="text">
            <h3>2834</h3>
            <p>Visitors</p>
          </span>
        </li>
        <li>
          <i class='bx bxs-dollar-circle' ></i>
          <span class="text">
            <h3>$2543</h3>
            <p>Total Sales</p>
          </span>
        </li>
      </ul>
 -->
<%-- <%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");

//display the data


Statement s = (Statement)con.createStatement();
ResultSet rs = s.executeQuery("select * from reg where rid ="+sessionid+" ");
%> --%>



   





<div class="container">



<section class="display-product-table">

   <table id ="customers">
<h1> View order Details</h1>
      <thead>
         
         <th>Name</th>
         <th>Number</th>
         <th>Email</th>
         <th>Method</th>
         <th>Address</th>
         <th>Pincode</th>
         <th>Total_price</th>
        
      </thead>

      <tbody>
           
<%
int start = 0;
int limit = 7;
int total = 0;
int id = 1;

if(request.getParameter("id") != null) {
id = Integer.parseInt(request.getParameter("id"));
start = (id - 1) * limit;
}

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");
stmt = conn.createStatement();
 
//Get total number of rows
rs = stmt.executeQuery("SELECT COUNT(*) AS count FROM order1 where user_id ="+sessionid+"");
if(rs.next()) {
 total = rs.getInt("count");
}

//Get rows for current page
rs = stmt.executeQuery("SELECT * FROM order1 where user_id ="+sessionid+" LIMIT " + start + "," + limit);

//Print table
/* out.println("<table>"); */
while(rs.next()) {
	
	 %>
	 
	<tr>
<td> <%= rs.getString(2) %></td>
<td> <%= rs.getString(3) %></td>
<td> <%= rs.getString(4) %></td>
<td> <%= rs.getString(5) %></td>
<td> <%= rs.getString(6) %></td>
<td> <%= rs.getString(7) %></td>
<td> <%= rs.getString(8) %></td>



</tr>

	 
<%
 
}
%>




   </table>

 <ul class="link">

 
  
</section>

<section class="edit-form-container">

  

  

</section>

</div>
<%
/* out.println("</table>"); */

//Print pagination links
int page1 = (int) Math.ceil((double) total / limit);
out.println("<ul class=\"link\">");
for(int i = 1; i <= page1; i++) {
 out.println("<li><a href=\"?id=" + i + "\">" + i + "</a></li>");
}
out.println("</ul>");


} catch(Exception e) {
e.printStackTrace();
} finally {
try {
if(rs != null) rs.close();
if(stmt != null) stmt.close();
if(conn != null) conn.close();
} catch(Exception e) {
e.printStackTrace();
}
}
%>


       

   



  <script src="dashscript.js"></script>

</body>
</html>

