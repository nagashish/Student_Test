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
<%
try{
 HttpSession s = request.getSession(false);
 s.invalidate();
 request.getRequestDispatcher("login.jsp").include(request, response);
%> 
 <center><b>Logout Successfull</b></center>
 <%} catch (NullPointerException e) {
 		e.printStackTrace();		 
 }
%>