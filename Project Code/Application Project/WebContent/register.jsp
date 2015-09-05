<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
</head>
<body>
<h2 align="center">Sign Up Page</h2> 
<form name="registeration" action="RegServlet" method="post">
<input type="hidden" name="pagename" value="register"/>
<table  cellspacing="5" border="1" width="30%" cellpadding="5" align="center" >


<tr>
	<td>User Name</td>
	<td><input type="text" name="txtUName" required autofocus placeholder="Your Username" title="Please enter in more than three letters"/></td>
</tr>

<tr>
	<td>Email</td>
	<td><input type="text" name="txtEmail" required autofocus placeholder="abc@xyz.com" title="Please enter Valid Email Adddress" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"></td>
</tr>
<tr>
	<td>Password</td>
	<td><input type="password" name="txtPassword" required autofocus placeholder="Your Password" title="Please enter in more than five letters"/></td>
</tr>

<tr>
	<td>Address</td>
	<td><input type="text" name="txtAddress" required autofocus placeholder="Your Address" title="Please enter your City & State"/></td>
	
</tr>


<tr>
	<td><button type="submit">Submit</button></td>
	<td><input type="reset" value="Reset" /></td>
</tr>
<tr>
    <td colspan="2">Already registered!! <a href="index.jsp">Login Here</a></td>
</tr>




</table>
</form>
</body>
</html>