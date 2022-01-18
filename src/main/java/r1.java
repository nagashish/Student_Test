

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class r1
 */
@WebServlet("/r1")
public class r1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public r1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.print("<title> Report </title>");
		RequestDispatcher rd = request.getRequestDispatcher("header.html");
		rd.include(request, response);
		out.print("<br><br>Enter Roll No. ");
		out.print("<input type='text' placeholder='Roll no.' name='roll'>");
		rd = request.getRequestDispatcher("report.html");
		rd.include(request, response);		
		
		
		
//		try 
//		{
//			Connection c = DBConnection.getConnectionOracle();
//			int rolln = Integer.parseInt(request.getParameter("SRoll"));
//			PreparedStatement ps = c.prepareStatement("Select * from student where roll =?");
//			ps.setInt(1,rolln);
//			ResultSet rs = ps.executeQuery();
//			int roll = 0,m1 = 0,m2 = 0,m3 = 0,m4 = 0,m5 = 0;
//			String name = null,fname = null;
//			while(rs.next())
//			{
//				roll = rs.getInt(1);
//				name = rs.getString(2);
//				fname = rs.getString(3);
//				m1 = rs.getInt(4);
//				m2 = rs.getInt(5);
//				m3 = rs.getInt(6);
//				m4 = rs.getInt(7);
//				m5 = rs.getInt(8);
//			}
//			out.print("<!DOCTYPE html>\r\n"
//					+ "<html>\r\n"
//					+ "<head>\r\n"
//					+ "<meta charset=\"ISO-8859-1\">\r\n"
//					+ "<title>Report Card</title>\r\n"
//					+ "</head>\r\n"
//					+ "<body>\r\n"
//					+ "<h1><b>Report Card</b></h1><br><br>\r\n"
//					+ "<table border=\"10\">\r\n"
//					+ "	<tr>\r\n"
//					+ "		<td>Roll No.</td>\r\n"
//					+ "		<td>"+roll+"</td>\r\n"
//					+ "	</tr>\r\n"
//					+ "	<tr>\r\n"
//					+ "		<td>Student Name</td>\r\n"
//					+ "		<td>"+name+"</td>\r\n"
//					+ "	</tr>\r\n"
//					+ "	<tr>\r\n"
//					+ "		<td>Father Name</td>\r\n"
//					+ "		<td>"+fname+"</td>\r\n"
//					+ "	</tr>\r\n"
//					+ "	<tr>\r\n"
//					+ "		<td>Marks1</td>\r\n"
//					+ "		<td>"+m1+"</td>\r\n"
//					+ "	</tr>\r\n"
//					+ "	<tr>\r\n"
//					+ "		<td>Marks2</td>\r\n"
//					+ "		<td>"+m2+"</td>\r\n"
//					+ "	</tr>\r\n"
//					+ "	<tr>\r\n"
//					+ "		<td>Marks3</td>\r\n"
//					+ "		<td>"+m3+"</td>\r\n"
//					+ "	</tr>\r\n"
//					+ "	<tr>\r\n"
//					+ "		<td>Marks4</td>\r\n"
//					+ "		<td>"+m4+"</td>\r\n"
//					+ "	</tr>\r\n"
//					+ "	<tr>\r\n"
//					+ "		<td>Marks5</td>\r\n"
//					+ "		<td>"+m5+"</td>\r\n"
//					+ "	</tr>\r\n"
//					+ "		\r\n"
//					+ "</table>\r\n"
//					+ "</body>\r\n"
//					+ "</html>");
//		}
//		catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
