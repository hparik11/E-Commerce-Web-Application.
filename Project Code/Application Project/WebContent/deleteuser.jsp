<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import ="java.util.*" %>
<%@ page import ="java.sql.*" %>

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
<%
String u=request.getParameter("txtuser"); 
System.out.println(u);

%>
<table>
<tr>
<td>Bloked User: </td>
<td><input type="text" name="txtuser" value=<%=u%>></td>
</tr>

</table>
<%

//int u=Integer.valueOf(request.getParameter("txtuser"));

Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/dbo_project";
String username="root";
String password="harsh123";
Connection conn=DriverManager.getConnection(url,username,password);
	 	
	 	
	 
	 		//String id=request.getParameter("id");
		 	
	 		
			
		 	
		 	Statement names = conn.createStatement();
		    Statement brands = conn.createStatement();
		    Statement comment_type = conn.createStatement();
		    String query1="select UserName from user_details where UserID="+u+";";
		    ResultSet rs1=names.executeQuery(query1);
		    rs1.next();
		    String name=rs1.getString(1);
		    String query="DROP USER '" + name + "'@'localhost';";
		    
		    Statement stp=conn.createStatement();

		    int rs=stp.executeUpdate(query);
		    System.out.println("User "+u+" dropped");
		    
		    %>
</body>
</html>