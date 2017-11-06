<%@page import="dangnhap.data.GoiDichVuDB"%>
<%@page import="dangnhap.business.GoiDichVu"%>
<%@page import="dangnhap.business.DichVu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dangnhap.data.DichVuDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	
	<!-- add thư viện jquery để js bootstrap chạy được -->
	<script src="js/jquery-3.2.0.min.js" ></script>
	<script src="js/bootstrap.min.js" ></script>
</head>
<body>

<!-- import header -->
<%@ include file="/header.jsp" %>


<%
	ArrayList<DichVu> DichVuArr = DichVuDB.getDichVu();
%>

<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
	<form action="" method="POST" role="form">
		<legend>Gọi đồ uống,,,,<%=request.getParameter("tenBan") %></legend>

		<div class="form-group">
			<label></label>
			<select name="maDichVu" id="input" class="form-control ">
			<% for(int i=0;i<DichVuArr.size();i++){
				DichVu dv = DichVuArr.get(i);
			%>
				<option  value="<%=dv.getMaDV() %>" class=""><%=dv.getTenDV() %></option>
			<% } %>
			</select>
		</div>
		<input type="number" name="soLuong" value="" required>
		<button type="submit" class="btn btn-primary">Chọn đồ dùng</button>
	</form>	
</div>

<%
	Object maBillObject=request.getAttribute("maBill");
	int maBill = 0;
	if(maBillObject!=null)
		maBill=Integer.valueOf(maBillObject.toString());
	
	long tongTien=0;

//  	int maBill=Integer.valueOf(request.getAttribute("maBill").toString());
 	ArrayList<GoiDichVu> goiDichVuArr = GoiDichVuDB.getGoiDichVu(maBill);
 %> 
<div class="table-responsive">
	<table class="table table-hover">
		<thead>
			<tr class="active">
				<th>tên</th>
				<th>số lượng</th>
				<th> giá </th>
				<th> đơn vị tính </th>
				<th>số tiền</th>
			</tr>
		</thead>
 		<tbody>
		<%  
 			for(int i=0;i<goiDichVuArr.size();i++){  
 			GoiDichVu goiDV = goiDichVuArr.get(i);
			
 			DichVu dichVu = goiDV.getDichVu();
			int soLuong = goiDV.getSoLuong();
			tongTien+=dichVu.getGia()*soLuong;
		%>
			<tr>
				<td><%=dichVu.getTenDV() %></td>
				<td><%=soLuong %></td>
				<td><% out.print(""+(int)dichVu.getGia());%></td>
				<td><%=dichVu.getDonViTinh() %></td>
				<td><% out.print(""+(int)(dichVu.getGia()*soLuong));%></td>
			</tr>
		<%} %>
			<tr class="table-info success">
				<td></td>
				<td>tổng tiền:</td>
				<td><%=tongTien+"vnd" %></td>
				<td>
					<form action="" method="post">
						<input type="hidden" name="thanhToan" value="1">
						<input type="submit" src="hinhAnh/mayIn.gif" value="thanh toán">
					</form>
				</td>
			</tr>
			<input type="submit" src="hinhAnh/mayIn.gif" name="thanhToan" value="bbb">
		</tbody>
	</table>
</div>


</body>
</html>