<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>
<link rel="stylesheet" type="text/css" href="main.css">
</head>
<body>
<%@ page import="java.io.*,java.sql.*,javax.servlet.*" %>
<%@ page session = "false" %>
<%
try{
 HttpSession s = request.getSession(false);
 String name=(String)s.getAttribute("name");
 name = name.toUpperCase();
 if(!name.equals("")||name!=null)
 {
	request.getRequestDispatcher("header2.jsp").include(request,response);
	out.print("<h1 align='center'>Welcome "+name+"</h1><br>");
	out.print("<a href='add.jsp'>Add marks</a> &ensp;| &ensp; <a href='update.jsp'>Update Marks</a> &ensp;| &ensp; <a href='delete.jsp'>Delete Marks</a> &ensp;| &ensp; <a href='ViewReport.jsp'>View Report</a><br><hr><br>");
	request.getRequestDispatcher("RecordTable_AdminHome.jsp").include(request,response);
 	}
} catch (NullPointerException e) {
		e.printStackTrace();
		request.getRequestDispatcher("login.jsp").include(request,response);
		out.print("<center>Please Login First</center>");
		 
}
%>
</body>
</html>