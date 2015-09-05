<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">.
<title>Bank Details</title>
</head>
<body>
<h5 align="right">Logged in as <%=session.getAttribute("UserName")%><br>
<a href='logout.jsp'>Log out</a></h5>
<h2 align="center">Bank Details</h2>
 <form action="BankTransaction.jsp" method="post"> 
<input type="hidden" name="pagename" value="filterdata"/> 

<table cellpadding="5" cellspacing="5"  cellpadding="10" border="1" >
<tr>
	<td>Bank Name  <INPUT TYPE="TEXT" NAME="bankname"></td>
</tr>
<tr>
	<td>Account Number  <INPUT TYPE="TEXT" NAME="accountno"></td>
	
</tr>
<tr>
	<td>Routing Number  <INPUT TYPE="TEXT" NAME="routingno"></td>
</tr>
<tr>
	<td><input type="submit" name="Submit" value="SUBMIT"></td>
</tr>
<% 
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/dbo_project";
String username="root";
String password="harsh123";
//String requrl="/Practice/Comm_Rest.jsp/?Rest_ID=";

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