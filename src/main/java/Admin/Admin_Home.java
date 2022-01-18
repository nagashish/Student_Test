package Admin;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DBConnection;

/**
 * Servlet implementation class Admin_Home
 */
@WebServlet("/Admin_Home")
public class Admin_Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_Home() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.print("<title>Admin Home</title>");
		
		Cookie ck[]=request.getCookies();
		if(ck!=null)
		{
		 String name=ck[0].getValue();
		 name = name.toUpperCase();
		 if(!name.equals("")||name!=null)
		 {
			request.getRequestDispatcher("header2.html").include(request,response);
			out.print("<h1 align='center'>Welcome "+name+"</h1><br>");
			out.print("<a href='add.html'>Add marks</a> &ensp;| &ensp; <a href='update.html'>Update Marks</a> &ensp;| &ensp; <a href='delete.html'>Delete Marks</a> &ensp;| &ensp; <a href='r1'>View Report</a><br><hr><br>");
			Connection c = DBConnection.getConnectionOracle();
			try {
				PreparedStatement ps = c.prepareStatement("select * from student");
				ResultSet rs = ps.executeQuery("select * from student");
				ResultSetMetaData rsmd=rs.getMetaData();
				int count=rsmd.getColumnCount(); 
				//System.out.println("no. of column in my table: "+count);
				out.print("<table border = '5' align='center' cellpadding='5' cellspacing='5'>");
				for(int i=1;i<=count+2;i++)
				{
					if(i==count+1)
						out.print("<th>UPDATE</th>");
					else if(i==count+2)
						out.print("<th>DELETE</th>");
					else
						out.print("<th>"+rsmd.getColumnName(i)+"</th>");
				}
				while(rs.next())
				{	
					int roll = rs.getInt(1);
					out.print("<tr><td>"+roll+"</td>");
					out.print("<td>"+rs.getString(2)+"</td>");
					out.print("<td>"+rs.getString(3)+"</td>");
					out.print("<td>"+rs.getString(4)+"</td>");
					out.print("<td>"+rs.getString(5)+"</td>");
					out.print("<td>"+rs.getString(6)+"</td>");
					out.print("<td>"+rs.getString(7)+"</td>");
					out.print("<td><a href=UpdateStudent.html?roll="+roll+">Update</a></td>");
					out.print("<td><a href=delete.html?roll="+roll+">Delete</a></td></tr>");
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 }
		}
		else
		{
			request.getRequestDispatcher("login.html").include(request, response);
			out.print("Please login first");
			
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
