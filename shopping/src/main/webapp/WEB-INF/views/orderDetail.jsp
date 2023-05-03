<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="include/header.jsp"%>
<%@ include file="./include/menu.jsp" %>
<title>주문 상세 정보</title>
	<script>
		$(document).ready(function(){
			$("#btnUpdate").click(function(){
				if(confirm("수정하시겠습니까?")){
					document.form.action = "${path}/orderUpdate.do";
					document.form.submit();
				}	
			});
			$("#btnDelete").click(function(){
				if(confirm("삭제하시겠습니까?")){
					document.form.action = "${path}/orderDelete.do";
					document.form.submit();
				}	
			});
			$("#btnWrite").click(function(){
				if(confirm("문의게시판으로 이동하시겠습니까?")){
					document.form.action = "${path}/memberboardList.do";
					document.form.submit();
				}	
			});
		});
	</script>
</head>
<body>
    <h1>주문 상세 정보</h1>
    <form name="form" method="post">
    		<tr>
                <td>주문번호: </td>
				<td><input name="order_id" value="${vo.order_id}" readonly="readonly"></td>
				<br>
				<td>주문 내역</td>
              <table border="1">
                  <tr>
                     <th>상품명</th>
                     <th>단가</th>
                     <th>수량</th>
                     <th>금액</th>
                  </tr>
                  <c:forEach var="row" items="${productList}" varStatus="i">
                  <tr>
                     <td>
                        ${row.product_name}
                     </td>
                     <td style="width:80px" align="right">
                        <fmt:formatNumber pattern="###,###,###" value="${row.product_price}"/>
                     </td>
                     <td>
                        <input type="number" style="width:40px" name="amount" value="${row.amount}" min="1" readonly>
                        <input type="hidden" name="product_id" value="${row.product_id}">
                     </td>
                     <td style="width:100px" align="right">
                        <fmt:formatNumber pattern="###,###,###" value="${row.order_price}"/>
                     </td>
                  </tr>                  
                  </c:forEach>
              </table>
				<td>주문자아이디: </td>
				<td><input name="user_id" value="${vo.user_id}" readonly="readonly"></td>
				<br>
				<td>수령자명: </td>
				<td><input name="receive_name" value="${vo.receive_name}"></td>
				<br>
				<td>수령자연락처: </td>
				<td><input name="receive_phone" value="${vo.receive_phone}"></td>
				<br>
				<td>주소: </td>
				<td><input name="order_addr1" value="${vo.order_addr1}"></td><br>
				<td><input name="order_addr2" value="${vo.order_addr2}"></td><br>
				<td><input name="order_addr3" value="${vo.order_addr3}"></td>
				<br>
				<td>수량: </td>
				<td><input name="order_quantity" value="${vo.order_quantity}" readonly="readonly"></td><br>
				<td>가격: </td>
				<td><input name="order_price" value="${vo.order_price}" readonly="readonly"></td><br>
				<td>메모: </td>
				<td><input name="order_memo" value="${vo.order_memo}"></td><br>
				<td>결제방식: </td>
				<td>${vo.order_pay}</td><br>
				<td>※무통장 입금자 확인※</td><br>
				<td>기업은행: 258-089215-01-017(예금주: 나다온)</td><br>
				<td>주문일자: </td>
				<td>${vo.order_date}</td><br>
            </tr>
            <tr>
			<td colspan="2" align="center">
			<input type="button" id="btnWrite" value="문의하기">
			<c:if test="${sessionScope.admin_id != null}">
				<input type="button" id="btnUpdate" value="수정">
            	<input type="button" id="btnDelete" value="삭제">
            </c:if>
			</td>
		</tr>
    </form>
</body>
</html>