<%
    if ((session.getAttribute("UserName") == null) || (session.getAttribute("UserName") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("UserName")%>
<a href='logout.jsp'>Log out</a>
<%
    }
%>