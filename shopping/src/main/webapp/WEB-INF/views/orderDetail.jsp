<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세 정보</title>
</head>
	<script>
		$(document).ready(function(){
			$("#btnUpdate").click(function(){
				if(confirm("수정하시겠습니까?")){
					document.form.action = "orderUpdate.do";
					document.form.submit();
				}	
			});
		});
		
		$(document).ready(function(){
			$("#btnDelete").click(function(){
				if(confirm("삭제하시겠습니까?")){
					document.form.action = "orderDelete.do";
					document.form.submit();
				}	
			});
		});	
	</script>
<body>
    <h1>주문 상세 정보</h1>
    <form name="form" method="post">
                <td>주문번호</td>
				<td><input name="order_id" value="${vo.order_id}" readonly="readonly"></td>
				<br>
				<td>상품번호</td>
				<td><input name="product_id" value="${vo.product_id}" readonly="readonly"></td>
				<br>
				<td>주문자아이디</td>
				<td><input name="user_id" value="${vo.user_id}" readonly="readonly"></td>
				<br>
				<td>수령자명</td>
				<td><input name="receive_name" value="${vo.receive_name}"></td>
				<br>
				<td>수령자연락처</td>
				<td><input name="receive_phone" value="${vo.receive_phone}"></td>
				<br>
				<td>주소</td>
				<td><input name="order_addr1" value="${vo.order_addr1}"></td><br>
				<td><input name="order_addr2" value="${vo.order_addr2}"></td><br>
				<td><input name="order_addr3" value="${vo.order_addr3}"></td>
				<br>
				<td>수량</td>
				<td><input name="order_quantity" value="${vo.order_quantity}" readonly="readonly"></td><br>
				<td>가격</td>
				<td><input name="order_price" value="${vo.order_price}" readonly="readonly"></td><br>
				<td>메모</td>
				<td><input name="order_memo" value="${vo.order_memo}"></td><br>
				<td>주문일자</td>
				<td>${vo.order_date}</td>
            </tr>
            <tr>
			<td colspan="2" align="center">
				<input type="button" value="수정" id="btnUpdate">
				<input type="button" value="삭제" id="btnDelete">
			</td>
		</tr>
    </form>
</body>
</html>