<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
	<!-- Slide -->
	<div id="demo" class="carousel slide" data-ride="carousel">
	
		<!-- Indicators -->
		<ul class="carousel-indicators">
			<c:forEach var="a" items="${ads}" begin="0" varStatus="status">
				<c:choose>
					<c:when test="${status.index == 0}">
						<li data-target="#demo" data-slide-to="${status.index}" class="active"></li>
					</c:when>
					<c:when test="${status.index >0}">
						<li data-target="#demo" data-slide-to="${status.index}"></li>
					</c:when>
				</c:choose>
			</c:forEach>
		</ul>

		<!-- The slideshow -->
		<div class="carousel-inner">
			<c:forEach var="a" items="${ads}" begin="0" varStatus="status">
				<c:choose>
					<c:when test="${status.index == 0}">
						<div class="carousel-item active">
						<img src="./images/slide/honda2.jpg"
							style="width: 100%; height: 600px">
					</div>
					</c:when>
					<c:when test="${status.index >0}">
						<div class="carousel-item">
						<img src="./images/slide/honda3.jpg"
							style="width: 100%; height: 600px">
					</div>
					</c:when>
				</c:choose>
			</c:forEach>
		</div>

		<!-- Left and right controls -->
		<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span
			class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>