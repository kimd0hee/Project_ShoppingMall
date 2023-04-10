<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="UTF-8">

<head>
	<%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    <title>상품 등록 페이지</title>
    <script>
       $(document).ready(function() {
          $("#addBtn").click(function() {
          var porductName = $("#product_name").val();
          var porductPrice = $("#product_price").val();
          var porductDesc = $("#product_desc").val();
          var porductPhoto = $("#product_photo").val();
          
          if(porductName == "") {
             alert("상품명을 입력해주세요");
             porductName.focus();
          } else if (porductPrice == "") {
             alert("상품 가격을 입력해주세요");
             porductPrice.focus();
          } else if (porductDesc == "") {
             alert("상품 설명을 입력해주세요");
             porductDesc.focus();
          } else if (porductPhoto == "") {
             alert("상품 사진을 입력해주세요");
             porductPhoto.focus();
          }
            document.form1.action = "${path}/productInsert.do";
            document.form1.submit();
       });
    });
    </script>
</head>

<body>
   <h2>상품 등록</h2>   
   <form action="" id="form1" name="form1" enctype="multipart/form-data" method="post">
   <table border="1">
      <tr>
         <td>상품명</td>
         <td><input type="text" name="product_name" id="product_name"></td>
      </tr>
      <tr>
         <td>가격</td>
         <td><input type="text" name="product_price" id="product_price"></td>
      </tr>
      <tr>
         <td>상품설명</td>
         <td><textarea rows="5" cols="60" name="product_desc" id="product_desc"></textarea>></td>
      </tr>
      <tr>
         <td>상품 이미지</td>
            <td><input type="file" id="product_photos" name="product_photos"></td>
      </tr>
      <tr>
         <td colspan="2" align="center">
            <input type="button" value="등록" id="addBtn" >
            <input type="button" value="목록" onclick="location.href='${path}/productList.do';">
         </td>
      </tr>
   </table>
   </form>
</body>
   


<%@ include file="include/footer.jsp" %>
</html>