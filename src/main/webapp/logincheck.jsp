<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.io.*,java.sql.*,javax.servlet.*" %>
<%
class logincheck extends HttpServlet 
{
	
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
				response.sendRedirect("signup.jsp");
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
%>

</body>
</html>