<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세 정보</title>
</head>
<body>
    <h1>주문 상세 정보</h1>
    <table>
        <tr>
            <th>주문번호</th>
            <th>상품번호</th>
            <th>주문자 아이디</th>
            <th>수령자명</th>
            <th>수령자 연락처</th>
            <th>주문일자</th>
            <th>주소1</th>
            <th>주소2</th>
            <th>주소3</th>
            <th>수량</th>
            <th>가격</th>
            <th>메모</th>
        </tr>
            <tr>
                <td>${vo.order_id}</td>
                <td>${vo.product_id}</td>
                <td>${vo.user_id}</td>
                <td>${vo.receive_name}</td>
                <td>${vo.receive_phone}</td>
                <td>${vo.order_date}</td>
                <td>${vo.order_addr1}</td>
                <td>${vo.order_addr2}</td>
                <td>${vo.order_addr3}</td>
                <td>${vo.order_quantity}</td>
                <td>${vo.order_price}</td>
                <td>${vo.order_memo}</td>
            </tr>
    </table>
</body>
</html>