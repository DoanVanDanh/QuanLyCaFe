package dangnhap.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import dangnhap.business.Ban;
import dangnhap.business.Bill;
import dangnhap.business.DichVu;
import dangnhap.business.GoiDichVu;
import dangnhap.business.User;
import dangnhap.data.BanDB;
import dangnhap.data.BillDB;
import dangnhap.data.GoiDichVuDB;
import dangnhap.data.UserDB;
import jdk.nashorn.internal.ir.RuntimeNode.Request;

/**
 * Servlet implementation class BanServlet
 */
@WebServlet("/DichVu")
public class DichVuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public DichVuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		HttpSession session2 = request.getSession();
		String url="/GoiBan.jsp";
		Exception exception = new Exception();
		
		//*kiem tra bang tren man hinh console*/
		String maDichVuString = request.getParameter("maDichVu");
		System.out.println("maDV: "+maDichVuString);
		
		int maDichVu=0;
		if(maDichVuString!=null)
			maDichVu = Integer.valueOf(maDichVuString);
			
		
		String soLuongTypeString = request.getParameter("soLuong");
		
		int soLuong=0;
		if(soLuongTypeString!=null)
			soLuong = Integer.valueOf(soLuongTypeString);
		System.out.println("So Luong: "+soLuong);
//		
//		
//		String userAdmin= String.valueOf(session.getAttribute("userAdmin"));
//		System.out.println(userAdmin);
//		
//		
		int maBan = Integer.valueOf(request.getParameter("maBan"));
		System.out.println("maBan"+ maBan);
		
		String tenBan = request.getParameter("maBan");
		System.out.println("tenBan"+tenBan);
		
		
		int trangThai=-1;
		try {
			trangThai = BanDB.getTrangThaiBan(maBan);
			System.out.println("trangthai "+trangThai);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}//mã bàn = sso
		
		
		//		//////////////////////////////////////////////////////
		
		
		
		int maBill=0;
		//thay doi trang thai ban+ insert Bill-->tạo mã Bill để get
		if(trangThai==0&&maDichVu!=0){
			try{
					//thay doi trang thai ban
					if(BanDB.updateBan(maBan, tenBan, 1)){
						System.out.println("bàn đã đặt thành công~~");
						//trangThai=1;
					//tạo mã bill và get
					if(BillDB.insertBill(maBan,0,null))
						System.out.println("đã insert table Bill thành công");
					maBill = BillDB.getMaBill(maBan);
					request.setAttribute("maBill", maBill);
					//goi dich vu: lan dau
					if(GoiDichVuDB.insertSuDungDichVu(maDichVu, soLuong, maBill))
						System.out.println("đã thêm sử dụng dịch vụ thành công");
				}
				
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
		}
		
		
		//đã từng gọi dichvu-->  đã có maxBill cho bàn này
		else if(trangThai==1){
			try {
				//lấy mã Bill, nếu không gọi --> cũng lấy maBill để xem đã gọi gì~~
				maBill = BillDB.getMaBill(maBan);
				request.setAttribute("maBill", maBill);
				
				//nếu gọi dịch vụ--> kiểm tra đã gọi dịch vụ này chưa, nếu gọi thêm -->tăng số lượng
				if(maDichVu!=0){
				//nếu cùng gọi 1 dịch vụ==> thêm số lượng --> update SUDUNGDICHVU
				System.out.println("dang goi them dichvu.... dang kiem tra da goi dich vu nay chua");
				int coTrungDichVu=0;
				ArrayList<GoiDichVu> goiDichVuArr = GoiDichVuDB.getGoiDichVu(maBill);
				for(int i=0;i<goiDichVuArr.size();i++){  
		 			GoiDichVu goiDV = goiDichVuArr.get(i);
		 			int maDichVuKiemTra = goiDV.getDichVu().getMaDV();
		 			
		 			if(maDichVu == maDichVuKiemTra){
		 				int soLuongUpdate = soLuong+goiDV.getSoLuong();
		 				if(GoiDichVuDB.updateSuDungDichVu(maDichVu, maBill,soLuongUpdate))
		 					System.out.println("đã thêm số lượng cho dịch vụ đó");
		 				coTrungDichVu=1;
		 				break;
		 			}
				}	
				if(coTrungDichVu==0)
					if(GoiDichVuDB.insertSuDungDichVu(maDichVu, soLuong, maBill))
						System.out.println("đã thêm sử dụng dịch vụ thành công");
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		
		Object maBillObject=request.getAttribute("maBill");
		int maBill2 = 0;
		if(maBillObject!=null)
			maBill2=Integer.valueOf(maBillObject.toString());
		System.out.println("MaBill2:"+maBill2);
		

		//thanh toán, update lại trạng thái của bàn
		String trangThaiThanhToanObject = request.getParameter("thanhToan");
		int trangThaiThanhToan=0;
		if(trangThaiThanhToanObject!=null)
			trangThaiThanhToan = Integer.valueOf(trangThaiThanhToanObject.toString());

		String urlThanhToan="";
		if(trangThaiThanhToan==1){
			System.out.println("da thanh toan");
			
			url="/ThanhToan.jsp";
			//response.sendRedirect(url);
			try {
				if(BanDB.updateBan(maBan, tenBan,0))
					System.out.println(" đã trả bàn");
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		
		System.out.println("---------------------------------");
		
		
		
		
        getServletContext()
        .getRequestDispatcher(url)
        .forward(request, response);
       
	}

	 @Override
	    protected void doGet(HttpServletRequest request,
	            HttpServletResponse response)
	            throws ServletException, IOException {
	        doPost(request, response);
	    }
	 
	   

}
