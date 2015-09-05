<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h5 align="right">Logged in as <%=session.getAttribute("UserName")%><br>
<a href='logout.jsp'>Log out</a></h5>
<p>Code for Type of Comment: 1 = Review, 2 = Help, 3 = Buy, 4 = Sell, 5 = Trade</p>
<form  method="post" action="Comments_Laptops.jsp">
	<h1>Laptop Details</h1>
	<table  border="1">
	    <tr>
	    	<th>
	    	Model_No
	    	</th>
	    	<th>
	    	Brand
	    	</th>
	    	<th>
	    	Comment_Type
	    	</th> 
	    	<th>
	    	Submit
	    	</th>
	    </tr>
	    <%	
	    
	    Class.forName("com.mysql.jdbc.Driver");
	    String url="jdbc:mysql://localhost/dbo_project";
	    String username="root";
	    String password="harsh123";
	    //String requrl="/Practice/Comm_Rest.jsp/?Rest_ID=";

	    Connection conn=DriverManager.getConnection(url,username,password);
		    
	    	
	    	
	    	String name_req=request.getParameter("name");
		 	String brand_req=request.getParameter("brand");
		 	String type_req = request.getParameter("type");
		 	
		 	if(name_req!=null){
		 		
		 	}
		 	else if(brand_req!=null){
		 		
		 	}
		 	else if(type_req!=null){
		 		
		 	}
		 	
		 	
		 	/* Statement names = conn.createStatement();
		    Statement brands = conn.createStatement();
		    Statement comment_type = conn.createStatement();
		    names.execute("select distinct Model_no from laptops");
		    ResultSet rs_names = names.getResultSet();
		   
		    brands.execute("select distinct Brand from laptops");
		    ResultSet rs_brands = brands.getResultSet();
		    comment_type.execute("select distinct Comment_Type from type");
		    ResultSet rs_comment_type = comment_type.getResultSet();  */
		   
		    
		    
		    
			
			String sql="select * from laptops";
			Statement result = conn.createStatement();
			//will dump all columns of this query into a table.
			ResultSet rs=result.executeQuery(sql);
			ResultSetMetaData metadata = rs.getMetaData();

			String requrl=null;
		        while(rs.next())
		        {
		        	requrl="/Practice/Comments_Laptops.jsp?Model_no=";
		     %>
		                <tr>
		                 <%
		                 for(int i = 1; i<=metadata.getColumnCount();i++)
		                    { 
		                	 %>
		                	 <td style="background-color:white;color:black" align="center">
		                     
		                    <% 
		                    if(i==1){
		                    	 requrl = requrl+rs.getString(i);
		                     }
		                     if(i==2){
		                     	requrl= requrl+"&Brand="+rs.getString(i);	
		                     }
		                      
		                      if(i==3){
		                    	 requrl = requrl+"&Comment_type="+rs.getInt(i);
		                     } 
		                     
		 	                 %>
		 	                 <%=rs.getString(i)%>
		 	                 </td>
		 	                
		 	            <%    }
		 	             
		 	            %>
		               <!--  <td><input type="text" name="cmnt"></td>   -->
		                              
		                
		                <td><a href=<%=requrl%>>See Reviews</a></td>
		            </tr>
		      
		      
		       <% 
		 	    
		 	    
		 	    }

	 	
	    %>

	</table>
	</form>
	
		<div style="width:300px;margin-right:100px;float:right;margin-top:100px;height:200px">
	<form action="Newlaptop.jsp">
	<input type="submit" value="Add New Laptop" name="Create"/>
	</form>
	</div>
	<a href=" http://localhost:9000/Practice/laptoptest.jsp" >Home</a>
</body>
</html>