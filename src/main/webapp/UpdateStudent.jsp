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
 int roll=Integer.parseInt(request.getParameter("roll"));
 HttpSession s = request.getSession(false);
 String name=(String)s.getAttribute("name");
 name = name.toUpperCase();
 String sname=null,fname=null,email=null,gender=null,phone=null,password=null;
 if(!name.equals("")||name!=null)
 {
	request.getRequestDispatcher("header2.jsp").include(request,response);
	out.print("<h1 align='center'>Welcome "+name+"</h1><br>");
	out.print("<a href='add.jsp'>Add marks</a> &ensp;| &ensp; <a href='update.jsp'>Update Marks</a> &ensp;| &ensp; <a href='delete.jsp'>Delete Marks</a> &ensp;| &ensp; <a href='ViewReport.jsp'>View Report</a><br><hr><br>");
 }
 Connection c = DB.DBConnection.getConnectionOracle();
	PreparedStatement ps = c.prepareStatement("SELECT * from STUDENT where roll=?");
	ps.setInt(1, roll);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		sname=rs.getString(2);
		fname=rs.getString(3);
		gender=rs.getString(4);
		phone=rs.getString(5);
		email=rs.getString(6);
		password=rs.getString(7);
	}
	//System.out.print(request.getParameter("roll"));
%>
<center><h1><b>Update Student Record</b></h1>
	<form action="UpdateStudentDetails.jsp" method="post">
		<table>
			<tr>	
				<td>Name</td>
				<td><input type="text" name="sname" value="<%= sname %>"></td>
			</tr>
			<tr>	
				<td>Father's Name</td>
				<td><input type="text" name="fname" value="<%= fname %>"></td>
			</tr>
			<tr>	
				<td>Gender</td>
				<td><input type="text" name="gender" value="<%= gender %>"></td>
			</tr>
			<tr>	
				<td>Phone</td>
				<td><input type="text" name="phone" value="<%= phone %>"></td>
			</tr>
			<tr>	
				<td>Email</td>
				<td><input type="text" name="email" value="<%= email %>"></td>
			</tr>
			<tr>	
				<td>Password</td>
				<td><input type="text" name="password" value="<%= password %>"></td>
				<td><input type="hidden" name="roll" value="<%= roll %>"></td>
			</tr>
			<tr>	
				<td><input type="submit" value="Submit"></td>
			</tr>
		</table>
	</form></center>
	<%
} catch (NullPointerException e) {
		e.printStackTrace();		 
}
%>
</body>
</html>