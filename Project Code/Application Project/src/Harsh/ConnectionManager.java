package Harsh;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {
	
	public static Connection connect()
	{
	
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/dbo_project","root","harsh123");
			
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