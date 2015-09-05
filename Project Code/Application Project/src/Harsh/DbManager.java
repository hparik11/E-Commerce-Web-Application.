package Harsh;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Statement;

public class DbManager {
	
	private static Connection conn = ConnectionManager.connect();
	
	public static void Insert(GetsSets set) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException{
		
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		
		PreparedStatement pst=(PreparedStatement) conn.prepareStatement("insert into user_details(UserName,Email_ID,Password,Address) values(?,?,?,?)");
		
		pst.setString(1, set.getUname());
		pst.setString(2, set.getEmail());
		pst.setString(3, set.getPassword());
		pst.setString(4, set.getAddress());
		/*pst.setString(7, set.getAge());
		
		pst.setString(9, set.getSkill());*/
		pst.executeUpdate();
		
	}
	
	public static int checkUser(GetsSets get) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		
		String sql	=	"SELECT COUNT(*) FROM user_details WHERE UserName=? AND Password=?";
		PreparedStatement pst	=	conn.prepareStatement(sql);
		pst.setString(1, get.getUname());
		pst.setString(2, get.getPassword());
		ResultSet rs = pst.executeQuery();
		
		int count = 0;
		while(rs.next())
		{
			count=	rs.getInt(1);
		}
		
		return count;
		
	}
	
	
	public static String login(String uname, String email) throws Exception{

	    String status="False";
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	    Statement stmt=(Statement) conn.createStatement();
	    String query=("SELECT * FROM user_details where UserName LIKE '%" + uname + "%' OR Email_ID LIKE '%" + email + "%'" );
	    
	    ResultSet rs=stmt.executeQuery(query);
	    
	    
	    while (rs.next()) {
			//String id = rs.getString("id");
			String username = rs.getString("UserName");
			String email_id = rs.getString("Email_ID");
			System.out.println( " User Name: " + username
					+ ", Email ID: " + email_id);
			
			
			if(username.equals(uname) || email_id.equals(email))
			{
		        status="True";
		    }
		    else
		    {
		        status="False";
		    }
		  
			
		}
	    return status;
	       
	}

	
public static void modify(GetsSets set) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException{
		
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		
		PreparedStatement pst=(PreparedStatement) conn.prepareStatement("insert into restaurants(Rest_Name,Address,City,Pin) values(?,?,?,?)");
		
		pst.setString(1, set.getRname());
		pst.setString(2, set.getR_Address());
		pst.setString(3, set.getCity());
		pst.setString(4, set.getPin());
		/*pst.setString(7, set.getAge());
		
		pst.setString(9, set.getSkill());*/
		pst.executeUpdate();
		//ConnectionManager.close(conn);
	}



public static void AddComment(GetsSets set) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException{
	
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	
	PreparedStatement pst=(PreparedStatement) conn.prepareStatement("update comments_on_restaurants set reviews=?,rating=? where Comm_UserID=? ");
	
	//String u= session.getAttribute("UserID");
	pst.setString(1, set.getReview());
	pst.setString(2, set.getRating());
	//pst.setString(3, session.getAttribute("UserID"));
}
}