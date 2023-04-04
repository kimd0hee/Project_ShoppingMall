<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보</title>
<%@ include file="include/header.jsp" %>
<script>
$(document).ready(function)(){
	$("#btnUpdate").click(function(){
		if(confirm("수정하시겠습니까?")){
			document.form.action = "${path}/updateProduct.do";
			document.form.submit();
		}
	});
});
$(document).ready(function)(){
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form.action = "${path}/deleteProduct.do";
			document.form.submit();
		}
	});
});
</script>
</head>
<body>
<%@ include file="include/menu.jsp" %>
	<h2>상품정보 상세</h2>
	<form name="form" method="post">
		<table border="1" width="400px">
			<tr>
				<td>상품번호</td>
				<td><input name="product_id" value="${dto.product_id}" readonly="readonly">
			</tr>
			<tr>
				<td>분류 </td>
				<td><input name="product_category" value="${dto.product_category}">
			</tr>
			<tr>
				<td>상품명</td>
				<td><input name="product_name" value="${dto.product_name}">
			</tr>
			<tr>
				<td>가격</td>
				<td><input name="product_price" value="${dto.product_price}">
			</tr>
			<tr>
				<td>색상</td>
				<td><input name="product_color" value="${dto.product_color}">
			</tr>
			<tr>
				<td>사이즈</td>
				<td><input name="product_size" value="${dto.product_size}">
			</tr>
			<tr>
				<td>주소</td>
				<td><input name="user_address1" value="${dto.user_address1}" >
			</tr>
			<tr>
				<td>정보</td>
				<td><input name="product_desc" value="${dto.product_desc}"></td>
			</tr>
			<tr>
				<td>재고</td>
				<td><input name="product_stock" value="${dto.product_stock}"></td>
			</tr>
			<tr>
				<td>조회수</td>
				<td><input name="product_view" value="${dto.product_view}"></td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input name="product_quantity" value="${dto.product_quantity}"></td>
			</tr>
			<tr>
				<td>배송비</td>
				<td><input name="product_delivery_price" value="${dto.product_delivery_price}"></td>
			</tr>
			<tr>
				<td>추천</td>
				<td><input name="product_recommend" value="${dto.product_recommend}"></td>
			</tr>												
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수정" id="btnUpdate">
					<input type="button" value="삭제" id="btnDelete">
					<div style="color: red;">${message}</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>