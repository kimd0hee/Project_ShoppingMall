<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="UTF-8">

<head>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    <title>주문 페이지</title>
    <script>
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
                  <tr>
                     <th>상품명</th>
                     <th>단가</th>
                     <th>수량</th>
                     <th>금액</th>
                     <th>삭제</th>
                  </tr>
                  <c:forEach var="row" items="${cartList}" varStatus="i">
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
                    <input type="hidden" name="product_id" value="${row.product_id}">
                    <input type="hidden" name="product_name" value="${row.product_name}">
                    <input type ="hidden" name="order_price" value="${map.allSum}">
                 </td>
           </tr>
          </table>
    <hr>
    <h3>주문자 정보 입력</h3>
        <table>
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
                <td><textarea name="order_memo"></textarea></td>
            </tr>
        </table>
        <hr>
        <h3>결제방식</h3>
        <table>
        	<tr>
               <td>
               <input type="radio" id="card" name="order_pay" value="카드" onchange="setDisplay()">카드결제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
               <td>
               <input type="radio" id="coin" name="order_pay" value="무통장" onchange="setDisplay()">무통장입금
               <div id="divPay" style="display:none">기업은행: 258-089215-01-017(예금주: 나다온)</div>
               </td>
            </tr>
        </table>
        <hr>
        <tr>
          <td colspan="2" align="center"><input type="submit" value="주문하기"></td>
        </tr>
    </form>
</body>

<%@ include file="include/footer.jsp" %>
</html>