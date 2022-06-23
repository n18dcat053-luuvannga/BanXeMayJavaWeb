<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>WEB BÁN XE MÁY</title>
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
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="slide.jsp"></jsp:include>

	<div style="margin-top: 40px; margin-bottom: 20px">
		<h2 style="color: red; text-align: center;">
		LỰA CHỌN PHONG CÁCH RIÊNG CỦA BẠN
		</h2>
	</div>
	<br/>
	
	<c:forEach var="t" items="${types}">
		<div style="margin-bottom: 10px">
			<h2 style="margin-left: 80px; color: #007bff; margin-bottom: 10px; text-transform: uppercase; margin-top: 50px">${t}</h2>
			<!-- <div
				style="border-bottom: 2px solid #007bff; margin-left: 80px;; width: 87%">
			</div> -->
		</div>
		<c:forEach var="b" items="${brands}">
			<div
				style="border-bottom: 2px solid #007bff; margin-left: 80px; width: 87%">
			</div>
			<div style="margin-bottom: 20px;margin-top:15px">
				<img src="./images/logo/${b.logo}"
				style="height: 40px; margin-left: 120px;"> <b style="font-size:25px; color: red;">${b.name}</b>
				<br/>
			</div>
			
			<div class="container-fluid" style="margin-bottom: 20px">
  				<div class="row">
  					<c:forEach var="p" items="${products}">
						<c:if test="${p.type == t && p.brand.name == b.name}">
							<div class="col-3 bottom" title="${p.name}">
								<img style="width: 300px; height: 200px; margin-left: 50px" src="./images/${p.image}">
								<p style="text-align: center; font-size: 20px; font-weight: bold; color: red">${p.name}</p>
								<p style="text-align: center; font-size: 15px">
									Giá:<b> <f:formatNumber minFractionDigits = "0" value="${p.price}" type="number"/> ₫</b>
								</p>
								<a href="home/${p.id}.htm" class="btn btn-warning" role="button" style="margin-left: 133px; width: 36.5%; border-radius: 20px;">
									Xem chi tiết</a>
							</div>
						</c:if>
					</c:forEach>
  				</div>
			</div>	
		</c:forEach>
	</c:forEach>
	
	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include> // add footer vao jsp
	

	<!-- 	thư viện    -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="https://kit.fontawesome.com/66b27f5cfd.js"
		crossorigin="anonymous"></script>
</body>
</html>