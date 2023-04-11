<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    <title>상품 상세/삭제</title>
    <script>
       $(document).ready(function() {
          $("#editBtn").click(function() {
          var productName = $("#product_name").val();
          var productPrice = $("#product_price").val();
          var productDesc = $("#product_desc").val();
          var productPhoto = $("#product_photo").val();
          
          if(productName == "") {
             alert("상품명을 입력해주세요");
             productName.focus();
          } else if (productPrice == "") {
             alert("상품 가격을 입력해주세요");
             productPrice.focus();
          } else if (productDesc == "") {
             alert("상품 설명을 입력해주세요");
             productDesc.focus();
          }
            document.form1.action = "${path}/productUpdate.do";
            document.form1.submit();   
       });
       $("#deleteBtn").click(function() {
          if(confirm("상품을 삭제하시겠습니까?")) {
             document.form1.action = "${path}/productDelete.do";
                document.form1.submit();
          }
       });
       $("#listBtn").click(function() {
          location.href = "${path}/productList.do";
       });
    });
    </script>
</head>

<body>
   <h2>상품 정보/삭제</h2>   
   <form action="" id="form1" name="form1" enctype="multipart/form-data" method="post">
   <table border="">
      <tr>
         <td>상품 이미지</td>
         <td>
            <img src="${path}/img/product${vo.product_url}" height="300px" width="310px">
            <br>
            <input type="file" id="product_photo" name="product_photo">
         </td>
      </tr>
      <tr>
         <td>상품명</td>
         <td><input type="text" id="product_name" name="product_name" value="{vo.product_name}"></td>
      </tr>
      <tr>
         <td>가격</td>
         <td><input type="number" id="product_price" name="product_price" value="{vo.product_price}"></td>
      </tr>
      <tr>
         <td>상품소개</td>
         <td><textarea id="product_desc" name="product_desc" rows="5" cols="60">${vo.product_desc}</textarea>></td>
      </tr>
      <tr>
         <td colspan="2" align="center">
            <input type="hidden" name="product_id" value="${vo.product_id}">
            <input type="button" id="editBtn" value="수정">
            <input type="button" id="deleteBtn" value="삭제">
            <input type="button" id="listBtn" value="상품목록">
         </td>
      </tr>
   </table>
   </form>
</body>
   


<%@ include file="include/footer.jsp" %>
</html>