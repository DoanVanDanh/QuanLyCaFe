package dangnhap.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnectionCafe {
static Connection connection = null;
	public static  Connection getConnection(){
	
	try{
		// Establish the connection.  
         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
         connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=QuanLyCafe;integratedSecurity=true;");  //connectionUrl
		
	}catch(Exception e){
		System.out.println("k ket noi duoc"+e.getMessage());
	}
	return connection;
}
public static void disConnection() {
	if(connection!=null)
		try {
			connection.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
}
}
