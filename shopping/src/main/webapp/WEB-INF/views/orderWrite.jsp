<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 페이지</title>
<%@ include file="include/header.jsp" %>
<%@ include file="include/menu.jsp" %>
</head>
<body>
	<div class="container">
		<form name="form1" action="InsertOrder.do" method="post">
		<div>
			<h1 class="page-header">주문정보 확인</h1>
			<h4 style="color: red;">주문자 정보와 배송지가 다른 경우 직접 입력해주세요.</h4>
		</div>
		<div>
			<label>주문하시는 분</label><br>
				<input value="${vo.user_idx}" readonly><br>
			<label>주문 상품</label><br>
				<input value="${vo.product_id}" readonly><br>
			<label>수령인</label><br>
				<input name="recipientName" id="recipientName" placeholder="받는 분 이름"><br>
			<label>연락처</label><br>
				<input name="recipientPhone" id="recipientPhone" placeholder="받는 분 연락처"><br>
			<label>수령 주소</label><br>
				<input name="zipcode" id="zipcode">&nbsp;
				<input type="button" value="우편번호 찾기" onclick="execDaumPostcode();"><br>
				<input name="address" id="address"><br>
				<input name="addressDetail" id="addressDetail" placeholder="상세주소"><br>
			<label>요청사항</label><br>
				<input name="orderMemo" id="orderMemo" placeholder="배송 시 요청사항">
		</div>
		<div>
			<button type="button" id="btnSave">확인</button>
			<button type="reset">취소</button>
		</div>
		</form>
	</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
$(document).ready(function(){
	$("#btnSave").click(function(){
		var recipientName = $("#recipientName").val();
		var recipientPhone = $("#recipientPhone").val();
		var address = $("#address").val();
		if(order_name == ""){
			alert("수령인을 입력하세요");
			document.form1.recipientName.focus();
			return;
		}
		if(order_phone == ""){
			alert("연락처를 입력하세요");
			document.form1.recipientPhone.focus();
			return;
		}
		if(address == ""){
			alert("배송지를 입력하세요");
			document.form1.address.focus();
			return;
		}
		
		document.form1.submit();
	});
});
/*
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var zipcode = data.zonecode; // 우편번호
            var address = data.address; // 기본 주소
            var addressDetail = data.buildingName; // 상세 주소

            // 입력 폼에 우편번호, 기본 주소, 상세 주소를 채움
            document.getElementById('zipcode').value = zipcode;
            document.getElementById('address').value = address;
            document.getElementById('addressDetail').value = addressDetail;
        }
    }).open();
}*/
</script>

</body>
<%@ include file="include/footer.jsp" %>
</html>