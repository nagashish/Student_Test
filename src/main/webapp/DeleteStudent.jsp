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
<%! int check=0; %>
<%
try
{	
	Connection c = DB.DBConnection.getConnectionOracle();
	PreparedStatement ps = c.prepareStatement("DELETE FROM student WHERE roll=?");
	ps.setInt(1,Integer.parseInt(request.getParameter("roll")));
	check=ps.executeUpdate();
}
catch (NumberFormatException | SQLException e) {
	e.printStackTrace();
}
if(check>=1)
{
	request.getRequestDispatcher("AdminHome.jsp").include(request,response);
	out.print("<h4>Student Record Deleted</h4>");
}
else 
{	
	request.getRequestDispatcher("AdminHome.jsp").include(request,response);
	out.print("<h4>Error Deleting Record</h4>");
}

%>
</body>
</html>