<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 리스트</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>주문번호</th>
				<th>주문일자</th>
				<th>수령자이름</th>
				<th>주문수량</th>
				<th>주문가격</th>
				<th>주문요청사항</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="order" items="${orderList}">
				<tr>
					<td>${order.order_no}</td>
					<td>${order.order_date}</td>
					<td>${order.recipient_name}</td>
					<td>${order.order_qty}</td>
					<td>${order.order_price}</td>
					<td>${order.order_memo}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>