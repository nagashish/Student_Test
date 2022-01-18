package Admin;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DBConnection;

/**
 * Servlet implementation class add
 */
@WebServlet("/add")
public class add extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public add() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Connection c = DBConnection.getConnectionOracle();
			PrintWriter out = response.getWriter();
			int check = 0;
			try 
			{
				PreparedStatement ps = c.prepareStatement("insert into report values(?,?,?,?,?,?)");
				ps.setInt(1,Integer.parseInt(request.getParameter("roll")));
				ps.setInt(2,Integer.parseInt(request.getParameter("m1")));
				ps.setInt(3,Integer.parseInt(request.getParameter("m2")));
				ps.setInt(4,Integer.parseInt(request.getParameter("m3")));
				ps.setInt(5,Integer.parseInt(request.getParameter("m4")));
				ps.setInt(6,Integer.parseInt(request.getParameter("m5")));
				check=ps.executeUpdate();
			}
			catch (NumberFormatException | SQLException e) {
				e.printStackTrace();
			}
			if(check>=1)
			{
				RequestDispatcher rd=request.getRequestDispatcher("Admin_Home");
				rd.include(request,response);
				out.print("<br><br>Student Marks Added");
			}
			else 
			{	
				RequestDispatcher rd=request.getRequestDispatcher("add.html");
				rd.include(request,response);
				out.print("<h4>Error Adding Marks</h4>");
			}
	}

}
