<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>shopping cart</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="cart.css">

</head>
<body>

<jsp:include page="header.jsp" />
  <%
String session_name = (String)session.getAttribute("user_email");
String sessionid = (String)session.getAttribute("user_id");

%>



<div class="container">

<section class="shopping-cart">

   <h1 class="heading">shopping cart</h1>

   <table>

      <thead>
         <th>image</th>
         <th>name</th>
         <th>price</th>
         <th>quantity</th>
         <th>total price</th>
         <th>action</th>
      </thead>

      <tbody>

        
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");

//display the data

if(request.getParameter("remove")!= null)
{

	String id = request.getParameter("remove");
	 PreparedStatement ps = con.prepareStatement("delete from cart where cid = ?;");
		
	    ps.setString(1,id);
	 
	    int x = ps.executeUpdate();
	
}

int price=0;

int quantity=0;

int sub=0;

int total = 0;


Statement s = (Statement)con.createStatement();
//ResultSet rs = s.executeQuery("select * from cart where user_id = "+sessionid+"");
ResultSet rs = s.executeQuery("select * from cart join pro on cart.pid=pro.id where user_id = "+sessionid+"");
       
       
while(rs.next())
{
	
	price = Integer.parseInt(rs.getString("price"));

	quantity = rs.getInt(5);

	sub = quantity*price;

	total += sub;
	
	
	 String imgFileName=rs.getString("image");
	 int temp=1;
	 if(request.getParameter("update_quantity") != null){
		 temp = Integer.parseInt(request.getParameter("update_quantity"));
	 }
%>
         <tr>
            <td><img src="./images/<%=imgFileName %>" height="100" alt=""></td>
            <td> <%= rs.getString(2) %></td>
            <td> <%= rs.getString(3) %>/-</td>
            <td>
                <form action="" method="">
                  <input type="hidden" name="update_quantity_id"  value="<%= rs.getString(1) %> " >
                  <input type="number" name="update_quantity"   value="<%= rs.getString(5) %>" placeholder="<%out.print(temp); %>" >
                  <input type="submit" value="update" name="add">
               </form>   
               
              <%--  <a href="cart.jsp?sub=<%= rs.getString("cid") %>" class="qty qty-minus">-</a>

<input type="numeric" value="<%= rs.getString("quantity") %>" />

<a href="cart.jsp?add=<%= rs.getString("cid") %>" class="qty qty-plus">+</a>
                --%>
               
               
               
            </td>
           <%--  <td><%out.print(Integer.parseInt(rs.getString(3)) * temp); %>/-</td> --%>
           <td><%out.print(sub); %>/-</td>
            <td><a href="cart.jsp?remove= <%= rs.getString(1)%>" onclick="return confirm('remove item from cart?')" class="delete-btn"> <i class="fas fa-trash"></i> remove</a></td>
         </tr>
         <%
         out.print(total);
         %>
           <%
}

//copy

if(request.getParameter("add")!= null){

//int nqty=quantity+1;


try

{

String id = request.getParameter("update_quantity_id");
String nqty = request.getParameter("update_quantity");

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");

String sql2="Update cart set quantity="+nqty+" where cid="+id;

PreparedStatement ps = conn.prepareStatement(sql2);




ps.executeUpdate();

response.sendRedirect("cart.jsp");

}

catch(Exception ex){

out.println(ex);

}

}

if(request.getParameter("sub")!= null){

int nqty=quantity-1;

try

{

String id = request.getParameter("sub");

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");

String sql2="Update cart set quantity="+nqty+" where cid="+id;

PreparedStatement ps = con.prepareStatement(sql2);

ps.executeUpdate();

response.sendRedirect("cart.jsp");

}

catch(Exception ex){

out.println(ex);

}

}


%>
         
         <tr class="table-bottom">
            <td><a href="displayproduct.jsp" class="option-btn" style="margin-top: 0;">continue shopping</a></td>
            <td colspan="3">grand total</td>
            <td><%out.print(total); %>/-</td>
            <td><a href="cart.php?delete_all" onclick="return confirm('are you sure you want to delete all?');" class="delete-btn"> <i class="fas fa-trash"></i> delete all </a></td>
         </tr>

      </tbody>

   </table>
   
   
   <div class="checkout-btn">
      <a href="checkout.jsp" class="btn <?= ($grand_total > 1)?'':'disabled'; ?>">procced to checkout</a>
   </div>

</section>

</div>
   
<!-- custom js file link  -->
<script src="proscript.js"></script>

</body>
</html>