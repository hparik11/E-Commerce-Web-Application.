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

Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/dbo_project";
String username="root";
String password="harsh123";
Connection conn=DriverManager.getConnection(url,username,password);
	 	
int u=(Integer)session.getAttribute("UserID");
String res=null;
	 	
	 		
		 	
		 	Statement names = conn.createStatement();
		   	     
		 	String qury="select Group_name from group_details where Group_ID in (select GID from `group` where UID=" + u + " );";
		 	Statement stmt1=conn.createStatement();
		 	ResultSet rs1=stmt1.executeQuery(qury);
		 	/* rs1.next();
		 	 res=rs1.getString(1);
		 	System.out.println(res); */
		    
		    
	 	
		    
%>
<table>
<tr>
<td>UserName:<input type="text" value=<%=session.getAttribute("UserName") %>> </td>
<td>Member of: <select name="cityyy">
		       	<option value="all">Interest Groups</option>
		        <% 
		        while(rs1.next())
		        { 		        
		        %>
		            <option><%= rs1.getString(1)%></option>
		        <%
		        System.out.println(res);
		        }
		        
		        %>
		        </select>
		        </td></tr>


</table>
</body>
</html>