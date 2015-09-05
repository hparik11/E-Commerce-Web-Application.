<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import ="java.util.*" %>
<%@ page import ="java.sql.*" %>

<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Credit Card Details</title>
</head>
<body>
<h2 align="center">Credit Card Details</h2>
 <form action="CreditCardTransaction.jsp" method="post"> 
<input type="hidden" name="pagename" value="filterdata"/> 

<table cellpadding="5" cellspacing="5" align="center" cellpadding="10" border="1" >
<tr>
	<td>Credit Card Holder Name  <INPUT TYPE="TEXT" NAME="creditcardholder"></td>
</tr>
<tr>
	<td>Credit Card Number  <INPUT TYPE="TEXT" NAME="cardnumber"></td>
	
</tr>
<tr>
	<td>Credit Card Type  <INPUT TYPE="TEXT" NAME="cardtype"></td>
</tr>
<tr>
	<td>Expiration Date  <INPUT TYPE="TEXT" NAME="expirydate"></td>
</tr>
<tr>
	<td><input type="submit" name="Submit" value="SUBMIT"></td>
</tr>
<% 
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/dbo_project";
String username="root";
String password="harsh123";
Connection conn=DriverManager.getConnection(url,username,password);

/*String card_name=request.getParameter("creditcardholder");
System.out.println(card_name);
String card_number=request.getParameter("cardnumber");
System.out.println(card_number);
String card_type=request.getParameter("cardtype");
System.out.println(card_type);
String expiration_date=request.getParameter("expirydate");
System.out.println(expiration_date); */


%>
</body>
</html>