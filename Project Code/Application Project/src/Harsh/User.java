package Harsh;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.PreparedStatement;

import java.sql.*;
//import java.sql.connection;
public class User  {
	public static void main(String args[]) throws Exception
	{
		Connection conn=connect();
		
		insertUser(conn,"John","jasj");
		insertUser(conn,"hgfh","jajhj");
		
		
		
	}
	
	
	public static void insertUser(Connection conn,String FirstName,String LastName) throws Exception
	{
		
		PreparedStatement pst=(PreparedStatement) conn.prepareStatement("insert into members(FirstName,LastName) values(?,?)");
		pst.setString(1, FirstName);
		pst.setString(2,LastName);
		pst.execute();
		pst.close();
		
	}
	public static Connection connect()
	{
	
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/member","root","harsh123");
			
		}
		catch(Exception e){
			return null;
			
		}
	}

	public static boolean close(Connection c)
	{
		try{
			c.close();
			return true;
		}catch(Exception e)
		{
			return false;
		}

	
}
}