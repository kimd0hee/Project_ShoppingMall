<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="UTF-8">

<head>
	<%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    <title>상품 장바구니 목록</title>
    <script>
       $(document).ready(function() {
          $("#btnList").click(function() {
             location.href="${path}/productList.do";
         });
    });
    </script>
    
   <style>
		 a:link { color:black; text-decoration: none;}
	 a:visited {color:black; text-decoration: none;}
	 a:hover {color:dark; text-decoration: none;}

	table, td, th {
    border-collapse : collapse;
    border : 1px solid black;
    border-collapse: collapse;
    
	};
	

	body{
    margin-top:20px;
    background:#eee;
}


#cart {
	background-color: #fff;
	
}

.ui-product-color {
    display: inline-block;
    overflow: hidden;
    margin: .144em;
    width: .875rem;
    height: .875rem;
    border-radius: 10rem;
    -webkit-box-shadow: 0 0 0 1px rgba(0,0,0,0.15) inset;
    box-shadow: 0 0 0 1px rgba(0,0,0,0.15) inset;
    vertical-align: middle;
}

#total {
	 text-align:right;
}  



	
   </style>
   
   
   
</head>

<body>

<div class="container px-3 my-5 clearfix" style="text-align:center; margin:0 auto;">
    <!-- Shopping cart table -->
    <div class="card">
        <div class="card-header" id="cart">
            <h2>장바구니 목록</h2>
        </div>
        <c:choose>
         <c:when test="${map.count==0}">
            장바구니가 비었습니다.
         </c:when>
         <c:otherwise>
          <form name="form1" id="form1" method="post" action=${path}/cartUpdate.do>
        <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered m-0">
                <thead class="thead-dark">
                  <tr>
                    <!-- Set columns width -->
                    <th>상품명</th>
                     <th>단가</th>
                     <th>수량</th>
                     <th>금액</th>
                     <th>삭제</th>
                  </tr>
                </thead>
                <tbody>
        
                  <c:forEach var="row" items="${map.list}" varStatus="i">
                  <tr>
                     <td>
                        ${row.product_name}
                     </td>
                     <td style="width:80px" align="right">
                        <fmt:formatNumber pattern="###,###,###" value="${row.product_price}"/>
                     </td>
                     <td>
                        <input type="number" style="width:40px" name="amount" value="${row.amount}" min="1">
                        <input type="hidden" name="product_id" value="${row.product_id}">
                     </td>
                     <td style="width:100px" align="right">
                        <fmt:formatNumber pattern="###,###,###" value="${row.money}"/>
                     </td>
                     <td>
                        <a href="${path}/cartDelete.do?cart_id=${row.cart_id}">X</a>
                     </td>
                  </tr>                  
                  </c:forEach>
                  
                </tbody>
                
              </table>
            </div>
            </div>
            <input type="hidden" name="count" value="${map.count}">
                
         </form>   
          </c:otherwise>
      </c:choose>        
            <!-- / Shopping cart table -->

             
            <div class="float-right">
              <button type="button" class="btn btn-lg btn-primary mt-2" id="btnList">계속 쇼핑하기</button>
              <button type="submit" id="btnUpdate" class="btn btn-lg btn-primary mt-2" >수정</button>
            </div>
         <div id="total"> <!-- 금액 오른쪽 정렬하는 아이디 생성 -->
                <div class="text-right mt-4">
                   장바구니 금액 합계 : <fmt:formatNumber pattern="###,###,###" value="${map.sumMoney}"/><br>
                   배송료 : ${map.fee}<br>
                    전체 주문금액 : <fmt:formatNumber pattern="###,###,###" value="${map.allSum}"/>
                </div>
                
              </div>
          </div>
      </div>

          

<!-- <div style="text-align:center; margin:0 auto;">
   <h2>장바구니 확인</h2>
   </div>
      <c:choose>
         <c:when test="${map.count==0}">
            장바구니가 비었습니다.
         </c:when>
         <c:otherwise>
            <form name="form1" id="form1" method="post" action=${path}/cartUpdate.do>
               <table border="1" style="">
                  <tr>
                     <th>상품명</th>
                     <th>단가</th>
                     <th>수량</th>
                     <th>금액</th>
                     <th>취소</th>
                  </tr>
                  <c:forEach var="row" items="${map.list}" varStatus="i">
                  <tr>
                     <td>
                        ${row.product_name}
                     </td>
                     <td style="width:80px" align="right">
                        <fmt:formatNumber pattern="###,###,###" value="${row.product_price}"/>
                     </td>
                     <td>
                        <input type="number" style="width:40px" name="amount" value="${row.amount}" min="1">
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
                  <tr>
                     <td colspan="5" align="right">
                        장바구니 금액 합계 : <fmt:formatNumber pattern="###,###,###" value="${map.sumMoneyCart}"/><br>
                        배송료 : ${map.fee}<br>
                        전체 주문금액 : <fmt:formatNumber pattern="###,###,###" value="${map.allSum}"/>
                     </td>
                  </tr>
               </table>
                  <input type="hidden" name="count" value="${map.count}">
                  <button type="submit" id="btnUpdate" style="float: right">수정</button>
                  
            </form>
         </c:otherwise>
      </c:choose>
      <button type="button" id="btnList" style="float: right;">상품목록</button>
-->
</body>
   


<%@ include file="include/footer.jsp" %>
</html>