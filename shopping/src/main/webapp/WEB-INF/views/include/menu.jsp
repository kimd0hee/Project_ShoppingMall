<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<c:set var="path" value="${pageContext.request.contextPath }"/>


<head>
<meta http-equiv="Context-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style>
	
</style>

</head>

<body>

   

   <!-- Header Section Begin -->
   <header class="header">
      <div class="container-fluid">
         <div class="row">
            <div class="col-xl-3 col-lg-8">
               <div class="header__logo">
                  <a href="${path }/"><img src="img/logo.jpg" width="180" height="60" alt=""></a>
               </div>
            </div>
            <div class="col-xl-5 col-lg-6">
               <nav class="header__menu">
                  <ul>
                     <li></li>
                     <!-- 메뉴 위치 고정 -->
                     <li></li>
                     <!-- 메뉴 위치 고정 -->
                     
                     <li><a href="${path}/">HOME</a></li>
                     <li><a href="${path}/productList.do?productList">ALL</a></li>
                     <li><a href="${path}/productList.do?category=top">TOP</a></li>
                     <li><a href="${path}/productList.do?category=bottom">BOTTOM</a></li>
                     <li><a href="memberboardList.do">MEMBER-BOARD</a></li>
                     <li><a href="${path}/boardList.do">BOARD</a></li>
                     <li><c:if test="${sessionScope.admin_id !=null}"><a href="#">ADMIN</a>
                        <ul class="dropdown">
                           <li><a href="${path}/userList.do">USER</a></li>
                           <li><a href="${path}/productWrite.do">PRODUCT(registration)</a></li>
                        </ul></c:if>
                        </li>
                  </ul>
               </nav>
            </div>
            <div class="col-lg-3">
               <div class="header__right">
                  <div class="header__right__auth">
<c:choose>
    <c:when test="${sessionScope.admin_id != null}">
       ${sessionScope.admin_name}님이 로그인중입니다.
        <a href="${path}/adminLogout.do">로그아웃</a>
    </c:when>
    <c:when test="${sessionScope.user_id != null}">
        ${sessionScope.user_name}님이 로그인중입니다.
        <a href="${path}/logout.do">로그아웃</a>
    </c:when>
    <c:otherwise>
        <a href="${path}/login.do">Login</a>
    </c:otherwise>
</c:choose>
      
                  <a href="${path}/mypageform.do">My page</a>
                  </div>
                  <ul class="header__right__widget">
                     <li><a href="${path}/cartList.do"><span class="icon_bag_alt"></span>
                           </a></li>
                           
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