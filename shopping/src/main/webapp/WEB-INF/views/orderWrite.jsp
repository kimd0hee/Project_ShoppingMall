<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    <title>주문 페이지</title>
    <script>
    IMP.init("imp40531637");
    
    function requestPay() {
      IMP.request_pay({
        pg: "html5_inicis.",
        pay_method: "card",
        merchant_uid: "${order_id}",   // 주문번호(DB삽입해야함)
        name: "옷사줘",
        amount:"${map.allSum}",                         // 숫자 타입
        buyer_email: "${user_email}",
        buyer_name: "${user_name}",
        buyer_tel: "${user_phone}",
        buyer_addr: "",
        buyer_postcode: ""
      }, function (rsp) { // callback
        //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
        console.log(rsp);
    	if (rsp.success) {
      	var msg = '결제가 완료되었습니다.';
      	alert(msg);
      	document.form1.action = "${path}/orderInsert.do";
		document.form1.submit();
    	} else {
     	 var msg = '결제에 실패하였습니다.';
      	msg += '에러내용 : ' + rsp.error_msg;
      	alert(msg);
    }
      });
    }
  		function setDisplay(){
  			if($('input:radio[id=card]').is(':checked')){
  				$('#divPay').hide();
  			}else{
  				$('#divPay').show();
  			}
  		}
    </script>
</head>

<body>
    <h2>주문 페이지</h2>
    <br>
    <h3>주문 내역</h3>
              <table border="1">
              <thead>
                  <tr>
                     <th>상품명</th>
                     <th>단가</th>
                     <th>수량</th>
                     <th>금액</th>
                     <th>삭제</th>
                  </tr>
                </thead>
                <tbody>  
                  <c:forEach var="row" items="${map.cartList}" varStatus="i">
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
                        <fmt:formatNumber pattern="###,###,###" value="${row.money}"/>
                     </td>
                     <td>
                         <a href="${path}/cartDelete.do?cart_id=${row.cart_id}">삭제</a>
                     </td>
                  </tr>                  
                  </c:forEach>
                  </tbody>
              </table>

          <form name="form1" id="form1" method="post" action="${path}/orderInsert.do">
          <table>
            <tr>
                <td colspan="5" align="right">
                	총 수량 : <fmt:formatNumber pattern="###,###,###" value="${map.sumTot}"/>
                	<input type ="hidden" name="order_quantity" value="${map.sumTot}">
                	<br>
                    주문 금액 합계 : <fmt:formatNumber pattern="###,###,###" value="${map.sumMoney}"/>
                    <br>배송료 : ${map.fee}
                    <br>전체 주문금액 : <fmt:formatNumber pattern="###,###,###" value="${map.allSum}"/>
                    <input type ="hidden" name="cart_id" value="${cart_id}">
                    <input type ="hidden" name="order_price" value="${map.allSum}">
                 </td>
           </tr>
          </table>
    <hr>
    <h3>주문자 정보 입력</h3>
        <table>
            <tr>
                <td>주문자 이름:</td>
                <td><input type="text" name="receive_name" id="receive_name"></td>
            </tr>
            <tr>
                <td>연락처:</td>
                <td><input type="text" name="receive_phone" id="receive_phone"></td>
            </tr>
            <tr>
                <td>배송 주소:</td>
                <td><input type="text" name="order_addr1" id="order_addr1"></td>
                <td><input type="text" name="order_addr2" id="order_addr2"></td>
                <td><input type="text" name="order_addr3" id="order_addr3"></td>
            </tr>
            <tr>
                <td>주문 메모:</td>
                <td><textarea name="order_memo"></textarea></td>
            </tr>
        </table>
        <hr>
        <h3>결제방식</h3>
        <table>
        	<tr>
               <td>
               <input type="radio" id="card" name="order_pay" value="카드" onchange="setDisplay()" onclick="requestPay()">카드결제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
               <td>
               <input type="radio" id="coin" name="order_pay" value="무통장" onchange="setDisplay()">무통장입금
               <div id="divPay" style="display:none">기업은행: 258-089215-01-017(예금주: 나다온)</div>
               </td>
            </tr>
        </table>
        <hr>
        <tr>
           <td colspan="2" align="center"><input type="button" id="order" value="주문하기"></td>
        </tr>
    </form>
</body>
<script type="text/javascript">
$('#order').on("click", function() {
    
    if ($('#receive_name').val() == '') {
        alert("수령인 이름을 입력하세요.");
        return false;
    }

    if ($('#receive_phone').val() == '') {
        alert("수령인 전화번호를 입력하세요.");
        return false;
    }

    if ($('#order_addr1').val() == '') {
        alert("배송지 주소를 입력하세요.");
        return false;
    }
    
    if ($('#order_addr2').val() == '') {
        alert("배송지 주소를 입력하세요.");
        return false;
    }
    
    if ($('#order_addr3').val() == '') {
        alert("상세 주소를 입력하세요.");
        return false;
    }

    if ($('#receive_name').val() != '' || $('#receive_phone').val() != '' || $('#order_addr1').val() != '') {
        if (confirm("주문 하시겠습니까 ??")) {
            document.getElementById("form1").submit();
        }
    }
});
</script>
<%@ include file="include/footer.jsp" %>
</html>