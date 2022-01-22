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
<%!int check = 0; %>
<%
try
{	
	Connection c = DB.DBConnection.getConnectionOracle();
	PreparedStatement ps = c.prepareStatement("DELETE FROM report WHERE roll=?");
	ps.setInt(1,Integer.parseInt(request.getParameter("roll")));
	check=ps.executeUpdate();
}
catch (NumberFormatException | SQLException e) {
	e.printStackTrace();
}
if(check>=1)
{
	request.getRequestDispatcher("delete.jsp").include(request,response);
	out.print("<h4>Student Marks Deleted</h4>");
}
else 
{	
	request.getRequestDispatcher("delete.jsp").include(request,response);
	out.print("<h4>Error Deleting Record</h4>");
}

%>
</body>
</html>