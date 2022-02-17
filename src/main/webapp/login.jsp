<html>
<head>
<link rel="stylesheet" type="text/css" href="main.css"> 
<title>Login</title>
<style type="text/css">
   	.loginform {
            padding: 10px;
            width: 300px;             
           	margin: auto;
        }

        .formheading {
            background-color: red;
            color: white;
            padding: 4px;
            text-align: center;
        }

        .sub {
            background-color:orange;
            padding: 10px 40px 10px 40px;
            color: white;
            font-weight: bold;
            border-radius: 10px;
        }
   </style>
<script >
function call()
{
	if(document.f.email.value==""){
		alert("Please Enter Email");
		return false;
	}
	if(document.f.password.value==""){
		alert("Please Enter Ur Password");
		return false;
	}
}
</script>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>   
	<div class="loginform">
		<form  method=post action="logincheck.jsp" name="f" onSubmit="return call()">
  			<table align="center" cellspacing = 20px>
                <tr>
                    <td style="font-family: Berlin Sans FB Demi; font-weight: bold;">Email:</td>
                    <td><input type="email" name="email" /></td>
                </tr>
                <tr>
                    <td style="font-family: Berlin Sans FB Demi; font-weight: bold;">Password:</td>
                    <td><input type="password" name="password" /></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center"><input class="sub" type="submit" value="Login" /></td>
                </tr>
                <tr>
                	<td colspan="2" style="text-align:center"><a href="signup.jsp">Sign Up</a></td>
                </tr>
            </table>
        </form>
    </div>
 </form>
 </body>
</html>