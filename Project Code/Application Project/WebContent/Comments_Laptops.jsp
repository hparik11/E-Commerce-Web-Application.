<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Comments</title>
</head>
<body>
<h5 align="right">Logged in as <%=session.getAttribute("UserName")%><br>
<a href='logout.jsp'>Log out</a></h5>
<input type="hidden" name="pagename" value="cm_rest"/>
<h2 align="center">Comments on Laptops</h2>
<p>Code for Type of Comment: 1 = Review, 2 = Help, 3 = Buy, 4 = Sell, 5 = Trade</p>


<form method="post" action="addcmntlaptop.jsp">

<table cellpadding="5" cellspacing="5"  align="center" width="60%"  border="1" >
<tr>

	<td>Comment-ID</td>
	<td>Brand</td>
	<td>Model_no</td>
	<td>Comments</td>
	<td>Comment_type</td>
	<td>Rating</td> 
	<td>Date_reported</td>
	<td>Buy</td>
	<td>Sell</td>
	
</tr>
</form>	
<%
	

Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/dbo_project";
String username="root";
String password="harsh123";
//String requrl="/Practice/Comm_Rest.jsp/?Rest_ID=";

try{
	

Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
String u=request.getParameter("Model_no");

String query="select * from comments_on_laptops;";
ResultSet rs=stmt.executeQuery(query);
System.out.println(query);


//String restId=null;
while(rs.next())
{

	%>
    <tr><td><%=rs.getInt("Comment_ID") %></td>
    	<td><%=rs.getString("Brand") %></td>
    	<td><%=rs.getInt("Model_no") %></td>
    	<td><%=rs.getString("Comments") %></td>
    	<td><%=rs.getInt("Comment_type") %></td>
    	<td><%=rs.getInt("Rating") %></td>
   		<td><%=rs.getString("Date_reported") %></td>
   		<form action="WebAccount.jsp">
   		<td><button type="submit">Buy</button></td> 
   		</form>
   		<form action="">
   		<td><button type="submit">Sell</button> 
   		</td></form>
   	</tr>
<%

}
//System.out.println(restId); 


	int l=Integer.valueOf(request.getParameter("Model_no"));
	System.out.println(l);
	String m=request.getParameter("Brand");
	System.out.println(m);
	String c=request.getParameter("txtReview");
	System.out.println(c);
	
	String qury="select * from comments_on_Laptops where Brand="+"'"+m+"'";
	Statement stmt1=conn.createStatement();
	ResultSet rs1=stmt1.executeQuery(qury);
	rs1.next();
	String res=rs1.getString(4);
	System.out.println(res);
	
	int type=Integer.valueOf(request.getParameter("Comment_type"));
	System.out.println(type);
	
	
	
	String value=request.getParameter("rating");
	
	System.out.println(value);
	int n=(Integer)session.getAttribute("UserID");

	String sql="INSERT INTO Comments_on_Laptops(Comm_LP_UserID,Brand,Model_no,Comments,Comment_Type,Rating,Date_reported) values(?,?,?,?,?,?,now())";
	//Statement stmt1=conn.createStatement();
	PreparedStatement pst=conn.prepareStatement(sql);
	pst.setInt(1,n);
	pst.setString(2, m);
	
	
	pst.setInt(3,l);
	//pst.setString(3, res);
	pst.setString(4, c);
	pst.setInt(5, type);
   pst.setString(6,value);
	pst.executeUpdate();
 	 
	
	
	
	pst.close();
	rs1.close();
	stmt1.close();

	
    rs.close();
    stmt.close();
    conn.close();
}
	catch(Exception e)
	{
    e.printStackTrace();
	}

%>
 
</table>

	<div style="float:left;margin-left:300px;margin-top:100px;height:100px">
	
	<form action="addcmntlaptop.jsp">
	<td><a href= <%="/Practice/addcmntlaptop.jsp?txtModel="+ request.getParameter("Model_no") +"&txtBrand="+request.getParameter("Brand") +"&txtType="+request.getParameter("Comment_type") %>> Write a review </a></td>  
	</form>

	</div>

</body>
</html>