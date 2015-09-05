<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Comment Here</title>
</head>
<body>
<h5 align="right">Logged in as <%=session.getAttribute("UserName")%><br>
<a href='logout.jsp'>Log out</a></h5>
<h2>Add New Comment</h2> 
<fieldset>
<form name="addComments" action="Comments_Laptops.jsp" method="post">
<input type="hidden" name="pagename" value="AddComments"/>
<table  cellpadding="5" cellspacing="5" >

<%

Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/dbo_project";
String username="root";
String password="harsh123";
//String requrl="/Practice/Comm_Rest.jsp/?Rest_ID=";

Connection conn=DriverManager.getConnection(url,username,password);


String u=request.getParameter("txtModel");
System.out.println(u);
String m=request.getParameter("txtBrand");
System.out.println(m);
String n=request.getParameter("Comment_type");
System.out.println(n);
String qury="select * from comments_on_laptops where Model_no="+  u + ";";
Statement stmt1=conn.createStatement();
ResultSet rs1=stmt1.executeQuery(qury);
rs1.next();
String res=rs1.getString(4);
System.out.println(res);



%>

 <tr>
	<td>Model</td>
	<td><input type="text" name="txtModel" value=<%=u %> /></td>
</tr>
 
 <tr>
 <td>Brand</td>
 <td><input type="text" name="txtBrand" value=<%=m%> /></td>
 </tr>
 
 <tr>
 <td>Comment_Type</td>
 <td><input type="text" name="txtType" value=<%=n%> /></td>
 </tr>
 
<tr>
	<td>Review</td>
	<td><textarea name="txtReview"></textarea></td>
	
</tr>
<tr>
	<td>Rating</td>
	<td>
	<input type="radio" name="rating" value="1" class="star">
	<input type="radio" name="rating" value="2" class="star">
	<input type="radio" name="rating" value="3" class="star">
	<input type="radio" name="rating" value="4" class="star">
	<input type="radio" name="rating" value="5" class="star">
	</td>
</tr>


<tr>
	<td><button type="submit">Submit</button></td>
</tr>
</table>
</form>
</fieldset>


<a href="/Practice/laptoptest.jsp">Home</a>
</body>
</html>