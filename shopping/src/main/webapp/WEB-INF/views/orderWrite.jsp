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
    
    <style>
    	 a:link { color:black; text-decoration: none;}
    	a:visited {color:black; text-decoration: none;}
    	a:hover {color:black; text-decoration: none;}
    	
    	
    
    	table {
    		text-align:center;
    		width:100%;
    	}
    	
    	#cart_tb {
    		
    		border:1px solid black;
    		border-collapse:separate;
  			border-spacing: 0;
  			border-radius:7px;
    	}
    	
    	#cart_th {
    		padding:8px 0px;
    		background-color:#f8f8f8;
    		border-bottom:1px solid black;
    		border-collapse:separate;
 		    border-spacing: 0;
 		    border-radius:7px 7px 0 0;
    	}
    	
    	#cart_td {
    		padding:10px 0px;
    		border-bottom: 1px solid #D8D8D8;
    	}
    	
    	#order_tb {
    		margin-top:30px;
    		height:50%;
    	}
    	
    	#order_tb1{
    		margin-top:10px;
    		text-align:right;
    		float:right;
    		box-sizing: border-box;
    		width:230px;
    		
    	}
    	
    	#order_con {
    		border:1px solid black;
    	}
    	
    	.container {
    		margin:0 auto;
    	}
    	
    	input {
    	/*	border:none; */
    		text-align:center;
    	}
    	
    	#info_tb {
    		width:100%;
    		
    	}
  	
    	#info_tr{
    		border-bottom:1px solid black;
    		padding:10px 0px;
    		border-left:1px solid black;
    		border-right:1px solid black;
    	}
    	
    	#info_th {
    	}
    	
    	#info_td {
    		width:75%;
    		padding: 10px 0px; 
    	}
    	
    	.add_td {
    		
    	}
    	
    	h2{
    		text-align:center;
    		padding:17px 0px;
    		border-bottom:1px solid #E6E6E6;
    	}
    	
    	h3 {
    		text-align:center;
    		padding-bottom:10px;
    	}
    	
    	#radio_btn {
    		vertical-align: middle;
    	}
    	
		.ra_btn1 {
			padding-right:17px;
			text-align:center
		}
		.ra_btn2 {
		}
		
		#order_btn {
			float:right;
			padding-right:15px;
			
		}
		
		.btn_style{
			border-radius:3px;
			padding:5px;
			background-color:#333;
			color:#fff;
			border:none;
		}
		
		.cart_del{
			border:1px solid black;
			background-color:#333;
			color:#fff;
			padding:7px 10px;
			border-radius:5px;
			border:none;
		}
		
		#order_addr2{
			margin:5px 0px;
		}
		
		#info_tb td {
			padding-right:10px;
			text-align:left;
		}
		
		a[type=button]{
		color:white;
		}

    </style>
    
</head>

