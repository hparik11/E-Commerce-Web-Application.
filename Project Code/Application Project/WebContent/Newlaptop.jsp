<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.maindiv
{
margin:5px;
}
.div1
{
   float:left;
   width:150px;
}

</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Laptop</title>
</head>
<body>
<h5 align="right">Logged in as <%=session.getAttribute("UserName")%><br>
<a href='logout.jsp'>Log out</a></h5>

<form action="Dummy.jsp" method="post">
<h2>Add Laptop Here</h2>
<p>Code for Type of Comment: 1 = Review, 2 = Help, 3 = Buy, 4 = Sell, 5 = Trade</p>
<p>Please fill in all relevant information:</p>
<p>
			<form  action="createlaptop">

			   <div class="maindiv"> 
                 <div class="div1">User-id</div>
                 <div>
                 <input type="text" id="User_id" name="User_id" value=<%=session.getAttribute("UserID")%>>
                  </div>
               </div>
             <div class="maindiv"> 
              <div class="div1">Brand</div>
              <div>
                <input  id="manufacturer" type="text" name="manufacturer">
                </div>
                </div>
              <div class="maindiv">                   
                <div class="div1">Model</div>
                <div>
                <input id="model" type="text" name="model">
                </div>
                </div>
                <div class="maindiv"> 
                <div class="div1">Comment-Type</div>
                <div >
                <input id="type" type="text" name="type" >
                </div>
                </div><br>
                <div class="maindiv"> 
                <div class="div1">Price</div>
                <div>
                <input id="price" type="text" name="price" value="0" >
                </div>
                </div>
                <div class="maindiv">                   
                <div class="div1">Review/Details</div>
                <div>
                <input id="review" type="text" name="review" value="none">
                </div>
                </div>
                <div class="maindiv">                   
                <div class="div1">Rating of Laptop</div>
                <div>
                <input id="review" type="text" name="rating" value="none">
                </div>
                </div>
          		
               <br/>
                <p class="p3">
			<input type="submit" value="send" onclick='javascript:window.this.close();' ></p>

             </form>

</body>
</html>