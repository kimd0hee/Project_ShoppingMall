<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>상품 관리</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="include/header.jsp" %>
</head>
<body>
<%@ include file="include/menu.jsp" %>
<section>
	<div class="container mt-3">
	  <h2>상품 관리</h2>       
	  <table class="table table-striped">
	    <thead>
	      <tr>
	      	<th>상품번호</th>
	        <th>상품명</th>
	        <th>카테고리</th>
	        <th>사이즈</th>
	        <th>컬러</th>
	        <th>가격</th>
	      </tr>
	    </thead>
	    <tbody>
	    <c:forEach items="${list}" var="row">
	      <tr>
	      	<td><a href="${path}/viewProduct.do?product_id=${row.product_id}">${row.product_id}</a></td>
	        <td>${row.product_name}</td>
	        <td>${row.product_category}</td>
	        <td>${row.product_size}</td>
	        <td>${row.product_color}</td>
	        <td>${row.product_price}</td>
	      </tr>
	      </c:forEach>
	    </tbody>
	  </table>
	  <input type="button" value="상품등록" onclick="location.href='${path}/productWrite.do'">
	</div>
</section>
</body>
</html>