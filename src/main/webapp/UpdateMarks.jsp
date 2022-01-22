<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<%@ page import="java.io.*,java.sql.*,javax.servlet.*" %>
<%!int check = 0; %>
<%
try
{	
	Connection c = DB.DBConnection.getConnectionOracle();
	PreparedStatement ps = c.prepareStatement("UPDATE report SET marks1=?,marks2=?,marks3=?,marks4=?,marks5=? WHERE roll=?");
	ps.setInt(6,Integer.parseInt(request.getParameter("roll")));
	ps.setInt(1,Integer.parseInt(request.getParameter("m1")));
	ps.setInt(2,Integer.parseInt(request.getParameter("m2")));
	ps.setInt(3,Integer.parseInt(request.getParameter("m3")));
	ps.setInt(4,Integer.parseInt(request.getParameter("m4")));
	ps.setInt(5,Integer.parseInt(request.getParameter("m5")));
	check=ps.executeUpdate();
	System.out.print(check);
}
catch (NumberFormatException | SQLException e) {
	e.printStackTrace();
}
if(check>=1)
{
	request.getRequestDispatcher("update.jsp").include(request,response);
	out.print("<h4>Student Marks Updated</h4>");
}
else 
{	
	request.getRequestDispatcher("update.jsp").include(request,response);
	out.print("<h4>Error Updating Record</h4>");
}

%>
</body>
</html>