<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.mail.internet.*,javax.mail.*,java.util.*,javax.activation.*,java.io.*" %>
     <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");
String email1 = "20bmiit096@gmail.com";
//String id = request.getParameter("update");

try{
	
	
	String id = request.getParameter("delete");
	 Statement s = (Statement)con.createStatement();
	ResultSet rs = s.executeQuery("select * from bookappointment where id ="+id+"; ");
	while(rs.next())
	{
		
	  //  id = rs.getString("id");
	    email1 = rs.getString("email");

	}
	
	if(request.getParameter("delete")!= null)
	{
		
//SMTP for sending mail
System.setProperty("javax.net.debug", "ssl:handshake");
//Creating a result for getting status that messsage is delivered or not!
//String to=email12;//admin email id  
String to=email1;	
String subject="Appointment Satus.";  
String message=" your appintment is reject .";  


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
Statement stmt = con.createStatement();

stmt = con.createStatement();
String sql = "UPDATE bookappointment SET status = 'reject' WHERE id = " + id;
int rows = stmt.executeUpdate(sql);

response.sendRedirect("viewappoin.jsp");
}
}
catch(Exception e)
{
System.out.println(e);
}


%>
</body>
</html>