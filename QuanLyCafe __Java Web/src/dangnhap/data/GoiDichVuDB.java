package dangnhap.data;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dangnhap.business.DichVu;
import dangnhap.business.GoiDichVu;



public class GoiDichVuDB {

	private static Connection connection=null;
	public static boolean insertSuDungDichVu(int maDV, int soLuong,int maBill) throws SQLException{
		boolean numTableAffected = false ;
		try{
			connection= ConnectionCafe.getConnection();
			
			String sql ="insert into SUDUNGDICHVU(MaDV,SoLuong,MaBill) values (?,?,?)";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, maDV);
			ps.setInt(2, soLuong);
			ps.setInt(3, maBill);
			
			numTableAffected = ps.executeUpdate()>0;
			
			
		}catch (Exception e) {
			System.out.println("goiDichVuDB.java"+e.getMessage());
		}finally {
			connection.close();
		}
		
		return numTableAffected;
	}
	
	
	public static ArrayList<GoiDichVu> getGoiDichVu(int maBill) throws SQLException{
		ArrayList<GoiDichVu> GoiDichVuArr = new ArrayList<>();
		
		connection = ConnectionCafe.getConnection(); 
		String sql = "select DichVu.MaDV,TenDV,DonViTinh,Gia,SoLuong "+
				"from DICHVU join SUDUNGDICHVU on DICHVU.MaDV = SUDUNGDICHVU.MaDV "+
				"where MaBill=?";
		
		try {
				PreparedStatement ps =  connection.prepareStatement(sql);
				ps.setInt(1, maBill);
				ResultSet rs = ps.executeQuery();
			
			
				while(rs.next()) {
					int maDV = rs.getInt(1);
					String tenDV = rs.getString(2);
					String donViTinh = rs.getString(3);
					Float gia = rs.getFloat(4);
					DichVu dv = new DichVu(maDV, tenDV, donViTinh, gia);
					
					int soLuong = rs.getInt(5);
					
					GoiDichVu goiDV = new GoiDichVu(dv, soLuong);
					
					GoiDichVuArr.add(goiDV);
					
				}
				rs.close();
				
			}
		catch (Exception e) {
			System.out.println("goiDichVuDB.java"+e.getMessage());
		}
		finally {
			connection.close();
		}
		return GoiDichVuArr;
	}
	
	//cập nhật lại số lượng dịch vụ đã gọi:  khi gọi thêm cùng 1 dịch vụ
	public static boolean updateSuDungDichVu(int maDV,int maBill, int soLuong) throws SQLException{
		boolean numTableAffected = false ;
		try{
			connection= ConnectionCafe.getConnection();
			
			String sql ="update SUDUNGDICHVU set SoLuong=? where MaBill=? and MaDV=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(3, maDV);
			ps.setInt(2, maBill);
			ps.setInt(1, soLuong);
			
			numTableAffected = ps.executeUpdate()>0;
			
		}catch (Exception e) {
			System.out.println("GoiDichVuDB.java "+e.getMessage());
		}finally {
			connection.close();
		}
		
		return numTableAffected;
	}
//	public static void main(String[] args) throws SQLException {
//		if(GoiDichVuDB.insertSuDungDichVu(1, 22, 2))
//			System.out.println("da them thanh cong");
//		
//		if(GoiDichVuDB.updateSuDungDichVu(1, 2, 3))
//			System.out.println("da cap nhat thanh cong");
//		
//		System.out.println(GoiDichVuDB.getGoiDichVu(2).get(0).getSoLuong());
//	}
}
