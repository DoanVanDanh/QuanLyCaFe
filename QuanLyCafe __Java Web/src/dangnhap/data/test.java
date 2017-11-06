package dangnhap.data;

import dangnhap.business.User;

public class test {

	public static void main(String[] args) {
		User u = new User("admin", "1111");
		
		
		if(UserDB.isAdmin(u))
			System.out.println("admin");
		
		else
			System.out.println("k phai");
	}
}
