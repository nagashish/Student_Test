<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Record</title>
</head>
<body>
<jsp:include page="header2.jsp"></jsp:include>
<h1><b>Delete Student Marks</b></h1>
	<form action="DeleteMarks.jsp" method="post">
		<table>
			<tr>
				<td>Roll Number:</td>
				<td><input type="number" placeholder="Roll No." name="roll"></td>
			</tr>
			<tr>	
				<td><input type="submit" value="Submit"></td>
			</tr>
		</table>
	</form>
</body>
</html>