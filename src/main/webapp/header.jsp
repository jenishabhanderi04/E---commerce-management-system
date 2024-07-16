<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*"%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<header class="header">

   <div class="flex">
  
      <a href="displayproduct.jsp" class="logo">shopping</a>

      <nav class="navbar">
         <!-- <a href="admin.php">add products</a> -->
         <a href="displayproduct.jsp">view products</a>
      </nav>
 <% 
                    
String session_name = (String)session.getAttribute("user_email");
String sessionid = (String)session.getAttribute("user_id");

%>

<% 
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");

Statement st=con.createStatement();
String strQuery = "SELECT COUNT(*) FROM cart where where user_id = "+sessionid+" ";
ResultSet rs = st.executeQuery(strQuery);

int Countrow;
  while(rs.next()){
  Countrow = rs.getInt(1);
  /* out.println("Total Row :" +Countrow); */
  
  %>
  
    <a href="cart.jsp" class="cart">cart <span><%=Countrow %></span> </a>
  
  <%
  
   } 
  
  
}
catch(Exception e)
{
	
}

%>
      

    

      <div id="menu-btn" class="fas fa-bars"></div>

   </div>

</header>


</body>
</html>