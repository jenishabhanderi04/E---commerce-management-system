<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*"%>



<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <!-- CSS File -->
    <link rel="stylesheet" href="login.css">
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <title>pay</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
   <%
 
String session_name = (String)session.getAttribute("user_email");
String sessionid = (String)session.getAttribute("user_id");

   %>
   
    <%
   
  

   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");

   Statement s1 = (Statement)conn.createStatement();
   ResultSet rs1 = s1.executeQuery("select * from order1 where user_id = "+sessionid+"");
  // ResultSet rs1 = s1.executeQuery("select * from cart join pro on cart.pid=pro.id where user_id = "+sessionid+"");
          
          
   while(rs1.next())
   {
	   
	   
   	
   /* 	price = Integer.parseInt(rs1.getString("price"));

   	quantity = rs1.getInt(5);

   	sub = quantity*price;

   	total += sub;
   	 */
  %>
 



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
            <form action=" payment_process.jsp" class="form" method="POST">
                <h1 class="form__title">PAY</h1>
                
                <div class="form__div">
                    <input  class="form__input" type="textbox" name="name" id="name" value="<%= rs1.getString("name") %>" >
                    <label for="" class="form__label">Name</label>

                </div>
                
                <div class="form__div">
                    <input class="form__input" type="textbox" name="amt" id="amt" placeholder="Enter amt" value="<%= rs1.getString("total") %>">
                    
                    <label for="" class="form__label">Price</label>
                </div>
   
                <input type="button" class="form__button" id="btn" value="Pay Now" onclick="pay_now()" name="btn">
          
 
          
            </form>
             <% 
   }
   
   
   %>
        </div>
                    
                </div>

            </div>






<!-- 
<form method="POST" action="payment_process.php">
    <input type="textbox" name="name" id="name" placeholder="Enter your name" value="<?php echo $name; ?>" /><br/><br/>
    <input type="textbox" name="amt" id="amt" placeholder="Enter amt" value="<?php echo $total_price; ?>"/><br/><br/>
    <input type="button" name="btn" id="btn" value="Pay Now" onclick="pay_now()"/>
</form> -->

<script>
    function pay_now(){
        var name=jQuery('#name').val();
        var amt=jQuery('#amt').val();
        
         jQuery.ajax({
               type:'post',
               url:'payment_process.jsp',
               data:"amt="+amt+"&name="+name,
               success:function(result){
                   var options = {
                        "key": "rzp_test_HcLrivzAR5rGdZ", 
                        "amount": amt*100, 
                        "currency": "INR",
                        "name": "BEAUTY",
                        "description": "Test Transaction",
                        "image": "https://image.freepik.com/free-vector/logo-sample-text_355-558.jpg",
                        "handler": function (response){
                           jQuery.ajax({
                               type:'post',
                               url:'payment_process.jsp',
                               data:"payment_id="+response.razorpay_payment_id,
                               success:function(result){
                                   window.location.href="thankyou.jsp";
                               }
                           });
                        }
                    };
                    var rzp1 = new Razorpay(options);
                    rzp1.open();
               }
           });
        
        
    }
</script>
</body>
</html>
