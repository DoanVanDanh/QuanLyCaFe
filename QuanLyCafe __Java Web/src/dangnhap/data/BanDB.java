package dangnhap.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



import dangnhap.business.Ban;

public class BanDB {

	static Connection connection = null;
	public static ArrayList<Ban> getThongTinBan()
	{
		ArrayList<Ban> banArr = new ArrayList<>();
		
		connection = ConnectionCafe.getConnection(); 
		String sql = "select MaBan,TenBan,TrangThai from Ban";
		
		try {
				PreparedStatement ps =  connection.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
			
			
				while(rs.next()) {
					int maBan = rs.getInt(1);
					String tenBan = rs.getString(2);
					int trangThai = rs.getInt(3);
						
					Ban	ban = new Ban();
					ban.setMaBan(maBan);
					ban.setTenBan(tenBan);
					ban.setTrangThai(trangThai);
					banArr.add(ban);
				}
				rs.close();
				connection.close();
			}
		catch (Exception e) {
			System.out.println("BanDB.java"+e.getMessage());
		}
		finally {
		}
		return banArr;
	}
	
	//lấy trạng thái của 1 bàn--> do trạng thái lun thay đổi~~
	public static int getTrangThaiBan(int maBan) throws SQLException
	{
		int trangThai=-0;
		
		connection = ConnectionCafe.getConnection(); 
		String sql = "select TrangThai from Ban where Maban=?";
		
		try {
				PreparedStatement ps =  connection.prepareStatement(sql);
				ps.setInt(1, maBan);
				ResultSet rs = ps.executeQuery();
			
			
				while(rs.next()) {
					trangThai = rs.getInt(1);
				}
				rs.close();
			}
		catch (Exception e) {
			System.out.println("BanDB.java"+e.getMessage());
		}
		finally {
			connection.close();
		}
		return trangThai;
	}
	
	
	
	public static boolean updateBan(int maBan, String tenBan,int trangThai) throws SQLException{
		boolean numTableAffected = false ;
		try{
			connection= ConnectionCafe.getConnection();
			
			String sql ="update Ban set "+
				"TenBan=?,TrangThai=? "+
					"where MaBan=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, tenBan);
			ps.setInt(2, trangThai);
			ps.setInt(3, maBan);
			
			numTableAffected = ps.executeUpdate()>0;
			
		}catch (Exception e) {
			System.out.println("BanDB.java"+e.getMessage());
		}finally {
			connection.close();
		}
		
		return numTableAffected;
	}
	
//	public static void main(String[] args) throws SQLException {
//		System.out.println(BanDB.getThongTinBan().get(3).getTenBan());
//		if(BanDB.updateBan(1, "Bàn 1", 1))
//			System.out.println("đã update Bàn thành công");
//		
//		System.out.println(BanDB.getTrangThaiBan(1));
//	}
}
