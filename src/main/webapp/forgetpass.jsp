<%@page import="java.sql.*"%>
		<%@page import="java.sql.Connection"%>
		<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.SQLException"%>
		<%-- <%@page import="com.connect.conn"%> --%>
		<%@page import="java.util.concurrent.ThreadLocalRandom"%>
		<%@ page import="javax.mail.*"%>
		<%@ page import="javax.mail.internet.*"%>
		<%@ page import="javax.activation.*"%>
		<%@ page import="java.util.*" %>
		<%@ page import="java.io.*" %>
		<%@ page import="java.lang.Object" %>
		
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
  <link rel="stylesheet" href="login.css">

  <title>view bookpackage</title>
  <style>
    
  </style>
</head>
<body>
<%
if(request.getParameter("submit") != null){
	//System.out.println("hello");
	try{
		int flag = 0;
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");
		Statement statement = con.createStatement() ;
	    ResultSet resultset =statement.executeQuery("select * from reg where usertype = 'user';") ;
	    int number = ThreadLocalRandom.current().nextInt(1000, 9999 + 1);
	    String mail = request.getParameter("email");
	    while(resultset.next()){
	    		if(request.getParameter("email").equals(resultset.getString(3))){
	    			flag = 1;
	    		}
	         }
	    if(flag == 1){
	    	System.out.println("hello");
	    	session.setAttribute("OTP",number);
	    	session.setAttribute("email",mail);
	    	session.setAttribute("user","jobreg");
	    	System.out.println(number);
	    	try{
	    		//SMTP for sending mail
	    		System.setProperty("javax.net.debug", "ssl:handshake");
	    		//Creating a result for getting status that messsage is delivered or not!
	    		String to=mail;  
	    		String subject="Your OTP";  
	    		String message="Thank you for contacting us. Here is Your OTP:"+number;  
	
	
	    		String from="beautyparlour493@gmail.com";  
        		String pass="ovfqclzskberrqev";  
	    		String host="smtp.gmail.com";  
	
	    		Properties props = System.getProperties();
	    		System.setProperty("jdk.tls.client.cipherSuites","TLS_AES_128_GCM_SHA256,TLS_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_DHE_RSA_WITH_AES_128_GCM_SHA256,TLS_DHE_RSA_WITH_AES_256_GCM_SHA384,TLS_RSA_WITH_AES_128_GCM_SHA256,TLS_RSA_WITH_AES_256_GCM_SHA384");
	
	    		props.put("mail.smtp.starttls.enable", "true");
	
	    		props.put("mail.smtp.ssl.protocols", "TLSv1.3");
	    		props.put("mail.smtp.host", host);  
	    		props.put("mail.smtp.user", from);  
	    		props.put("mail.smtp.password", pass);  
	    		props.put("mail.smtp.port", "587");  
	    		props.put("mail.smtp.auth", "true");
	    		props.put("mail.smtp.ssl.trust", "*");
	
	
	    		Session se = Session.getDefaultInstance(props, null);  
	    		MimeMessage mimeMessage = new MimeMessage(se);  
	    		mimeMessage.setFrom(new InternetAddress(from));  
	    		mimeMessage.setRecipient(Message.RecipientType.TO,new InternetAddress(to));  
	    		mimeMessage.setSubject(subject);  
	    		mimeMessage.setText(message);  
	    		Transport transport = se.getTransport("smtp");  
	    		transport.connect(host, from, pass);  
	    		transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());  
	    		request.removeAttribute("email");
	
	    		}
	    		catch(Exception e)
	    		{
	    		System.out.println(e);
	    		}
	    	
	    	response.sendRedirect("otp.jsp");
	    } else{
	    	 ResultSet resultset1 =statement.executeQuery("select * from reg where usertype = 'admin';") ;
	        while(resultset1.next()){
	        		if(request.getParameter("email").equals(resultset1.getString(3))){
	        			flag = 1;
	        		}
	             }
	        if(flag == 1){
	        	session.setAttribute("OTP",number);
	        	session.setAttribute("email",mail);
	        	session.setAttribute("user","creg");
	        	System.out.println(number);	
	        	try{
	        		//SMTP for sending mail
	        		System.setProperty("javax.net.debug", "ssl:handshake");
	        		//Creating a result for getting status that messsage is delivered or not!
	        		String to=mail;  
	        		String subject="Your OTP";  
	        		String message="Thank you for contacting us. Here is Your OTP:"+number;  
	
	
	        		String from="beautyparlour493@gmail.com";  
	        		String pass="ovfqclzskberrqev";  
	        		String host="smtp.gmail.com";  
	
	        		Properties props = System.getProperties();
	        		System.setProperty("jdk.tls.client.cipherSuites","TLS_AES_128_GCM_SHA256,TLS_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_DHE_RSA_WITH_AES_128_GCM_SHA256,TLS_DHE_RSA_WITH_AES_256_GCM_SHA384,TLS_RSA_WITH_AES_128_GCM_SHA256,TLS_RSA_WITH_AES_256_GCM_SHA384");
	
	        		props.put("mail.smtp.starttls.enable", "true");
	
	        		props.put("mail.smtp.ssl.protocols", "TLSv1.3");
	        		props.put("mail.smtp.host", host);  
	        		props.put("mail.smtp.user", from);  
	        		props.put("mail.smtp.password", pass);  
	        		props.put("mail.smtp.port", "587");  
	        		props.put("mail.smtp.auth", "true");
	        		props.put("mail.smtp.ssl.trust", "*");
	
	
	        		Session se = Session.getDefaultInstance(props, null);  
	        		MimeMessage mimeMessage = new MimeMessage(se);  
	        		mimeMessage.setFrom(new InternetAddress(from));  
	        		mimeMessage.setRecipient(Message.RecipientType.TO,new InternetAddress(to));  
	        		mimeMessage.setSubject(subject);  
	        		mimeMessage.setText(message);  
	        		Transport transport = se.getTransport("smtp");  
	        		transport.connect(host, from, pass);  
	        		transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());  
	        		request.removeAttribute("email");
	
	        		}
	        		catch(Exception e)
	        		{
	        		System.out.println(e);
		
	        		}
	        	
	        	response.sendRedirect("otp.jsp");
	        }else{
	        	out.println("<script>alert('Email is not registered...');</script>");
	        } 
	    } 
	}catch(Exception e){
		out.println(e);
	}
}
%>



<!-- product -->
<%
 /* 
String session_name = (String)session.getAttribute("user_email");
String sessionid = (String)session.getAttribute("user_id"); */

/* 
                    if(session.getAttribute("user_id")== null)
                    {
                    	response.sendRedirect("login.jsp");	
                    }
                   
                     */
                    
                    
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
   <h3 class="form__title">Enter your Email</h3>
	
    <div class="form__div">
                    <input type="email" class="form__input" placeholder=" " name="email">
                    <label for="" class="form__label">Email</label>
                </div>

  


   <input type="submit" value="Change Password" name="submit" class="form__button">
  </form>



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

