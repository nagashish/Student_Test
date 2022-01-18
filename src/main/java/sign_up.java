

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DBConnection;

/**
 * Servlet implementation class sign_up
 */
@WebServlet("/sign_up")
public class sign_up extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sign_up() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection c = DBConnection.getConnectionOracle();
		PrintWriter out = response.getWriter();
		try 
		{
			PreparedStatement ps = c.prepareStatement("insert into student values(roll_no.nextval,?,?,?,?,?,?)");
			ps.setString(1,request.getParameter("name"));
			ps.setString(2,request.getParameter("fname"));
			ps.setString(3,request.getParameter("gender"));
			String s = request.getParameter("std");
			s= "+"+s+"-"+request.getParameter("phone");
			if(!request.getParameter("phone").equals(""))
				ps.setString(4,s);
			else
				ps.setString(4,null);
			ps.setString(5,request.getParameter("mail"));		
			ps.setString(6, request.getParameter("password"));
			int check=ps.executeUpdate();
			
			if(check>=1) {
				RequestDispatcher rd= request.getRequestDispatcher("login.html");
				rd.include(request, response);
				out.print("SignUp Successful, Please Login..");
			}
			else {
				RequestDispatcher rd= request.getRequestDispatcher("signup.html");
				rd.include(request, response);
				out.print("SignUp unsuccessful, Please try again");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
