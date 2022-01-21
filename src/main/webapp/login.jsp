<html>
<head>
<title>Login</title>
<script >
function call()
{
	if(document.f.name.value==""){
		alert("Please Enter Customer Name");
		return false;
	}
	if(document.f.pass.value==""){
		alert("Please Enter Ur Password");
		return false;
	}
}
</script>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>   
<center><BR><BR>
<font size="+2" color="#262626"><h2><b>Login Page</b></h2></font>
<br>
<form  method=post action="logincheck.jsp" name="f" onSubmit=" return call()">
 <table>
 <tr>
 <td><b>E Mail</td><td><input type="text" name="email" ></td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr> 
<td><b> Password:</b></td><td><input type="password" name="password"></td>
</tr>
</table>
<br> <BR>
 <input type="submit" value="submit"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="reset" value="reset">
 <br><br>
 <a href="signup.jsp">Sign Up</a>
 </form>
</html>