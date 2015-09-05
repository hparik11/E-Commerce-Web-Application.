<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Interest Group Selection</title>
</head>
<body>
<h5 align="right">Welcome <%=session.getAttribute("UserName")%><br>
<a href='logout.jsp'>Log out</a></h5>
<h2 align="center">Please Choose your Interest Group</h2>


<table  border="0" style="margin-left:600px;  /* font-weight:bold;font-style:italic; */font-size:22px">
<tr>
	<td style="padding-bottom:15px"><a href="http://localhost:9000/Practice/Profile.jsp"/>Profile</a></td>
</tr>
<form action="RestReg.jsp" method="GET">
<tr>
	<td style="padding-bottom:15px"><a href="http://localhost:9000/Practice/Restaurants.jsp"/>Restaurant</td>
	<td></td><td ><button type="submit">Register</button></td>
</tr>
</form>
<form action="LaptopReg.jsp" method="get">
<tr>
	<td style="padding-bottom:15px"><a href="http://localhost:9000/Practice/laptoptest.jsp"/>Laptop</a></td>
	<td></td><td><button type="submit">Register</button></td>
</tr>
</form>
</table>

</form>
<!-- <input type="checkbox" name="Restaurants" value="yes"> Restaurants <br>
<input type="checkbox" name="Laptops" value="yes"> Laptops <br>

<p><input type="Submit" value="Submit"> 
 -->



</body>
</html>