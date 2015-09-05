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
<form action="laptoptest.jsp" method="post">
<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/dbo_project";
String username="root";
String password="harsh123";
//String requrl="/Practice/Comm_Rest.jsp/?Rest_ID=";
 Connection conn=DriverManager.getConnection(url,username,password);
 
String u=request.getParameter("model");
String m=request.getParameter("manufacturer");
String n=request.getParameter("type");

String sql="INSERT INTO laptops(Model_no,Brand,Type) values(?,?,?)";
	//Statement stmt1=conn.createStatement();
	PreparedStatement pst=conn.prepareStatement(sql);
	pst.setString(1,u);
	pst.setString(2, m);
	
	
	pst.setString(3,n);
	//pst.setString(3, res);
	
   
	pst.executeUpdate();
 	

%>
New Laptop added. <a href="http://localhost:9000/Practice/laptoptest.jsp">Home</a>
</body>
</html>