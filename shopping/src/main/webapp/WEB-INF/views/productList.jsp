<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 목록</title>
<%@ include file="include/header.jsp" %>
<%@ include file="./include/menu.jsp" %>
<script>
   $(document).ready(function() {
      $("#btnAdd").click(functiion() {
         location.href="${path}/productWrite.do";
      });
      $("#btnEdit").click(functiion() {
         location.href="${path}/productEdit.do";
      });
   });
</script>

</head>
<body>
   <h2>상품목록</h2>
  <!--  <c:if test="${sessionScope.admin_id != null}"> -->
      <button type="button" id="btnAdd">상품등록</button><br>
  <!-- </c:if> -->
   <table border="1">
      <tr>
         <th>상품ID번호</th>
         <th>상품이미지</th>
         <th>상품명</th>
         <th>가격</th>
      </tr>
      <c:forEach var="row" items="${list}">
         <tr>
            <td>
               ${row.product_id}
            </td>
            <td>
               <a href="${path}/productDetail/${row.product_id}">
                  <img src="${path}/resources/ima/product${row.product_url}" width="120px" height="110px">
               </a>
            </td>
            <td>
            <!-- <a href="${path}/productEdit/${row.product_id}">[상품편집]</a>  -->
               <a href="${path}/productDetail/${row.product_id}">${row.product_name}</a>
               <c:if test="${sessionScope.admin_id != null}">
                  <a href="${path}/productEdit/${row.product_id}">[상품편집]</a>
               </c:if>
            </td>
            <td>
               <fmt:formatNumber value="${row.product_price}" pattern="###, ###, ###" />
            </td>
         </tr>
      </c:forEach>
   </table>
   <%@ include file="include/footer.jsp" %>
</body>
</html>