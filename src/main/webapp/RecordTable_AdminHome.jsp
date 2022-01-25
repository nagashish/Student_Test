<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<%@ page import="java.sql.*" %>
<%
try{
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
} catch(SQLException e){
	e.printStackTrace();
	request.getRequestDispatcher("login.jsp").include(request,response);
	out.print("<center>Please Login First</center>");
}
%>
</body>
</html>