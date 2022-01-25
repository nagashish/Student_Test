
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<center>
	<h1><b>SIGN UP..</b></h1>
	<form action="sign_up">
		<table>
			<tr>
				<td>Name:</td>
				<td><input type="text" placeholder="Name" name="name" required="required"></td>
			</tr>			
			<tr>	
				<td>Password:</td>
				<td><input type="password" placeholder="Password" name="password" required="required"></td>
			</tr>
			<tr>
				<td>Father's Name:</td>
				<td><input type="text" placeholder="Father's Name" name="fname"></td>
			</tr>
			<tr>	
				<td>Gender:</td>
				<td><input type="radio"  name="gender" value="Male">MALE
					<input type="radio"  name="gender" value="Female">FEMALE
				</td>
			</tr>
			<tr>	
				<td>Email:</td>
				<td><input type="email" placeholder="xyz@abc.com" name="mail" required="required"></td>
			</tr>
			<tr>	
				<td>Contact No.:</td>
				<td>
					<select name="std">
						<option value ="90">+90</option>
						<option value ="91">+91</option>
						<option value ="92">+92</option>
						<option value ="93">+93</option>
						<option value ="94">+94</option>
					</select>
					<input type="tel" placeholder="98480*****" name="phone">
				</td>
			</tr>			
		</table><br>
		<input type="submit" value="Submit">
	</form>
</center>
</body>
</html>