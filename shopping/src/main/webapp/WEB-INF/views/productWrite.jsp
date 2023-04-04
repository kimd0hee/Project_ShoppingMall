<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<%@ include file="include/header.jsp" %>
</head>
<body>
<%@ include file="include/menu.jsp" %>
<br>
<form name="form" method="post" action="${path}/insertProduct.do">
 	<table border="1" width="400px">
 		<tr>
 			<td>분류</td>
 			<td><input type="checkbox" name="product_category" value="ALl">전체
 				<input type="checkbox" name="product_category" value="남성">남성
 				<input type="checkbox" name="product_category" value="여성">여성
 			</td>
		</tr>
		<tr>
 			<td>상품명</td>
 			<td><input name="product_name"></td>
 		</tr>
		<tr>
 			<td>가격</td>
 			<td><input name="product_price"></td>
 		</tr>
		<tr>
 			<td>색상</td>
 			<td><input name="product_color"></td>
 		</tr> 		
		<tr>
 			<td>사이즈</td>
 			<td><input name="product_size"></td>
 		</tr>
 		<tr>
 			<td>상품 정보</td>
 			<td><textarea name="product_desc" placeholder="상품 정보를 입력하세요"></textarea>
 		</tr>
		<tr>
 			<td>수량</td>
 			<td><input name="product_quantity" placeholder="수량을 입력하세요"></td>
 		</tr>
 		<tr>
 			<td colspan="1" align="center">
 				<input type="submit" value="상품 등록">
 			</td>
 		</tr>
 	</table>
    </form>
</body>
</html>