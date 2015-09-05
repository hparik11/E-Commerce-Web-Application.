<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AddRest</title>

</head>
<body>
<fieldset>
<form name="modify" action="RegServlet" method="post">
<input type="hidden" name="pagename" value="AddRest"/>
<table  cellpadding="5" cellspacing="5" >

<h2>Add New Restaurant</h2> 

<tr>
	<td>Restaurant-Name</td>
	<td><input type="text" name="txtRName" required autofocus placeholder="Restaurant Name" title="Please enter in more than three letters"/></td>
</tr>

<tr>
	<td>Address</td>
	<td><input type="text" name="txtAddress" required autofocus placeholder="Restaurant Address" title="Please enter Restaurant address"/></td>
	
</tr>

<tr>
	<td>City</td>
	<td><input type="text" name="txtCity" required autofocus placeholder="Restaurant City" title="Please enter Restaurant address"/></td>
	
</tr>

<tr>
	<td>Pin</td>
	<td><input type="text" name="txtPin" required autofocus placeholder="Pin Code" title="Please enter Pin Code"/></td>
	
</tr>

<tr>
	<td><button type="submit">Submit</button></td>
</tr>
</table>
</form>
</fieldset>
</body>
</html>