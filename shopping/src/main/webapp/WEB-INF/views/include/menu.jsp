<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<c:set var="path" value="${pageContext.request.contextPath }"/>


<head>
<meta http-equiv="Context-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

</head>

<body>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Offcanvas Menu Begin -->
	<div class="offcanvas-menu-overlay"></div>
	<div class="offcanvas-menu-wrapper">
		<div class="offcanvas__close">+</div>
		<ul class="offcanvas__widget">
			<li><span class="icon_search search-switch"></span></li>
			<li><a href="#"><span class="icon_heart_alt"></span>
					<div class="tip">2</div> </a></li>
			<li><a href="#"><span class="icon_bag_alt"></span>
					<div class="tip">2</div> </a></li>
		</ul>
		<div class="offcanvas__logo">
			<a href=""><img src="img/logo.jpg" alt=""></a>
		</div>
		<div id="mobile-menu-wrap"></div>
		<div class="offcanvas__auth">
		<c:choose>
			<c:when test="${sessionScope.userId == null }">
				<a href="${path}/login.do">Login</a>
			</c:when>
			<c:otherwise>
				${sessionScope.userName}님이 로그인중입니다.
				<a href="${path}/member/logout.do">로그아웃</a>
			</c:otherwise>
		</c:choose>
				<a href="mypageform">My page</a>
		</div>
	</div>
	<!-- Offcanvas Menu End -->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xl-1 col-lg-1">
					<div class="header__logo">
						<a href="/"><img src="img/logo.jpg" alt=""></a>
					</div>
				</div>
				<div class="col-xl-6 col-lg-7">
					<nav class="header__menu">
						<ul>
							<li></li>
							<!-- 메뉴 위치 고정 -->
							<li></li>
							<!-- 메뉴 위치 고정 -->
							<li><a href="allform">All</a></li>
							<li><a href="newform">NEW</a></li>
							<li><a href="hotform">HOT</a></li>
							<li><a href="saleform">SALE</a>
							<li><a href="eventform">EVENT</a>
								<ul class="dropdown">
									<li><a href="#">응모 이벤트</a></li>
									<li><a href="#">당첨자 발표</a></li>
									<li><a href="#">당첨 후기</a></li>
								</ul></li>
							<li><a href="${path}/boardList.do">CS CENTER</a></li>
							<li><a href="${path}/userList.do">회원관리</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="header__right">
						<div class="header__right__auth">
							<a href="loginform">Login</a> <a href="mypageform">My page</a>
						</div>
						<ul class="header__right__widget">
							<li><span class="icon_search search-switch"></span></li>
							<li><a href="keepform"><span class="icon_heart_alt"></span>
									<div class="tip">2</div> </a></li>
							<li><a href="cartform"><span class="icon_bag_alt"></span>
									<!-- cartform -->
									<div class="tip">2</div> </a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="canvas__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->
</body>
</html>	
</body>
</html>