<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import ="java.util.*" %>
<%@ page import ="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">




</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Restaurant Table</title>
</head>
<body>
<h1>Restaurant Table </h1>
	<div style="border:none;">
	<table  width="70%" border="0">
	    <tr>
	    	<th style="background-color:grey">
	    	Restaurant name
	    	</th>
	    	<th style="background-color:grey">
	    	Restaurant id
	    	</th>
	    	<th style="background-color:grey">
	    	Location
	    	</th>
	    	<th style="background-color:grey">
	    	Restaurant stars
	    	</th>
	    	<th style="background-color:grey">
	    	Avg Rating
	    	</th>
	    	<th style="border:none;background-color:white;cell-padding:-10px;cell-spacing:-10px">
	    	
	    	</th>
	    </tr>
	    <%	
	    Class.forName("com.myquery.jdbc.Driver");
	    String url="jdbc:myquery://localhost/dbo_project";
	    String username="root";
	    String password="harsh123";
	    Connection conn=DriverManager.getConnection(url,username,password);
	 	
	 	
	 	try{
	 		String id=request.getParameter("id");
		 	String city=request.getParameter("city");
		 	
	 		
	 		
			
		 	
		 	Statement names = conn.createStatement();
		    Statement brands = conn.createStatement();
		    Statement comment_type = conn.createStatement();
		    names.execute("select distinct rest_id from restaurant_type");
		    ResultSet rest_id = names.getResultSet();
		    brands.execute("select distinct rest_city from restaurant_type");
		    ResultSet rest_city = brands.getResultSet();
		    
		    %>
		    <div>
		    	<form action="Filterdata">
		        <select name="id">
		        <option value="all">All Value</option>
		        <% while(rest_id.next()){ %>
		            <option><%= rest_id.getString(1)%></option>
		        <%}%>
		        </select>
		       	<select name="city">
		       	<option value="all">All Value</option>
		        <% while(rest_city.next()){ %>
		            <option><%= rest_city.getString(1)%></option>
		        <%}%>
		        </select>
		       	
		        	<input type="Submit" value="filter">
		        </form>
		        
	      	</div>
	     <% 	
	     
	     String sql="select * from restaurants;";
	     Statement stmt=conn.createStatement();
	     ResultSet rs=stmt.executeQuery(sql);
		 if(id!=null){
		 		sql = sql +" where rest_id='"+id+"'";
		 	}
		 	if(city!=null){
		 		if(sql.indexOf("where")>=0){
		 			sql = sql+" and rest_city='"+city+"'";
		 		}else{
		 			sql = sql+" where rest_city='"+city+"'";
		 		}
		 	}
		 	
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
		 	            <td>
		 	            <input type="radio" name="rating" value="1" class="star">
		 	            <input type="radio" name="rating" value="2" class="star">
		 	            <input type="radio" name="rating" value="3" class="star">
		 	            <input type="radio" name="rating" value="4" class="star">
		 	            <input type="radio" name="rating" value="5" class="star"></td>
		 	            <td><button type="submit">Submit Rating</button></td>          
		 	            </tr>
		 	    <%   
		 	    
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
	
	</div>
	 
	
	
	<BR/>
	<BR/>
	<a href='#'>Add a Review </a>
	<div style="margin-left:300px;height:100px">
	<form action="#">
	<input type="submit" value="CREATE NEW RESTAURANT" name="Create" onclick='javascript:window.open("/DATA/Newrestaurant.jsp", "_blank", "scrollbars=1,resizable=1,height=300,width=450");' title='Pop Up'/>
	</form>
	</div>
	
	

</body>
</html>