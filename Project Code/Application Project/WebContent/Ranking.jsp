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
<form  method="post" action="">


<%

Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/dbo_project";
String username="root";
String password="harsh123";
//String requrl="/Practice/Comm_Rest.jsp/?Rest_ID=";

Connection conn=DriverManager.getConnection(url,username,password);


/* int u=(Integer)session.getAttribute("UserID");
System.out.println(u);
 */


PreparedStatement pst=(PreparedStatement) conn.prepareStatement("select distinct GID,UID,Rank,Criteria from ranking r,`group` g where g.credit_points>=r.Criteria and g.GID=r.Group_ID  order by r.Criteria desc; ");
ResultSet rs=pst.executeQuery();
while(rs.next())
{
 System.out.print(rs.getString(1));
System.out.print(rs.getString(2));  
System.out.print(rs.getString(3)); 
System.out.println();
}


%>


<table>

<%-- <%

while(rs.next())
	{
	%>
	<tr>
	<td><%=rs.getString(1)%></td>
	<td>
	<td><%=rs.getString(2)%></td></td>
	<td>
	<td><%=rs.getString(3)%></td></td>
	</tr>
<% 
	} 
	%> --%>

</table>
</form>
</body>
</html>