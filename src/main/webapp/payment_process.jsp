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
<form action="thankyou.jsp">
<%
String session_name = (String)session.getAttribute("user_email");
String sessionid = (String)session.getAttribute("user_id");

if(request.getParameter("amt") != null && request.getParameter("name") != null){
    String amt = request.getParameter("amt");
    String name = request.getParameter("name");
    String payment_status = "complete";
    String added_on = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
    String userid = "someuserid"; // replace with the actual user ID
   // Connection con = null;
    PreparedStatement stmt = null;
    Class.forName("com.mysql.jdbc.Driver");
    Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");

    try {
       
        String query = "INSERT INTO payment(name, amount, payment_status, added_on, userid) VALUES (?, ?, ?, ?, ?)";
        stmt = con1.prepareStatement(query);
        stmt.setString(1, name);
        stmt.setString(2, amt);
        stmt.setString(3, payment_status);
        stmt.setString(4, added_on);
        stmt.setString(5, sessionid);
        stmt.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (con1 != null) {
            try {
                con1.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
%>

</form>
</body>
</html>