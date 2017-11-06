package dangnhap.business;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dangnhap.data.ConnectionCafe;

public class Ban implements Serializable{
	private int maBan;
	private String tenBan;
	private int trangThai;
	
	
	public Ban()
	{
		tenBan="";
		trangThai=0;
		maBan=0;
	}
	public Ban(int maBan,String tenBan, int trangThai) {
		super();
		this.tenBan = tenBan;
		this.trangThai = trangThai;
		this.maBan = maBan;
	}
//	static int soluong;
	public int getMaBan() {
		return maBan;
	}
	public void setMaBan(int maBan) {
		this.maBan = maBan;
	}
	public String getTenBan() {
		return tenBan;
	}
	public void setTenBan(String tenBan) {
		this.tenBan = tenBan;
	}
	public int getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(int trangThai) {
		this.trangThai = trangThai;
	}
	
	
	
}
