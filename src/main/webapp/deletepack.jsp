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



<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");


try{
	if(request.getParameter("delete")!= null)
	{
		String id = request.getParameter("delete");
		 PreparedStatement ps = con.prepareStatement("delete from package where id = ?;");
			
		    ps.setString(1,id);
		 
		    int x = ps.executeUpdate();
	  
		    response.sendRedirect("managepackage.jsp");
	}
}
catch(Exception e)
{
	out.println(e);
}

%>

</body>
</html>