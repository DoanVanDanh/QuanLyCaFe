package dangnhap.business;

// lớp này: chứa thông tin: khi gọi 1 dịch vụ 
public class GoiDichVu {
	private DichVu dichVu;
	private int soLuong;
	public GoiDichVu(DichVu dichVu,  int soLuong) {
		this.dichVu = dichVu;
		this.soLuong = soLuong;
	}
	public GoiDichVu() {
		
	}
	public DichVu getDichVu() {
		return dichVu;
	}
	public void setDichVu(DichVu dichVu) {
		this.dichVu = dichVu;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
}
