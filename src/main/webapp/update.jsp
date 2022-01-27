<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<%@ page import="java.io.*,java.sql.*,javax.servlet.*" %>
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
%>
<center><h1><b>Update Student Record</b></h1>
	<form action="UpdateMarks.jsp" method="post">
		<table>
			<tr>	
				<td>Roll No.</td>
				<td><input type="number" name="roll"></td>
			</tr>
			<tr>	
				<td>Marks 1</td>
				<td><input type="number" name="m1"></td>
			</tr>
			<tr>	
				<td>Marks 2</td>
				<td><input type="number" name="m2"></td>
			</tr>
			<tr>	
				<td>Marks 3</td>
				<td><input type="number" name="m3"></td>
			</tr>
			<tr>	
				<td>Marks 4</td>
				<td><input type="number" name="m4"></td>
			</tr>
			<tr>	
				<td>Marks 5</td>
				<td><input type="number" name="m5"></td>
			</tr>
			<tr>	
				<td><input type="submit" value="Submit"></td>
			</tr>
		</table>
	</form>
	</center>
<br>
<%
 }
} catch (NullPointerException e) {
		e.printStackTrace();		 
}
%>
</body>
</html>