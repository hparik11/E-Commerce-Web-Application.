<%@ page import ="java.sql.*" %>
<%
String userName	=	request.getParameter("txtUserName");
String password	=	request.getParameter("txtPassword");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbo_project",
            "root", "harsh123");
    if((userName.equals("admin")) && (password.equals("admin"))){
		response.sendRedirect("admin.jsp");
	}
    else if((userName.equals("harsh")) && (password.equals("123")))
    {
    	response.sendRedirect("rest_leader.jsp");
    }
    else if((userName.equals("ahad")) && (password.equals("123")))
    {
    	response.sendRedirect("laptop_leader.jsp");
    }
    
    else
    {
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from user_details where UserName='" + userName + "' and Password='" + password+ "'");
    if (rs.next()) {
    	session.setAttribute("UserID", rs.getInt(1));
    	session.setAttribute("WebAccount", rs.getInt(7));
        session.setAttribute("UserName", userName);
        out.println("welcome " + rs.getInt(1) );
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("Interest Groups.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
    }
%>