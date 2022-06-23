<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Website Bán Phụ Tùng Xe Máy</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../style.css">
<base href="${pageContext.servletContext.contextPath}/">
<style>
.img {
	width: 300px;
	height: 190px;
	margin-left: 58px;
}

.bottom {
	margin-bottom: 20px;
}
</style>

</head>
<body>
	<nav class="navbar navbar-expand-sm bg-danger navbar-danger">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link " href="home/index.htm"
				style="color: white; background-color: #9e1623"><i
					class="fas fa-motorcycle"></i><b> TRANG CHỦ</b></a>
			</li>
			<li class="nav-item dropdown">
			<a
				class="nav-link dropdown-toggle duy1" href="#" id="navbardrop"
				data-toggle="dropdown" style="color: white; margin-left: 20px">
					<b>SẢN PHẨM</b>
			</a>
				<div class="dropdown-menu">
					<c:forEach var="b" items="${brands}">
						<a class="dropdown-item duy2" href="home/finding/${b.id}.htm"><img
							src="./images/logo/${b.logo}" style="height: 25px; width: 50px">
							<b>${b.name}</b>
						</a>
						<hr>
					</c:forEach>
				</div>
			</li>
			<li class="nav-item" style="margin-left: 10px">
				<!-- 	Thanh tìm kiếm  -->
				<form class="form-inline" action="home/search.htm">
					<input class="form-control mr-sm-2" name="search"
								style="width: 350px" type="text" placeholder="Tìm kiếm sản phẩm...">
					<button class="btn btn-success" type="submit"><i class="fas fa-search"></i> Tìm kiếm</button>
				</form>
			</li>
		</ul>
		
		<c:if test="${isLogin == false}">
			<ul class="navbar-nav" style="margin-left: 750px">
				<li class="nav-item"><a class="nav-link duy1" href="home/login.htm" 
															style="color: white; margin-right: 5px">		
					<i class="far fa-user"></i> Đăng nhập</a> 
				</li>	
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link duy1" href="home/register.htm" 
															style="color: white; margin-right: 5px">		
					<i class="far fa-user"></i> Đăng Ký</a> 
				</li>
				<!-- Dropdown -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle duy1" href="#" id="navbardrop"
					data-toggle="dropdown" style="color: white"><i
						class="fas fa-globe"></i> Ngôn ngữ </a>
					<div class="dropdown-menu">
						<a class="dropdown-item duy2" href="#"><img
							src="./images/logo/vietnam.png" style="height: 20px;"> Tiếng
							Việt</a> <a class="dropdown-item duy2" href="#"><img
							src="./images/logo/uk.jpg" style="height: 15px;"> English</a>
					</div></li>	
			</ul>
			
		</c:if>
		
		<c:if test="${isLogin == true}">
			<ul class="navbar-nav" style="margin-left: 800px">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle duy1" href="#" id="navbardrop"
					data-toggle="dropdown" style="color: white"><i
						class="far fa-user"></i> ${sessionScope.user.getLastname()} ${sessionScope.user.getFirstname()} </a>
					<div class="dropdown-menu" style="font-size: 18px;">
						<a class="dropdown-item duy2" href="#" data-toggle="modal" data-target="#myModal"> Thông tin của tôi</a>
						<hr>
						<a class="dropdown-item duy2" href="home/mycart.htm" ><i class="fas fa-shopping-cart"></i> Đơn hàng của tôi</a> 
						<hr>
						<a class="dropdown-item duy2" href="home/logout.htm" ><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
					</div>
				</li>
			</ul>
		</c:if>
	</nav>
	
	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header" style="background-color: #dc3545; color: white;">
					<h4 class="modal-title">Thông tin cá nhân</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body" style="font-size: 20px;">Họ tên: ${sessionScope.user.getLastname()} ${sessionScope.user.getFirstname()}</div>
				<div class="modal-body" style="font-size: 20px;">Số điện thoại: ${sessionScope.user.getPhone()}</div>
				<div class="modal-body" style="font-size: 20px;">Email: ${sessionScope.user.getEmail()}</div>
				<div class="modal-body" style="font-size: 20px;">Địa chỉ: ${sessionScope.user.getAddress()}</div>
				<div class="modal-body" style="font-size: 20px;"><a href="home/changepass.htm">Thay đổi mật khẩu</a></div>
				

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
				</div>

			</div>
		</div>
	</div>
	</body>
	</html>