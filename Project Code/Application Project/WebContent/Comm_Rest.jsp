<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Restaurant Comments</title>
</head>
<body>
<h5 align="right">Logged in as <%=session.getAttribute("UserName")%><br>
<a href='logout.jsp'>Log out</a></h5>
<input type="hidden" name="pagename" value="cm_rest"/>
<h2 align="center">Comments on Restaurants</h2>
<form method="post" action="Comm_Rest.jsp">


<table cellpadding="5" cellspacing="5"  align="center" width="60%"  border="1" >
<tr>

	<td>Comment-ID</td>
	<td>UserID</td>
	<td>RestID</td>
	<td>Rest_name</td>
	<td>Rest_rating</td>
	<td>Reviews</td> 
	<td>Date_reported</td>
	
</tr>

<%


try
{
	
	//response.setIntHeader("Refresh", 5);
String u=request.getParameter("Comm_RestID");
System.out.println(u);	
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/dbo_project";
String username="root";
String password="harsh123";
//String requrl="/Practice/Comm_Rest.jsp/?Rest_ID=";
String query="select * from comments_on_restaurants where Comm_RestID="+ "'"+ u + "' and Rest_rating IS not null  order by  Date_reported desc;";
System.out.println(query);
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();

ResultSet rs=stmt.executeQuery(query);



//String restId=null;
while(rs.next())
{

	%>
    <tr><td><%=rs.getInt("Comment-ID") %></td>
    	<td><%=rs.getInt("Comm_UserID") %></td>
    	<td><%=rs.getInt("Comm_RestID") %></td>
    	<td><%=rs.getString("Comm_Rest_name") %></td>
    	<td><%=rs.getInt("Rest_rating") %></td>
    	<td><%=rs.getString("Reviews") %></td>
   		<td><%=rs.getString("Date_reported") %></td>
   		<!-- <td><button type="submit">Rate</button></td> -->
   		
   		<!-- <td><button type="submit">See Reviews</button> -->
   	</tr>
<%

}
//System.out.println(restId); 


 	 String l=request.getParameter("txtRID");
	 System.out.println("Rest_ID "+l);
	
	String n=request.getParameter("txtRName");
	System.out.println("Rest_name "+n);
	
	String review=request.getParameter("txtReview");
	System.out.println(review);
	String value	=	request.getParameter("rating");
	
	System.out.println(value);
	int m=(Integer)session.getAttribute("UserID");
	String sql="INSERT INTO comments_on_restaurants(Comm_UserID,Comm_RestID,Comm_Rest_name,Rest_rating,Reviews,Date_reported) values(?,?,?,?,?,now());";
	//String sql1="delete from comments_on_restaurants where Comm_UserID="+m+" and "
	//Statement stmt1=conn.createStatement();
	PreparedStatement pst=conn.prepareStatement(sql);
	pst.setInt(1, m);
	pst.setString(2,l);
	pst.setString(3, n); 
	pst.setString(4, value);
	pst.setString(5, review);
//	pst.setString(4, now());
	pst.executeUpdate();
 	 
	
	
	
	pst.close();
	/* rs1.close();
	stmt1.close(); */

	
    
    conn.close();
    }
	catch(Exception e)
	{
    e.printStackTrace();
	}

%>
 </table>
</form>
	
	<div style="float:left;margin-left:300px;margin-top:100px;height:100px">
	
	<form action="addComments.jsp">
	<td><a href= <%="/Practice/addComments.jsp?txtRID="+ request.getParameter("Comm_RestID")  %>> Write a review </a></td>  
	</form>

	</div>
<a href="http://localhost:9000/Practice/Restaurants.jsp">Home</a>
</body>
</html>