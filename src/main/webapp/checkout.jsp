<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>checkout</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="cart.css">

</head>
<body>
<jsp:include page="header.jsp" />

<div class="container">

<section class="checkout-form">

   <h1 class="heading">complete your order</h1>

   <form action="" method="post">

   <div class="display-order">
     

   <%
 
String session_name = (String)session.getAttribute("user_email");
String sessionid = (String)session.getAttribute("user_id");
   %>
   
  
   

   
   
   
   
   
   
   
   <%
   
   int price=0;

   int quantity=0;

   int sub=0;

   int total = 0;

   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");

   Statement s1 = (Statement)conn.createStatement();
   //ResultSet rs = s.executeQuery("select * from cart where user_id = "+sessionid+"");
   ResultSet rs1 = s1.executeQuery("select * from cart join pro on cart.pid=pro.id where user_id = "+sessionid+"");
          
          
   while(rs1.next())
   {
   	
   	price = Integer.parseInt(rs1.getString("price"));

   	quantity = rs1.getInt(5);

   	sub = quantity*price;

   	total += sub;
   	
   }
   	
   
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");
	
	
	if(request.getParameter("order_btn") != null)
	{
		
	//	if(request.getParameter("name") != null || request.getParameter("cost") != null)
		//{
			Statement st =con.createStatement();

			String name = request.getParameter("name");
			String number = request.getParameter("number");
			String email = request.getParameter("email");
			String method = request.getParameter("method");
			String address = request.getParameter("flat");
			String pin_code = request.getParameter("pin_code");
			//int total = request.getParameter("total");
			
		    PreparedStatement ps = con.prepareStatement("insert into order1(name,number,email,method,address,pin_code,total,user_id) values(?,?,?,?,?,?,?,?);");
		    ps.setString(1,name);
		    ps.setString(2,number);
		    ps.setString(3,email);
		    ps.setString(4,method);
		    ps.setString(5,address);
		    ps.setString(6,pin_code);
		    ps.setInt(7,total);
		    ps.setString(8,sessionid);
		    out.print(total);
		    
		    
		  int x = ps.executeUpdate();
		  response.sendRedirect("raz_index.jsp");
		    
	//	}
		//else
		//{
			// out.print("enter the details");
			/* String er = "enter the details"; */
	//	}
		
	}
	else
	{
		//out.print("enter the details");
	}
	}
catch(Exception e)
{
 /* out.println("error" +e); */
}

    
   
   %>
   
   
   
   <span class="grand-total"> grand total : <%= total%> /- </span>
   <%
   ResultSet select_cart = s1.executeQuery("SELECT * FROM `cart` where `user_id` = " + sessionid);
  
   if(select_cart.next()){
       do{
           int total_price = (select_cart.getInt("price") * select_cart.getInt("quantity"));
          
   %>
   <span><%= select_cart.getString("name") %>(<%= select_cart.getInt("quantity") %>)</span>
   <%
       } while(select_cart.next());
   }
   
   %>
   
   
     </div>
   
   
   <%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");

//display the data


Statement s = (Statement)con.createStatement();
ResultSet rs = s.executeQuery("select * from reg where rid ="+sessionid+" ");
%>


<%
       
       
while(rs.next())
{
	
%>
   
 


   

      <div class="flex">
         <div class="inputBox">
            <span>your name</span>
            <input type="text" placeholder="enter your name" name="name" value="<%= rs.getString("name") %>">
         </div>
         <div class="inputBox">
            <span>your number</span>
            <input type="number" placeholder="enter your number" name="number" value="<%= rs.getString("number") %>" >
         </div>
         <div class="inputBox">
            <span>your email</span>
            <input type="email" placeholder="enter your email" name="email" value="<%= rs.getString("email") %>">
         </div>
         <div class="inputBox">
            <span>payment method</span>
            <select name="method">
              
               <option value="credit cart">online payment</option>
                <option value="cash on delivery" selected>cash on devlivery</option>
               
            </select>
         </div>
         <div class="inputBox">
            <span>address </span>
            <input type="text" placeholder="e.g. flat no." name="flat" value="<%= rs.getString("address") %>">
         </div>
        <!--  <div class="inputBox">
            <span>address line 2</span>
            <input type="text" placeholder="e.g. street name" name="street" required>
         </div>
         <div class="inputBox">
            <span>city</span>
            <input type="text" placeholder="e.g. mumbai" name="city" required>
         </div>
         <div class="inputBox">
            <span>state</span>
            <input type="text" placeholder="e.g. maharashtra" name="state" required>
         </div>
         <div class="inputBox">
            <span>country</span>
            <input type="text" placeholder="e.g. india" name="country" required>
         </div> -->
         <div class="inputBox">
            <span>pin code</span>
            <input type="text" placeholder="e.g. 123456" name="pin_code" required>
         </div>
      </div>
      <input type="submit" value="order now" name="order_btn" class="btn">
      
<%
       
}
	
%>
   </form>

</section>

</div>

<!-- custom js file link  -->
<script src="proscript.js"></script>
   
</body>
</html>