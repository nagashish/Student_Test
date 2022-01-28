<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<%@ page import="java.io.*,java.sql.*,javax.servlet.*" %>
<%@ page session = "false" %>
<%!int check = 0; %>
<%
	try 
	{
		Connection c = DB.DBConnection.getConnectionOracle();
		PreparedStatement ps = c.prepareStatement("insert into report values(?,?,?,?,?,?)");
		ps.setInt(1,Integer.parseInt(request.getParameter("roll")));
		ps.setInt(2,Integer.parseInt(request.getParameter("m1")));
		ps.setInt(3,Integer.parseInt(request.getParameter("m2")));
		ps.setInt(4,Integer.parseInt(request.getParameter("m3")));
		ps.setInt(5,Integer.parseInt(request.getParameter("m4")));
		ps.setInt(6,Integer.parseInt(request.getParameter("m5")));
		check=ps.executeUpdate();
	}catch (NumberFormatException | SQLException e) {
		e.printStackTrace();
	}

	if(check>=1)
	{
		request.getRequestDispatcher("add.jsp").include(request,response);
		out.print("<h4>Student Marks Added</h4>");
	}
	else 
	{	
		request.getRequestDispatcher("add.jsp").include(request,response);
		out.print("<h4>Error Adding Marks</h4>");
	}
%>
</body>
</html>