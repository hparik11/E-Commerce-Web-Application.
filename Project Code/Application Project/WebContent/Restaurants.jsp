<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.*" %>
<%@ page import ="java.sql.*" %>

<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Restaurants</title>
</head>
<body>
<h5 align="right">Logged in as <%=session.getAttribute("UserName")%><br>
<a href='logout.jsp'>Log out</a></h5>
<h2 align="center">Restaurants Details</h2>
 <form action="RegServlet" method="post"> 
<input type="hidden" name="pagename" value="filterdata"/> 

<table cellpadding="5" cellspacing="5" align="center" width="80%" cellpadding="10" border="1" >
<tr>

	<td>Rest_ID</td>
	<td>Rest_Name</td>
	<td>Address</td>
	<td>City</td>
	<td>Pin</td>
	<td>Date</td>
	<td>Rating</td> 
	<td>Review</td>
	<!-- <td>Rate it</td> -->
	
</tr>

<%	
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/dbo_project";
String username="root";
String password="harsh123";
Connection conn=DriverManager.getConnection(url,username,password);
	 	
	 	
	 	try{
	 		//String id=request.getParameter("id");
		 	String city=request.getParameter("City");
		 	
	 		System.out.println("Hello "+city);
	 		
			
		 	
		 	Statement names = conn.createStatement();
		    Statement brands = conn.createStatement();
		    Statement comment_type = conn.createStatement();
		    
		    String query="select distinct City from restaurants";
		    Statement stp=conn.createStatement();

		    ResultSet r_city=stp.executeQuery(query);
		    
%>
		    
		<div style="width:200px;margin-left:200px;float:left;margin-top:100px;height:100px">
		
		
		       	<select name="cityyy">
		       	<option value="all">Select City</option>
		        <% 
		        while(r_city.next())
		        { 		        
		        %>
		            <option><%= r_city.getString(1)%></option>
		        <%
		        System.out.println(r_city.getString(1));
		        }
		        
		        %>
		        </select>
		        <input type="Submit" value="Filter">
	
		        
	    </div>
	     <% 	
	     
	     String sql="select * from restaurants ";
	     Statement stmt=conn.createStatement();
	    
		 /* if(id!=null){
		 		sql = sql +" where rest_id='"+id+"'";
		 	} */
		 	
		 	if(city!=null){
		 		if(sql.indexOf("where")>=0){
		 			sql = sql+" and City='"+city+"'";
		 		}else{
		 			sql = sql+" where City='"+city+"'";
		 		}
		 	}
		 	//System.out.println(sql);
		 	
		 	 ResultSet rs=stmt.executeQuery(sql);
		 	
		 	
		 	String query1="SELECT avg(Rest_rating) as Avg FROM comments_on_restaurants group by Comm_RestID; ";
		 	Statement stmt1=conn.createStatement();
		 	ResultSet rs1=stmt1.executeQuery(query1);



		 	ResultSetMetaData metadata = rs.getMetaData();

		 	//ResultSetMetaData metadata1 = rs1.getMetaData();


		 	String requrl=null;
		 	//String usrId=null;
		 	    while(rs.next() && rs1.next())
		 	    {
		 	    	 requrl="/Practice/Comm_Rest.jsp?Comm_RestID=";
		 	    	// usrId="/Practice/Comm_Rest.jsp?Comm_UserID=";
		 	        %>
		 	            <tr>
		 	             <%
		 	             
		 	             for(int i = 1; i<=metadata.getColumnCount();i++)
		 	                { %>
		 	                <td> 
		 	                <% 
		 	                 if(i == 1)
		 	                 {
		 	                 	requrl = requrl+rs.getString(i); 
		 	                 } 
		 	                 
		 	                 %>
		 	                 <%=rs.getString(i)%>
		 	                 </td>
		 	                
		 	            <% 
		 	            
		 	                }
		 	             
		 	            %> 
		 	            <td>
		 	           
		 	              	 <%=rs1.getString(1) %>
		 	      
		 	            </td>
		 	            <td><a href=<%=requrl%>> See review </a></td>  
		 	            <!-- <td>
		 	            <input type="radio" name="rate" value="1" class="star">
		 	            <input type="radio" name="rate" value="2" class="star">
		 	            <input type="radio" name="rate" value="3" class="star">
		 	            <input type="radio" name="rate" value="4" class="star">
		 	            <input type="radio" name="rate" value="5" class="star"></td>
		 	            <td><button type="submit">Submit Rating</button></td>           -->
		 	            </tr>
		 	    <% 
		 	    
		 	 //   String value=request.getParameter("rate");
		 	    
		 	    
		 	    
		 	    }
		 	  
		 	    rs1.close();
		 	    stmt1.close();
		 	    rs.close();
		 	    stmt.close();
		 	    conn.close();
		 	    
		       
		        
	 	} catch(SQLException e) {
	 		System.out.println(e.getMessage());
	 	}
	    %>

</table>

</form> 

	<div style="width:300px;margin-right:100px;float:right;margin-top:100px;height:200px">
	<form action="newRest.jsp">
	<input type="submit" value="Add New Restaurant" name="Create"/>
	</form>
	</div>
	
</body>
</html>