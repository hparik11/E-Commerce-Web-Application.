package Harsh;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;



/**
 * Servlet implementation class RegServlet
 */
import java.sql.*;
@WebServlet(urlPatterns={"/RegServlet"})
public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	StringBuilder csvSkills	=	new  StringBuilder();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String hdnParam	=	request.getParameter("pagename");
		response.setContentType("text/html");
		if(hdnParam.equals("register")){
			String uname	=	request.getParameter("txtUName");
			
			String email	=	request.getParameter("txtEmail");
			
			String password	=	request.getParameter("txtPassword");
			
			String address	=	request.getParameter("txtAddress");
			
			String status=null;
			
			try {
				status=DbManager.login(uname,email);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
						
			if(status=="False")
			{
				GetsSets sets	=	new GetsSets();
				
				sets.setUname(uname);
			
				sets.setEmail(email);
				sets.setPassword(password);
				sets.setAddress(address);
							
					try {
						DbManager.Insert(sets);
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (InstantiationException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IllegalAccessException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} 
					response.sendRedirect("index.jsp");
			
			}
			else
			{
				PrintWriter out=response.getWriter();
				out.println("<h3>Sorry, This User Name or Email-ID has already been occupied.</h3>");
				
			}
			
				
		}
		/*if(hdnParam.equals("login")){
				String userName	=	request.getParameter("txtUserName");
				String password	=	request.getParameter("txtPassword");
				if((userName.equals("admin")) && (password.equals("admin"))){
					response.sendRedirect("admin.jsp");
				}
				else
				{
					GetsSets set=new GetsSets();
					
					set.setUname(userName);
					set.setPassword(password);
					try {
						int checkUser	=	DbManager.checkUser(set);
						System.out.println(checkUser);
						PrintWriter out=response.getWriter();
						out.println("Hello "+ userName );
							if(checkUser == 1){
								response.sendRedirect("Interest Groups.jsp");
							}else{
								response.sendRedirect("login.jsp");
							}
					} catch (ClassNotFoundException | SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (InstantiationException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IllegalAccessException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
		}
		*/
		
		if(hdnParam.equals("AddRest"))
		{
			String rname	=	request.getParameter("txtRName");
			
			String 	Address=	request.getParameter("txtAddress");
			
			String City	=	request.getParameter("txtCity");
			
			String Pin	=	request.getParameter("txtPin");
			
			GetsSets set=new GetsSets();
			set.setRname(rname);
			set.setR_Address(Address);
			set.setCity(City);
			set.setPin(Pin);
			
			try {
				DbManager.modify(set);
			} catch (ClassNotFoundException | InstantiationException
					| IllegalAccessException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		
		if(hdnParam.equals("filterdata"))
		{
			/*String value	=	request.getParameter("rating");
			System.out.println(value);
			*/
			String reverse="/Practice/Restaurants.jsp";
			
			//String r_id = request.getParameter("id");
			String r_city = request.getParameter("cityyy");
			//System.out.println(r_id);
			System.out.println("city "+r_city);
			
			boolean andFlag = false;
			if(r_city.indexOf("all")!=-1 )
			{
				response.sendRedirect("/Practice/Restaurants.jsp");
			}
			else
			{
				reverse = reverse + "?";
				
				if(r_city.indexOf("all")==-1){
					if(andFlag){
						reverse = reverse+"&"+"City="+r_city;
					}else{
						reverse = reverse+"City="+r_city;
						andFlag=true;
					}
				}

				response.sendRedirect(reverse);
			}
		}
		
		
		
		if(hdnParam.equals("AddComment"))
		{
			String review=request.getParameter("txtReview");
			System.out.println(review);
			String value	=	request.getParameter("rating");
			System.out.println(value);
		}
		
		if(hdnParam.equals("restrules"))
		{
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String url="jdbc:mysql://localhost/dbo_project";
			String username="root";
			String password="harsh123";
			Connection conn = null;
			try {
				conn = DriverManager.getConnection(url,username,password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			String m=request.getParameter("rest-rules");
	 		System.out.println(m); 
	 		int u=Integer.valueOf(request.getParameter("txtCP"));
	 		
	 		System.out.println(u);
	 		
	 		//Class.forName("com.mysql.jdbc.Driver").newInstance();
			
			PreparedStatement pst = null;
			try {
				pst = (PreparedStatement) conn.prepareStatement("update activity_points set Credit_points=? where Activity_Type=? ");
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			
				try {
					pst.setInt(1, u);
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			
			try {
				pst.setString(2, m);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			try {
				pst.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(hdnParam.equals("laptoprules"))
		{
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String url="jdbc:mysql://localhost/dbo_project";
			String username="root";
			String password="harsh123";
			Connection conn = null;
			try {
				conn = DriverManager.getConnection(url,username,password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			String m=request.getParameter("laptop-rules");
	 		System.out.println(m); 
	 		int u=Integer.valueOf(request.getParameter("txtCP"));
	 		
	 		System.out.println(u);
	 		
	 		//Class.forName("com.mysql.jdbc.Driver").newInstance();
			
			PreparedStatement pst = null;
			try {
				pst = (PreparedStatement) conn.prepareStatement("update activity_points set Credit_points=? where Activity_Type=? ");
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			
				try {
					pst.setInt(1, u);
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			
			try {
				pst.setString(2, m);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			try {
				pst.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}	
		
	}	

