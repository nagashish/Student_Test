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
	PreparedStatement ps = c.prepareStatement("UPDATE student SET name=?,father_name=?,gender=?,phone=?,email=?,password=? WHERE roll=?");
	ps.setString(1,request.getParameter("sname"));
	ps.setString(2,request.getParameter("fname"));
	ps.setString(3,request.getParameter("gender"));
	ps.setString(4,request.getParameter("phone"));
	ps.setString(5,request.getParameter("email"));
	ps.setString(6,request.getParameter("password"));
	ps.setInt(7,Integer.parseInt(request.getParameter("roll")));
	check=ps.executeUpdate();
}
catch (NumberFormatException | SQLException e) {
	e.printStackTrace();
}
if(check>=1)
{
	request.getRequestDispatcher("AdminHome.jsp").include(request,response);
	out.print("<h4>Student Record Updated</h4>");
}
else 
{	
	request.getRequestDispatcher("UpdateStudent.jsp").include(request,response);
	out.print("<h4>Error Updating Record</h4>");
}

%>
</body>
</html>