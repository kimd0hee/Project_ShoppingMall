<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
	<%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    <title>상품 상세정보</title>
</head>

<body>
   <h2>상품 상세정보</h2>   
   <table border="1">
      <tr>
         <td>
            <img src="${path}/resources/img/product/${dto.product_url}" width="340" height="300">
         </td>
         <td>
            <table border="1" style="height:300px; width:400px;">
               <tr align="center">
                  <td>상품명</td>
                  <td>${dto.product_name}</td>
               </tr>
               <tr align="center">
                  <td>가격</td>
                  <td><fmt:formatNumber value="${dto.product_price}" pattern="###,###,###"/></td>
               </tr>
               <tr align="center">
                  <td>상품소개</td>
                  <td>${vo.product_desc}</td>
               </tr>
               <tr align="center">
                  <td colspan="2">
                     <form name="fprm=1" method="post" action="${path}/cartInsert.do">
                        <input type="hidden" name="product_id" value="${dto.product_id}">
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
         </td>
      </tr>
   </table>
</body>


<%@ include file="include/footer.jsp" %>
</html>