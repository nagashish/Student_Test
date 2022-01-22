<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Record</title>
</head>
<body>
<jsp:include page="header2.jsp"></jsp:include>
<h1><b>Update Student Record</b></h1>
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
</body>
</html>