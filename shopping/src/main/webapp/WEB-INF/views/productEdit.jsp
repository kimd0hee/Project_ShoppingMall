<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
	<%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    <title>상품 상세/삭제</title>
    <script>
       $(document).ready(function() {
          $("#editBtn").click(function() {
          var product_name = $("#product_name").val();
          var product_price = $("#product_price").val();
          var product_desc = $("#product_desc").val();
          var product_photo = $("#product_photo").val();
          
          if(product_name == "") {
             alert("상품명을 입력해주세요");
             product_name.focus();
          } else if (product_price == "") {
             alert("상품 가격을 입력해주세요");
             product_price.focus();
          } else if (product_desc == "") {
             alert("상품 설명을 입력해주세요");
             product_desc.focus();
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
            <img src="C:\Users\82107\git\Project_ShoppingMall\shopping\src\main\webapp\resources\img\product\${dto.product_url}" height="300px" width="310px">
            <br>
            <input type="file" id="product_photo" name="product_photo">
         </td>
      </tr>
      <tr>
         <td>상품명</td>
         <td><input type="text" id="product_name" name="product_name" value="${dto.product_name}"></td>
      </tr>
      <tr>
         <td>가격</td>
         <td><input type="number" id="product_price" name="product_price" value="${dto.product_price}"></td>
      </tr>
      <tr>
         <td>상품소개</td>
         <td><textarea id="product_desc" name="product_desc" rows="5" cols="60">${dto.product_desc}</textarea></td>
      </tr>
      <tr>
         <td colspan="2" align="center">
            <input type="hidden" name="product_id" value="${dto.product_id}">
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