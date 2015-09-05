<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import ="java.util.*" %>
<%@ page import ="java.sql.*" %>

<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Credit Card Transaction</title>
</head>
<body>
<h5 align="right">Logged in as <%=session.getAttribute("UserName")%><br>
<a href='logout.jsp'>Log out</a></h5>
<h2 align="center">Credit Card Transaction</h2>
 <form action= "TransactionSuccessful.jsp" method="post"> 
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

String card_name=request.getParameter("creditcardholder");
//System.out.println(card_name);
int card_number=Integer.valueOf(request.getParameter("cardnumber"));
//System.out.println(card_number);
String card_type=request.getParameter("cardtype");
//System.out.println(card_type);
String expiration_date=request.getParameter("expirydate");
//System.out.println(expiration_date);
String n=(String)session.getAttribute("UserID");
//Statement stat1 = con.createStatement();
PreparedStatement stat1=conn.prepareStatement("Insert into CreditCard Values(?,?,?,?,?)");
stat1.setString(1,card_name);
stat1.setInt(2,card_number);
stat1.setString(3,n);
stat1.setString(4,card_type);
stat1.setString(5,expiration_date);
stat1.executeUpdate();








%>
</body>
</html>