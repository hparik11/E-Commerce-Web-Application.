<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import ="java.util.*" %>
<%@ page import ="java.sql.*" %>

<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Restaurant Rules</title>

</head>
<body>
<form action="RegServlet" method="post"> 
<input type="hidden" name="pagename" value="restrules"/> 


 

<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/dbo_project";
String username="root";
String password="harsh123";
Connection conn=DriverManager.getConnection(url,username,password); 	
	 
	 		
	 		String qury="select * from activity_points";
	 		Statement stmt1=conn.createStatement();
	 		ResultSet rs1=stmt1.executeQuery(qury);
	 		
	 		
	 		//String sql="Insert into activity_points "
	 		
	 		//rs1.next();
	 		/* String res=rs1.getString(1);
	 		System.out.println(res);
	 		/* /* rs1.next();
	 		rs1.next();
	 		String res1=rs1.getString(3);
	 		System.out.println(res1);
	 		
	 		/* rs1.close();
	 	    stmt1.close();
	 	    conn.close(); */ 
	 	    
	       
	
%>
		
			<div >
		       	<select name="rest-rules">
		       	<option value="all">Select Rule</option>
		        <% 
		        while(rs1.next())
		        { 		        
		        %>
		            <option><%= rs1.getString(1)%></option>
		        <%
		        System.out.println(rs1.getString(1));
		        }
		        
		        %>
		        </select>
		        </div>
	
	<table>	       
	<tr>	
	<td>Credit Points:</td>
	<td><input type="text" name="txtCP" /></td>

</tr>
<tr>
	<td><button type="submit">Submit</button></td>
</tr>
</table>

</form>
</body>
</html>