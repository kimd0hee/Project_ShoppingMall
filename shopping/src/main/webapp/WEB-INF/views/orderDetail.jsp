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
	
	<style>
		h2 {
			text-align:center;
			margin:20px;
		}
		
		
		#det_th{
			padding:10px;
		}
		#det_td{
			padding:0px 10px;
		}
		
		#btnWrite,#btnUpdate,#btnDelete {
			background-color:#f8f8f8;
			border:1px solid black;
			border-radius:2px;
			margin:3px 2px;
		}
		

	</style>
	
</head>
<body>
	<div class="container" id="det_con">
    <h2>주문 상세 정보</h2>
    <form name="form" method="post">
    	<table border="1" style="width:100%;">
    		<tr>
                <th id="det_th">주문번호: </th>
				<td id="det_td"><input name="order_id" value="${vo.order_id}" readonly="readonly"></td>
				</tr>
				<tr>
				<th id="det_th">주문자아이디: </th>
				<td id="det_td"><input name="user_id" value="${vo.user_id}" readonly="readonly"></td>
				</tr>
				<tr>
				<th id="det_th">수령자명: </th>
				<td id="det_td"><input name="receive_name" value="${vo.receive_name}"></td>
				</tr>
				<tr>
				<th id="det_th">수령자연락처: </th>
				<td id="det_td"><input name="receive_phone" value="${vo.receive_phone}"></td>
				</tr>
				<tr>
				<th id="det_th">주소: </th>
				<td id="det_td"><input name="order_addr1" value="${vo.order_addr1}">
				<input name="order_addr2" value="${vo.order_addr2}">
				<input name="order_addr3" value="${vo.order_addr3}"></td>
				</tr>
				<tr>
				<th id="det_th">수량: </th>
				<td id="det_td"><input name="order_quantity" value="${vo.order_quantity}" readonly="readonly"></td>
				</tr>
				<tr>
				<th id="det_th">가격: </th>
				<td id="det_td"><input name="order_price" value="${vo.order_price}" readonly="readonly"></td>
				</tr>
				<tr>
				<th id="det_th">메모: </th>
				<td id="det_td"><input name="order_memo" value="${vo.order_memo}"></td>
				</tr>
				</table>
			
			<tr>	
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
    </div>
</body>
</html>