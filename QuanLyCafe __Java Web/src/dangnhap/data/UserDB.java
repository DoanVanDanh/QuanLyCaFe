package dangnhap.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dangnhap.business.User;

public class UserDB {
	static Connection connection = null;
	public UserDB() {
		//getConnection();
	}
	
	
	public static boolean  isAdmin(User user)
	{
		connection = ConnectionCafe.getConnection(); 
		String sql = "select UserName,PassWord from ACCount";
		
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				String username = rs.getString(1);
				String pass = rs.getString(2);
				
				if(user.getName().equals(username) && user.getPass().equals(pass)){
					System.out.println("hi, admin~~");
					
					rs.close();
					connection.close();
					return true;
				}
			}
			rs.close();
			connection.close();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		finally {

			
		}
		
		return false;
	}
//	public static void main(String[] args) {
//		User u = new User("admin2", "1111");
//		
//		
//		if(UserDB.isAdmin(u))
//			System.out.println("admin");
//		
//		else
//			System.out.println("k phai");
//	}
	
}
