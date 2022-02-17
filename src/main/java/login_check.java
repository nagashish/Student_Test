import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class test
 */
@WebServlet("/login_check")
public class login_check extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection c = DB.DBConnection.getConnectionOracle(); 
		RequestDispatcher rd = null;
		String mail = request.getParameter("email"); 
		String pass = request.getParameter("password"); 
		try {
			PreparedStatement ps = c.prepareStatement("SELECT * FROM admin WHERE email=? and password=?");
			PreparedStatement ps1 = c.prepareStatement("SELECT * FROM Student WHERE email=? and password=?");
			ps.setString(1, mail);
			ps.setString(2, pass);
			ps1.setString(1, mail);
			ps1.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			ResultSet rs1 = ps1.executeQuery();
			if(rs.next())
			{	
				String name = rs.getString(1);
				Cookie ck=new Cookie("name",name);
				response.addCookie(ck);
				rd = request.getRequestDispatcher("Admin_Home");
				rd.forward(request, response);
			}
			else if(rs1.next())
			{
				rd = request.getRequestDispatcher("Student_Home");
				rd.forward(request, response);
			}
			PrintWriter out = response.getWriter();
			rd = request.getRequestDispatcher("login.html");
			rd.include(request, response);
			out.print("Invalid Email or Password");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
