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

	<script type="text/javascript">
		$(document).ready(function() {
	    $('#list').click(function(event){event.preventDefault();$('#products .item').addClass('list-group-item');});
	    $('#grid').click(function(event){event.preventDefault();$('#products .item').removeClass('list-group-item');$('#products .item').addClass('grid-group-item');});
			});
	</script>

	<style type="text/css" media="screen">
			.glyphicon { margin-right:5px; }
		.thumbnail
		{
		    margin-bottom: 20px;
		    padding: 0px;
		    -webkit-border-radius: 0px;
		    -moz-border-radius: 0px;
		    border-radius: 0px;
		}
		
		.item.list-group-item
		{
		    float: none;
		    width: 100%;
		    background-color: #fff;
		    margin-bottom: 10px;
		}
		.item.list-group-item:nth-of-type(odd):hover,.item.list-group-item:hover
		{
		    background: #428bca;
		}
		
		.item.list-group-item .list-group-image
		{
		    margin-right: 10px;
		}
		.item.list-group-item .thumbnail
		{
		    margin-bottom: 0px;
		}
		.item.list-group-item .caption
		{
		    padding: 9px 9px 0px 9px;
		}
		.item.list-group-item:nth-of-type(odd)
		{
		    background: #eeeeee;
		}
		
		.item.list-group-item:before, .item.list-group-item:after
		{
		    display: table;
		    content: " ";
		}
		
		.item.list-group-item img
		{
		    float: left;
		}
		.item.list-group-item:after
		{
		    clear: both;
		}
		.list-group-item-text
		{
		    margin: 0 0 11px;
		}
		
				
	</style>
</head>
<body>


	<!-- import header -->
	<%@ include file="/header.jsp" %>
	
	
	<!--    hiển thị lựa chọn kiểu xem  -->
	  <div class="container">
	    <div class="well well-sm">
	        <strong>Kiểu xem</strong>
	        <div class="btn-group">
	            <a href="#" id="list" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-th-list">
	            </span>List</a> <a href="#" id="grid" class="btn btn-default btn-sm"><span
	                class="glyphicon glyphicon-th"></span>Grid</a>
	        </div>
	    </div>	
	    
	   
	    
	<!--      loading from Database : thong tin các bàn -->
	<%@ page import="java.util.ArrayList,dangnhap.business.Ban,dangnhap.data.BanDB" %>
	<%
		ArrayList<Ban>banArr = new ArrayList<>();
		banArr = BanDB.getThongTinBan();
	%>
	 <div id="products" class="row list-group">
	 <%	for(int i=0;i<banArr.size();i++)
	 	{
	 %>
	        <div class="item  col-xs-4 col-lg-4">
	            <div class="thumbnail">
	            <%
	            
	            	Ban ban = banArr.get(i);
	            
	            	int maBan = ban.getMaBan();
	            	int trangThaiCuaBan = ban.getTrangThai();
	            	String tenBan = ban.getTenBan();
	            	
	            	String trangThai = "";
	            	String urlImage = "";
	            	if(trangThaiCuaBan==0){
	            		trangThai = "hiện bàn này chưa có khách";
	            		urlImage ="hinhanh/lucchuacokhach.jpg";
	            	}
	            	else{
	            		trangThai ="đã có khách ngồi";
	            		urlImage ="hinhanh/luccokhach.jpg";
	            	}
	            	//nếu chưa chọn, cứ setAttribute
	            	session.setAttribute("maBan", maBan);
	            %>
	                <img class="group list-group-image" src="<%=urlImage %>" alt="" />
	                <div class="caption">
	                    <h2 class="group inner list-group-item-heading">
	                    	<%=tenBan %>    
	                    </h2>
	                    <p class="group inner list-group-item-text">
	                        <%=trangThai%>
	                     </p>
	                    <div class="row">
	                        <div class="col-xs-12 col-md-6">
	                            <p class="lead">
	                                <%=ban.getMaBan() %></p>
	                        </div>
	                        <div class="col-xs-12 col-md-6">

							<form action="DichVu" method="get">
								<input type="hidden" name="maBan" value="<%=ban.getMaBan() %>">
								<input type="hidden" name="tenBan" value="<%=ban.getTenBan()%>">
								<input type="hidden" name="trangThai" value="<%=ban.getTrangThai() %>"> 
								<input class="btn btn-success" type="submit" value="goiBan">
							</form>
	                  
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <% } %>
	  </div>

</body>
</html>