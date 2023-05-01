<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
	<%@ include file="include/header.jsp" %>
    <%@ include file="./include/menu.jsp" %>
    <title>상품 상세정보</title>

<style>
	#tb_t {
		
		align:right;
		
		
	}
	
	#detail {
		
		
	}
	
	#detail2 {
		border:1px solid gray;
		text-align:center;
		padding-bottom:130px;
	}
	
	#img {
		border:1px solid red;
		
		
	}
	
	td {
		border:1px solid black;
		vertical-align: top;
	}
	
	.container {
		display:inline-block;
	}
</style>

    
</head>

<body>
   <h2>상품 상세정보</h2>
   <div>
   <div id="detail" style="width:50%;  float:left;">   
   <table style="width:90%; margin-left:10px;">
      <tr>
         <td id="img">
            <img src="${path}/img/product/${vo.product_url}" width="800px;" height="450px;"  >
         </td>
         </tr>
            </table>
         </div>
         
         <div style="float:left;" id="detail2">
            <table style="height:600px; width:400px;" id="tb_t">
               <tr>
                  
                  <td style="font-size:40px; font-weight:600;">${vo.product_name}</td>
               </tr>
               <tr>
                  
                  <td><fmt:formatNumber value="${vo.product_price}" pattern="###,###,###"/></td>
               </tr>
               <tr>
                  
                  <td>${vo.product_desc}</td>
               </tr>
               <tr>
                  <td colspan="2">
                     <form name="form=1" method="post" action="${path}/cartInsert.do">
                        <input type="hidden" name="product_id" value="${vo.product_id}">
                        <select name="amount">
                           <c:forEach begin="1" end="10" var="i">
                              <option value="${i}">"${i}"></option>
                           </c:forEach>
                        </select>&nbsp;개
                        <input type="submit" value="장바구니에 담기">
                     </form>
                     <a href="${path}/productList.do">상품목록</a>
                  </td>
               </tr>
         

   </table>
   </div>
   </div>
</body>


<%@ include file="include/footer.jsp" %>
</html>