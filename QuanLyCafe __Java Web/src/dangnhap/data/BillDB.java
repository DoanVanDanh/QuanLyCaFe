package dangnhap.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

import dangnhap.business.Bill;

public class BillDB {
	private static Connection connection=null;
	public static boolean insertBill(int maBan,float tongTien, Date ngayThanhToan) throws SQLException{
		boolean numTableAffected = false ;
		try{
			connection= ConnectionCafe.getConnection();
			
			String sql ="insert into Bill(MaBan,TongTien,NgayThanhToan) values (?,?,?)";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, maBan);
			ps.setFloat(2, tongTien);
			ps.setDate(3, ngayThanhToan);
			
			numTableAffected = ps.executeUpdate()>0;
			
			
		}catch (Exception e) {
			System.out.println("BillDB.java"+e.getMessage());
		}finally {
			connection.close();
		}
		
		return numTableAffected;
	}
	public static int getMaBill(int maBan) throws SQLException{
		int maBill=0;
		try{
			connection= ConnectionCafe.getConnection();
			
			String sql ="select MaBill from Bill where MaBan=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, maBan);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
				maBill= rs.getInt(1);
			
			
		}catch (Exception e) {
			System.out.println("BillDB.java"+e.getMessage());
		}finally {
			connection.close();
		}
		return maBill;
	}
//	public static void main(String[] args) throws SQLException {
//		if(BillDB.insertBill(1, 0, null))
//			System.out.println("đã insert table Bill thành công");
//		
//		System.out.println(BillDB.getMaBill(3));
//		
//	}
}
