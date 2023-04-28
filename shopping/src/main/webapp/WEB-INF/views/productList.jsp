<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
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

<style>
	table {
		
	}
</style>

</head>
<body>

   <h2>상품목록</h2>
   <div id="container_box">
   <c:if test="${sessionScope.admin_id != null}">
      <button type="button" id="btnAdd">상품등록</button><br>
   </c:if>
   <div class="table-responsive">
   <table border="1" class="table table-bordered m-0" style="width:80%;">
   	<thead>
      <tr>
         <th>상품번호</th>
         <th>상품이미지</th>
         <th>상품명</th>
         <th>가격</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="row" items="${list}">
         <tr>
            <td>
               ${row.product_id}
            </td>
            <td>
               <a href="${path}/productDetail${row.product_id}">
                  <img src="${path}/img/product/${row.product_url}" width="120px" height="110px">
               </a>
            </td>
            <td>
               <a href="${path}/productDetail${row.product_id}">${row.product_name}</a>
               <c:if test="${sessionScope.admin_id != null}">
                  <a href="${path}/productEdit${row.product_id}">[상품편집]</a>
               </c:if>
            </td>
            <td>
               <fmt:formatNumber value="${row.product_price}" pattern="###, ###, ###"></fmt:formatNumber>
            </td>
         </tr>
      </c:forEach>
      </tbody>
   </table>
   </div>
</div>
   <%@ include file="include/footer.jsp" %>
</body>
</html>