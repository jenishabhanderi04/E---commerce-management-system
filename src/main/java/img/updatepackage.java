package img;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class updatepackage
 */
@MultipartConfig
@WebServlet("/updatepackage")
public class updatepackage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatepackage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/*
	 * protected void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { // TODO Auto-generated
	 * method stub
	 * response.getWriter().append("Served at: ").append(request.getContextPath());
	 * }
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Part file=request.getPart("image");
		response.getWriter().append("Served at: ").append(request.getContextPath());
				
				String imageFileName=file.getSubmittedFileName();  // get selected image file name
				System.out.println("Selected Image File Name : "+imageFileName);
				
				String uploadPath="F:/jsp/beauty/src/main/webapp/images/"+imageFileName; ;  // upload path where we have to upload our actual image
				System.out.println("Upload Path : "+uploadPath);
				
				try
				{
				
				FileOutputStream fos=new FileOutputStream(uploadPath);
				InputStream is=file.getInputStream();
				
				byte[] data=new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.close();
				
				}
				
				catch(Exception e)
				{
					e.printStackTrace();
				}
				
				
			
				try 
				{
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parlour","root","");
					PreparedStatement stmt;
					String name= request.getParameter("p_name");
					String service= request.getParameter("ser");
					String price= request.getParameter("p_price");
					String id = request.getParameter("Update");
					
					String query="update package set name=?,service=?,price=?,image=?  where id = ?";
					stmt=con.prepareStatement(query);
					stmt.setString(1,name);
					stmt.setString(2,service);
					stmt.setString(3,price);
					stmt.setString(4,imageFileName);
					stmt.setString(5,id);

					int row=stmt.executeUpdate(); // it returns no of rows affected.
					response.sendRedirect("managepackage.jsp");
					
					if(row>0)
					{
						System.out.println("Image added into database successfully.");
					}
					
					else
					{
						System.out.println("Failed to upload image.");
					}
					
					
				}
				catch (Exception e)
				{
					System.out.println(e);
				}
				
	}

}
