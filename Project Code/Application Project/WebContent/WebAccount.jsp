<%@ page import ="java.util.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Web Account Details</title>
</head>
<body>
<h5 align="right">Logged in as <%=session.getAttribute("UserName")%><br>
<a href='logout.jsp'>Log out</a></h5>
<h2 align="center">Web Account Details</h2>
<%

//String w=(String)session.getAttribute("WebAccount");
%>

<table cellpadding="5" cellspacing="5"  cellpadding="10" border="1" >

<tr>
	<td>Web Account Balance  <INPUT TYPE="TEXT" NAME="webaccount" value=<%=session.getAttribute("WebAccount") %>></td>
</tr>
</table>
<br>
 <form action="BankDetails.jsp"> 
	<input type="submit" name="Submit" value="Net Banking">
	</form>
<br>
<form action="CreditCard.jsp"> 
	<input type="submit" name="Submit" value="Credit Card">
	</form>



</body>
</html>