<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>
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
	out.print("<a href='add.jsp'>Add marks</a> &ensp;| &ensp; <a href='update.jsp'>Update Marks</a> &ensp;| &ensp; <a href='delete.jsp'>Delete Marks</a> &ensp;| &ensp; <a href='r1'>View Report</a><br><hr><br>");
	Connection c = DB.DBConnection.getConnectionOracle();
	
		PreparedStatement ps = c.prepareStatement("select * from student");
		ResultSet rs = ps.executeQuery("select * from student");
		ResultSetMetaData rsmd=rs.getMetaData();
		int count=rsmd.getColumnCount(); 
		//System.out.println("no. of column in my table: "+count);
		out.print("<table border = '5' align='center' cellpadding='5' cellspacing='5'>");
		for(int i=1;i<=count+2;i++)
		{
			if(i==count+1)
				out.print("<th>UPDATE</th>");
			else if(i==count+2)
				out.print("<th>DELETE</th>");
			else
				out.print("<th>"+rsmd.getColumnName(i)+"</th>");
		}
		while(rs.next())
		{	
			int roll = rs.getInt(1);
			out.print("<tr><td>"+roll+"</td>");
			out.print("<td>"+rs.getString(2)+"</td>");
			out.print("<td>"+rs.getString(3)+"</td>");
			out.print("<td>"+rs.getString(4)+"</td>");
			out.print("<td>"+rs.getString(5)+"</td>");
			out.print("<td>"+rs.getString(6)+"</td>");
			out.print("<td>"+rs.getString(7)+"</td>");
			out.print("<td><a href=UpdateStudent.html?roll="+roll+">Update</a></td>");
			out.print("<td><a href=delete.html?roll="+roll+">Delete</a></td></tr>");
			
		}
 	}
} catch (SQLException | NullPointerException e) {
		e.printStackTrace();
		request.getRequestDispatcher("login.jsp").include(request,response);
		out.print("<center>Please Login First</center>");
		 
}
%>
</body>
</html>