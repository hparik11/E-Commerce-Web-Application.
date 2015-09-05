<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import ="java.util.*" %>
<%@ page import ="java.sql.*" %>

<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bank Transaction</title>
</head>
<body>
<h5 align="right">Logged in as <%=session.getAttribute("UserName")%><br>
<a href='logout.jsp'>Log out</a></h5>
<h2 align="center">Bank Transaction</h2>
 <form action= "BanktransactionSuccessful.jsp" method="post"> 
<input type="hidden" name="pagename" value="filterdata"/> 

<table cellpadding="5" cellspacing="5" align="center" width="80%" cellpadding="10" border="1" >
<tr>
	<td>Enter Amount <INPUT TYPE="TEXT" NAME="amount"></td>
</tr>
<tr>
	<td>Confirm Amount  <INPUT TYPE="TEXT" NAME="confirmamount"></td>
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

String bank_name=request.getParameter("bankname");
//System.out.println(bank_name);
int account_no=Integer.valueOf(request.getParameter("accountno"));
//System.out.println(account_no);
int routing_no=Integer.valueOf(request.getParameter("routingno"));
//System.out.println(routing_no);

PreparedStatement stat1=conn.prepareStatement("Insert into BankDetails (Bank_name, Account_number, routing_number) Values(?,?,?)");
stat1.setString(1,bank_name);
stat1.setInt(2,account_no);
stat1.setInt(3,routing_no);

stat1.executeUpdate();


%>
</body>
</html>