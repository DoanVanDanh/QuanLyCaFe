package dangnhap.business;

import java.io.Serializable;

public class DichVu implements Serializable{
	private int maDV;
	private String tenDV;
	private String donViTinh;
	private float gia;
	
	
	
	public DichVu(int maDV, String tenDV, String donViTinh, float gia) {
		super();
		this.maDV = maDV;
		this.tenDV = tenDV;
		this.donViTinh = donViTinh;
		this.gia = gia;
	}

	public DichVu(){
		tenDV="";
		donViTinh="";
		gia=0;
		maDV=0;
	}

	public int getMaDV() {
		return maDV;
	}

	public void setMaDV(int maDV) {
		this.maDV = maDV;
	}

	public String getTenDV() {
		return tenDV;
	}

	public void setTenDV(String tenDV) {
		this.tenDV = tenDV;
	}

	public String getDonViTinh() {
		return donViTinh;
	}

	public void setDonViTinh(String donViTinh) {
		this.donViTinh = donViTinh;
	}

	public float getGia() {
		return gia;
	}

	public void setGia(float gia) {
		this.gia = gia;
	}

	
	
	
	
	
	
}
