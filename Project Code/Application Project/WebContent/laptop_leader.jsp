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
<form action="laptop_rules.jsp" method="post">
<table>
<tr>
		<td><button type="submit">Laptop Leader</button></td>
		<%

Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/dbo_project";
String username="root";
String password="harsh123";
Connection conn=DriverManager.getConnection(url,username,password);

	 		
			
		 	
		 	Statement names = conn.createStatement();
		    Statement brands = conn.createStatement();
		    Statement comment_type = conn.createStatement();
		    
		    String query="select * from  comments_on_laptops order by  Date_reported desc;";
		    Statement stp=conn.createStatement();

		    ResultSet rs=stp.executeQuery(query);
		    ResultSetMetaData metadata = rs.getMetaData();
		    String requrl=null; 
		    while(rs.next())
		    {
		    	requrl="/Practice/deleteuser.jsp?txtuser=";
		    	%>
		       <tr>
		 	             <%
		 	             
		 	             for(int i = 1; i<=metadata.getColumnCount();i++)
		 	                { %>
		 	                <td> 
		 	                <% 
		 	                 if(i == 2)
		 	                 {
		 	                 	requrl = requrl+rs.getString(i); 
		 	                 } 
		 	                 
		 	                 %>
		 	                 <%=rs.getString(i)%>
		 	                 </td>
		 	                
		 	            <% 
		 	            
		 	                }
		 	             
		 	            %>
		       		<!-- <form action="deleteuser.jsp" method="post"> -->
		       		<td><a href=<%=requrl%>><input type="button" value="Block"/></a></td>
		       		
		       		<!-- <td><button type="submit">Rate</button></td> -->
		       		
		       		<!-- <td><button type="submit">See Reviews</button> -->
		       	</tr>
		    <%

		    }
		    
 
 %>
</tr>
</table>
</form>
</body>
</html>