<body>

	<div class="container" id="order_tb"> <!-- 주문내역 -->
    	<h3>주문 결제</h3>
              <table id="cart_tb">
                  <tr class="order_tr">
                     <th id="cart_th">상품명</th>
                     <th id="cart_th">단가</th>
                     <th id="cart_th">수량</th>
                     <th id="cart_th">금액</th>
                     <th id="cart_th">삭제</th>
                  </tr>
                  <c:forEach var="row" items="${cartList}" varStatus="i">
                  <tr class="order_tr">
                     <td id="cart_td">
                        ${row.product_name}
                     </td>
                     <td style="width:80px" id="cart_td">
                        <fmt:formatNumber pattern="###,###,###" value="${row.product_price}"/>
                     </td>
                     <td id="cart_td">
                        <input type="number" style="width:40px; border:none; text-align:right;" name="amount" value="${row.amount}" min="1" readonly>
                        <input type="hidden" name="product_id" value="${row.product_id}">
                     </td>
                     <td style="width:100px" id="cart_td">
                        <fmt:formatNumber pattern="###,###,###" value="${row.money}"/>
                     </td>
                     <td id="cart_td" style="width:20%;">
                         <a type="button" class="cart_del" href="${path}/cartDelete.do?cart_id=${row.cart_id}">삭제</a>
                     </td>
                  </tr>                  
                  </c:forEach>
              </table>
          <form name="form1" id="form1" method="post" action="${path}/orderInsert.do">

          <table id="order_tb1">
            <tr>
                <td>총 수량 : 
                <fmt:formatNumber pattern="###,###,###" value="${map.sumTot}"/>
                	<input type ="hidden" name="order_quantity" value="${map.sumTot}">
                </td>	
             </tr>
             <tr>   	
                    <td>주문 금액 합계 : 
                    <fmt:formatNumber pattern="###,###,###" value="${map.sumMoney}"/></td>
             </tr>
             <tr>       
                    <td>배송료 : 
                    ${map.fee}</td>
             </tr>
             <tr>       
                    <td>전체 주문금액 : 
                    <fmt:formatNumber pattern="###,###,###" value="${map.allSum}"/>
                    <input type ="hidden" name="cart_id" value="${cart_id}">
                    <input type ="hidden" name="order_price" value="${map.allSum}"></td>
           </tr>
          </table> 
    <!--     <div class="cart-total-price" >
                <div class="cart-total-price__inner">
                    <div id="price">
                       총 수량 : <fmt:formatNumber pattern="###,###,###" value="${map.sumTot}"/> 
                	<input type ="hidden" name="order_quantity" value="${map.sumTot}">
                       주문 금액 합계 : <fmt:formatNumber pattern="###,###,###" value="${map.sumMoney}"/>

                        
                      배송료 : ${map.fee}
                        
                       전체 주문금액 : <fmt:formatNumber pattern="###,###,###" value="${map.allSum}"/>
                    <input type ="hidden" name="cart_id" value="${cart_id}">
                    <input type ="hidden" name="order_price" value="${map.allSum}">
                    </div>   
                </div> 
            </div> -->
          </div> <!-- 주문내역 END -->
        
    <hr>
    <div class="container" id="info_con">
    <h3>주문 정보 입력</h3>
        <table id="info_tb">
            <tr id="info_tr" style="border-top:1px solid black;">
                <th id="info_th">받는분 이름:</th>
                <td id="info_td"><input class="col-md-6" type="text" name="receive_name" id="receive_name"></td>
            </tr>
            <tr id="info_tr">
                <th id="info_th">연락처:</th>
                <td id="info_td"><input class="col-md-6" type="text" name="receive_phone" id="receive_phone"></td>
            </tr>
            <tr id="info_tr">
                <th id="info_th">배송 주소:</th>
                <td id="info_td" class="add_td" style="height:50px; padding-right:10px;">
                <input class="col-md-6" type="text" name="order_addr1" id="order_addr1">
                <input class="col-md-6" type="text" name="order_addr2" id="order_addr2">
                <input class="col-md-6" type="text" name="order_addr3" id="order_addr3"></td>
            </tr>
            <tr id="info_tr">
                <th id="info_th">주문 메모:</th>
                <td id="info_td"><textarea name="order_memo" rows="7" cols="35"></textarea></td>
            </tr>
        </table>
        </div>
        <hr>
        <div class="container" id="ra_con_bt">
        <h3>결제방식</h3>
        <table id="radio_btn">
        	<tr>
               <td class="ra_btn1">
               <input type="radio" id="card" name="order_pay" value="카드" onchange="setDisplay()" onclick="requestPay()" >카드결제</td>
          
            </tr>
            <tr>
             <td class="ra_btn2">
               <input type="radio" id="coin" name="order_pay" value="무통장" onchange="setDisplay()">무통장입금
               <div id="divPay" style="display:none">기업은행: 258-089215-01-017(예금주: 나다온)</div>
               </td>
               </tr>
        </table>
        <div id="order_btn">
           	<td colspan="2"><input class="btn_style" type="button" id="order" value="주문하기"></td>
           	</div>
           	<br>
           	<hr>
        </div>
      
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