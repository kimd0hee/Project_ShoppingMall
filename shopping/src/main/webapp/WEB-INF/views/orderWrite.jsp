<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="UTF-8">

<head>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    <title>주문 페이지</title>
</head>

<body>
    <h2>주문 페이지</h2>
    <h3>주문 내역</h3>
    <table border="1">
        <tr>
            <th>상품명</th>
            <th>단가</th>
            <th>수량</th>
            <th>금액</th>
        </tr>
        <c:forEach var="row" items="${cartList}">
            <tr>
                <td>${row.product_name}</td>
                <td style="width:80px" align="right"><fmt:formatNumber pattern="###,###,###" value="${row.product_price}"/></td>
                <td>${row.amount}</td>
                <td style="width:100px" align="right"><fmt:formatNumber pattern="###,###,###" value="${row.money}"/></td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="4" align="right">총 주문 금액 : <fmt:formatNumber pattern="###,###,###" value="${map.allSum}"/></td>
        </tr>
    </table>
    <hr>
    <h3>주문자 정보 입력</h3>
    <form name="orderForm" id="orderForm" method="post" action="${path}/orderInsert.do">
        <table>
			<input type="hidden" name="order_id">
            <tr>
                <td>주문자 이름:</td>
                <td><input type="text" name="receive_name"></td>
            </tr>
            <tr>
                <td>연락처:</td>
                <td><input type="text" name="receive_phone"></td>
            </tr>
            <tr>
                <td>배송 주소:</td>
                <td><input type="text" name="order_addr1"></td>
                <td><input type="text" name="order_addr2"></td>
                <td><input type="text" name="order_addr3"></td>
            </tr>
            <tr>
                <td>주문 메모:</td>
                <td><textarea name="memo"></textarea></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="주문하기"></td>
            </tr>
        </table>
        <br>
        <button type="submit">주문 완료</button>
    </form>
</body>

<%@ include file="include/footer.jsp" %>
</html>