<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="include/header.jsp" %>
<%@ include file="./include/menu.jsp" %>
<title>주문 내역</title>
</head>
<body>
	<h1>주문 내역</h1>
	<table>
		<thead>
			<tr>
				<th>주문번호</th>
				<th>상품번호</th>
				<th>주문회원</th>
				<th>주문수량</th>
				<th>주문가격</th>
				<th>주문일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="order" items="${orderList}">
				<tr>
					<td><a href="${path}/orderDetail${order.order_id}">${order.order_id}</a></td>
					<td>${order.product_id}</td>
					<td>${order.user_id}</td>
					<td>${order.order_quantity}</td>
					<td>${order.order_price}</td>
					<td>${order.order_date}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
<%@ include file="include/footer.jsp" %>
</html>