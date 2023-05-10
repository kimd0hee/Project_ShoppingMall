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

<style type="text/css">

	a:link { color:black; text-decoration: none;}
	a:visited {color:black; text-decoration: none;}
	a:hover {color:dark; text-decoration: none;}
	
	h2 {
		text-align:center;
		margin-top:15px;
		
	}

	ul li {
		display:inline-block;
	}
	
	.ul{
		padding:8px;
	}
	
	.li {
		margin:12px;
		font-size:18px;
		font-weight:500;
	}
	

</style>

</head>
<body>

   <h2>상품목록</h2>
<!--    <c:if test="${sessionScope.admin_id != null}">
      <button type="button" id="btnAdd">상품등록</button><br>
   </c:if> -->
   <div class="body-container">
   <div class="container" style="width:100%; height:100%;" id="con">
   
  <ul class="ul">
   <c:forEach var="row" items="${list}">
  	<li class="li">
  		<div>
        <a href="${path}/productDetail${row.product_id}">
        <img src="${path}/img/product/${row.product_url}" width="340" height="300">
        </a>
      </div>
        
        <div style="text-align:center;">
        	 
               <a href="${path}/productDetail${row.product_id}">${row.product_name}</a>
               <c:if test="${sessionScope.admin_id != null}">
                  <a href="${path}/productEdit${row.product_id}">[상품편집]</a>
               </c:if>
        </div>
        <div style="text-align:center;">   
               <fmt:formatNumber value="${row.product_price}" pattern="###, ###, ###"></fmt:formatNumber>

     </div>
     </li>
      </c:forEach>
    
   </ul>
   </div>
</div>

   <%@ include file="include/footer.jsp" %>
</body>
</html>