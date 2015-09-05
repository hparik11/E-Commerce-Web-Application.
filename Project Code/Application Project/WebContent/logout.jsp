<%
session.setAttribute("UserName", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>