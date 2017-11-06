<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	
	<!-- add thư viện jquery để js bootstrap chạy được -->
	<script src="js/jquery-3.2.0.min.js" ></script>
	<script src="js/bootstrap.min.js" ></script>
</head>
<body>

	<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
	<form action="CheckTaiKhoan" method="post">
	<input type="hidden" name="checkadmin" value="login">
<!-- 		<legend>Đăng nhập</legend> -->
	
<!-- 		<div class="form-group"> -->
			<label for="">User</label>
			<input type="text" class="form-control" id="" name="nameadmin" placeholder="Input field" value="${user.name}">
			
			<label for="">PassWord</label>
			<input type="password" class="form-control" id="" name="passadmin" placeholder="Input field" value="${user.pass}">
<!-- 		</div> -->
		<input type="submit" value="dangnhap">
		<button type="submit" class="btn btn-primary">Đăng nhập</button>
	</form>
</body>
</html>