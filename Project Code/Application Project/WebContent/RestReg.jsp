<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h5 align="right">Logged in as <%=session.getAttribute("UserName")%><br>
<a href='logout.jsp'>Log out</a></h5>
<form  method="post" action="Restaurants.jsp">


<%

Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/dbo_project";
String username="root";
String password="harsh123";
//String requrl="/Practice/Comm_Rest.jsp/?Rest_ID=";

Connection conn=DriverManager.getConnection(url,username,password);


int u=(Integer)session.getAttribute("UserID");
System.out.println(u);



PreparedStatement pst=(PreparedStatement) conn.prepareStatement("Insert Into `group`(UID,GID) values(?,1); ");
pst.setInt(1, u);
//pst.setString(2, set.getEmail());
//Statement stmt1=conn.createStatement();
//ResultSet rs1=stmt1.executeQuery(qury);
/* rs1.next();
String res=rs1.getString(4);
System.out.println(res); */


pst.executeUpdate();


%>
<table cellpadding="5" cellspacing="5">
	<tr>
		<td>User Name</td>
		<td><input type="text" name="txtUserName" value=<%=session.getAttribute("UserName") %>></td>
	</tr>
	<tr>
		<td>UserID</td>
		<td><input type="text" name="txtUID" value=<%=session.getAttribute("UserID") %>></td>
	</tr>
	<tr>
		<td>Group-Name</td>
		<td><input type="text" name="txtGName" value="Restaurant"/></td>
	</tr>
	<tr>
		<td><button type="submit">Register</button></td>
		
	</tr>
</table>



</form>
</body>
</html>