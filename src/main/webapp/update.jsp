<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.InputStream"%>
<%@page import="java.io.FileOutputStream"%>
    <%@ page import="java.sql.*"%>
<% 

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");
Part file=request.getPart("image");

String imageFileName=file.getSubmittedFileName();  // get selected image file name
System.out.println("Selected Image File Name : "+imageFileName);

String uploadPath="F:/jsp/beauty/src/main/webapp/images/"+imageFileName; ;  // upload path where we have to upload our actual image
System.out.println("Upload Path : "+uploadPath);

	try
	{
	
	FileOutputStream fos=new FileOutputStream(uploadPath);
	InputStream	 is=file.getInputStream();
	
	byte[] data=new byte[is.available()];
	is.read(data);
	fos.write(data);
	fos.close();
	
	}
	
	catch(Exception e)
	{
		e.printStackTrace();
	}

//Statement st =con.createStatement();
String name = request.getParameter("name");
String price = request.getParameter("price");
String id = request.getParameter("update");

PreparedStatement ps = con.prepareStatement("update pro set name=?,price=?,image=?  where id = ?;");
ps.setString(1,name);
ps.setString(2,price);
ps.setString(3,imageFileName);
ps.setString(4,id);

int x = ps.executeUpdate();

response.sendRedirect("manageproduct.jsp");
%>