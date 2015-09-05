<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import ="java.util.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.*" %>

<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script>
function disable()
{}

</script>
<style>
h1 {
  
}


</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Table Test</title>
</head>

<body onload="disable()">



<div style="float:right;margin-right-40px">Log-In as:&nbsp;&nbsp;<%=session.getAttribute("username")%> <BR/>Member_ID <%=session.getAttribute("member_id") %></div>

	<div style="margin-left:300px"><h1 style="text-shadow:fuchsia;color:;font-style:italic;font-weight:bold;">Reviews</h1></div>
	<table width="70%" border="1" style="margin-left:150px">
	    <tr style="background-color:white;">
	    	<th>
	    	Commenter
	    	</th>
	    	<th>
	    	Comment Content
	    	</th>
	    	<th>
	    	Rating of Review
	    	</th>
	    <%	
	  /* String u= request.getParameter("rest_id");
	    System.out.println(u);*/
	    String mem_id=request.getParameter("mem_id");
	    String type=request.getParameter("type");
	    String brand=request.getParameter("brand");
	    String model=request.getParameter("model");
	    String price=request.getParameter("price");
	    
		
	 	ResultSet rs;
	 	try{
	 		Class.forName("com.mysql.jdbc.Driver");
		    String url="jdbc:mysql://localhost/dbo_project";
		    String username="root";
		    String password="harsh123";
		    //String requrl="/Practice/Comm_Rest.jsp/?Rest_ID=";

		    Connection conn=DriverManager.getConnection(url,username,password);
			Statement prep = conn.createStatement();
			Statement prep1 = conn.createStatement();
			//model,brand,class_of_review,review,rating_of_laptop,member_id
			prep.execute("select commenter,comment_content,rating from Laptop_Comment where model='"+model+"' AND brand='"+brand+"' AND type='"+type+"' AND member_id="+mem_id);
			//System.out.println("select * from Laptop_Comments where model='"+model+"' AND brand='"+brand+"' AND class_of_review='"+type+"'");
		
			//will dump all columns of this query into a table.
		 	rs = prep.getResultSet();
			ResultSetMetaData metadata = rs.getMetaData();
			  while(rs.next())
		        {
		        	String varurl="/DATA/reviewrating.jsp?comment_id=";
		            %>
		                <tr>
		                 <%
		                 
		                 for(int i = 1; i<=metadata.getColumnCount();i++)
		                    { %>
		                     <td style="background-color:white;color:back">
		                     <% if (i==4) 
		                     {
		                      varurl = varurl + rs.getInt(i);
		                     
		                             }         
		                    %>
		                     <%=rs.getString(i)%>
		                     </td>

		                <% 
		                    }
		                 }
		                %>
		            </tr>
		       <%  
	 		  
		    
	 		    
	 		    
	 		    rs.close();
	 		    prep.close();
	 		    conn.close();        
		              
	 	} catch(SQLException e) {
	 		System.out.println(e.getMessage());
	 	}
	    %>
	</table>
	<div style="">
	
	</form>
	</div>


	
<%
String u= (String)session.getAttribute("UserName");
String m= (String)session.getAttribute("UserID");
%>
<form action="Addlaptopcomment">
<div style="float:left;width:150px;">Model</div><div><input style="background-color:yellow;color:grey" type="text" id="member_id" name="model" value="<%=model%>"/></div>
<div style="float:left;width:150px;">Brand</div><div><input style="background-color:yellow;color:grey" type="text" id="member_id" name="brand" value="<%=brand%>"/></div>
<div style="float:left;width:150px;">Comment Type</div><div><input style="background-color:yellow;color:grey" type="text" id="member_id" name="type" value="<%=type%>"/></div>
<div style="float:left;width:150px;">Their Member_id</div><div><input style="background-color:yellow;color:grey" type="text" id="member_id" name="c_mem_id" value="<%=m%>"/></div>
<div style="float:left;width:150px;">Your Member_id</div><div><input style="background-color:yellow;color:grey" type="text" id="member_id" name="mem_id" value="<%=m%>"/></div>
<div style="float:left;width:150px;">Comment Rating</div><div><input style="background-color:yellow;color:grey" type="text" id="rating" name="rating" value=""/></div>
<div style="float:left;width:150px;">Comment Review</div><div><input style="background-color:yellow;color:grey" type="text" id="rating" name="review" value=""/></div>
<br/>
<input type="submit" id="comment" value="Submit Comment and Rating">
</form>
	
<%	
if(type.equals("4")){
	%>
	<form>
	<h3>You can buy this!</h3>
	
	<input type="text" id="price" value=<%=price %>>
	<input type="submit" value="click to purchase">
	</form>
	<% 
}





%>
	
	
<a href="/Practice/laptoptest.jsp">back</a>
</body>
</html>