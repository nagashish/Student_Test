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
		Connection c = DB.DBConnection.getConnectionOracle(); 
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
				HttpSession se=request.getSession();
				se.setAttribute("name",name);
				request.getRequestDispatcher("AdminHome.jsp").forward(request, response);
			}
			else if(rs1.next())
			{
				String name = rs.getString(2);
				HttpSession se=request.getSession();
				se.setAttribute("name",name);
				request.getRequestDispatcher("StudentHome.jsp").forward(request, response);
			}
			request.getRequestDispatcher("login.jsp").include(request, response);
			out.print("Invalid Email or Password");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
%>
</body>
</html>