<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<fieldset>
<h2>Login Page</h2>
<form name="login" method="post" action="login.jsp">
<input type="hidden" name="pagename" value="login"/>
<table cellpadding="5" cellspacing="5">
	<tr>
		<td>User Name</td>
		<td><input type="text" name="txtUserName" required autofocus placeholder="Your Username" title="Please enter in more than three letters"/></td>
	</tr>
	<tr>
		<td>Password</td>
		<td><input type="password" name="txtPassword" required autofocus placeholder="Your Password" title="Please enter in more than five letters"/></td>
	</tr>
	<tr>
		<td><button type="submit">Login</button></td>
		 <td><a href="http://localhost:9000/Practice/register.jsp">Sign Up</a></td> 
	</tr>
</table>
</form>
</fieldset>
</body>
</html>