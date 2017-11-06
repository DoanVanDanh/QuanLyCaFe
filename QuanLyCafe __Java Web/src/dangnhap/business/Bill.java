package dangnhap.business;

import java.io.Serializable;
import java.sql.Date;

public class Bill implements Serializable {

	private int maBill;
	private int maBan;
	private float tongTien;
	private Date date;
	public Bill(int maBill, int maBan, float tongTien, Date date) {
		this.maBill = maBill;
		this.maBan = maBan;
		this.tongTien = tongTien;
		this.date = date;
	}
	public int getMaBill() {
		return maBill;
	}
	public void setMaBill(int maBill) {
		this.maBill = maBill;
	}
	public int getMaBan() {
		return maBan;
	}
	public void setMaBan(int maBan) {
		this.maBan = maBan;
	}
	public float getTongTien() {
		return tongTien;
	}
	public void setTongTien(float tongTien) {
		this.tongTien = tongTien;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
	
}
