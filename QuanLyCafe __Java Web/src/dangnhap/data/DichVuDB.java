package dangnhap.data;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dangnhap.business.Ban;
import dangnhap.business.DichVu;




public class DichVuDB {

	static Connection connection = null;
	public static ArrayList<DichVu> getDichVu() throws SQLException{
		ArrayList<DichVu> DichVuArr = new ArrayList<>();
		
		connection = ConnectionCafe.getConnection(); 
		String sql = "select maDV,TenDV,DonViTinh,Gia from DICHVU";
		
		try {
				PreparedStatement ps =  connection.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
			
			
				while(rs.next()) {
					int maDV = rs.getInt(1);
					String tenDV = rs.getString(2);
					String donViTinh = rs.getString(3);
					float gia = rs.getFloat(4);
					
					DichVu dv = new DichVu(maDV, tenDV, donViTinh, gia);
					DichVuArr.add(dv);
				}
				rs.close();
				
			}
		catch (Exception e) {
			System.out.println("DichVuDB.java"+e.getMessage());
		}
		finally {
			connection.close();
		}
		return DichVuArr;
	}
//	public static void main(String[] args) {
//		System.out.println(new DichVuDB().getDichVu().get(3).getTenDV());
//	}
}
