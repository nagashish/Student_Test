<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DB.DBConnection"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<%
int m1 = 0,m2 = 0,m3 = 0,m4 = 0,m5 = 0, roll=0;
String name = null,fname = null;
try{
	roll =Integer.parseInt(request.getParameter("roll"));
	Connection c = DBConnection.getConnectionOracle();
	PreparedStatement ps = c.prepareStatement("SELECT name,father_name,marks1,marks2,marks3,marks4,marks5 FROM student INNER JOIN report ON report.roll=student.roll where report.roll =?");
	ps.setInt(1, roll);
	ResultSet rs = ps.executeQuery();
	if(rs.next()){
		while(rs.next())
		{	
			name = rs.getString(1);
			fname = rs.getString(2);
			m1 = rs.getInt(3);
			m2 = rs.getInt(4);
			m3 = rs.getInt(5);
			m4 = rs.getInt(6);
			m5 = rs.getInt(7);
		}
	}
	else{
		response.sendRedirect("error.jsp?msg=Please Enter Valid Roll no.");
	}
} catch(Exception e){
	e.printStackTrace();
	
}
%>
<jsp:include page="ViewReport.jsp"/>
<center>
<h1><b>Report Card</b></h1><br><br>
<table border="10">
	<tr>
		<td>Roll No.</td>
		<td><%=roll %></td>
	</tr>
	<tr>
		<td>Student Name</td>
		<td><%=name %></td>
	</tr>
	<tr>
		<td>Father Name</td>
		<td><%=fname %></td>
	</tr>
	<tr>
		<td>Marks1</td>
		<td><%=m1 %></td>
	</tr>
	<tr>
		<td>Marks2</td>
		<td><%=m2 %></td>
	</tr>
	<tr>
		<td>Marks3</td>
		<td><%=m3 %></td>
	</tr>
	<tr>
		<td>Marks4</td>
		<td><%=m4 %></td>
	</tr>
	<tr>
		<td>Marks5</td>
		<td><%=m5 %></td>
	</tr>		
</table>
</center>


</body>
</html>