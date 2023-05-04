<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@ include file="include/header.jsp" %>
    <%@ include file="./include/menu.jsp" %>
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
    
    <style>
    	#p_title {
    		text-align:center;
    		padding:15px 0px 10px 0px;
    		font-weight:500;
    	}
    
    	table {
    		width:80%;
    		margin-left:150px;
    	}
    	
    	#p_tr {
    		
    		
    	}
    	
    	#p_td1 {
    		text-align:center;
    	}
    	
    	#p_td2 {
    		
    		padding:6px 15px;
    	}
    	
    	#p_btn {
    		text-align:center;
    		padding-top:10px;
    		font-size:18px;
    		margin-left:20px;
    	}
    	
    	#p_bt {
    		display:inline-block;
    		
    	}
    	
    	#deleteBtn{
    		margin:0px 5px;
    	}
    </style>
    
</head>
<body>
   <h2 id="p_title">상품 정보/삭제</h2>   
   <div>
   <form action="" id="form1" name="form1" enctype="multipart/form-data" method="post">
   <table border="1">
      <tr id="p_tr">
         <td id="p_td1">상품 이미지</td>
         <td id="p_td2">
            <img src="${path}/img/product/${vo.product_url}" height="300px" width="310px" style="margin-bottom:15px">
            <br>
            <input type="file" id="product_photo" name="product_photo">
         </td>
      </tr>
      <tr>
         <td id="p_td1">상품명</td>
         <td id="p_td2"><input type="text" id="product_name" name="product_name" value="${vo.product_name}"></td>
      </tr>
      <tr>
         <td id="p_td1">가격</td>
         <td id="p_td2"><input type="number" id="product_price" name="product_price" value="${vo.product_price}"></td>
      </tr>
      <tr>
         <td id="p_td1">상품소개</td>
         <td id="p_td2"><textarea id="product_desc" name="product_desc" rows="5" cols="60">${vo.product_desc}</textarea></td>
      </tr>
   </table>
   		<div id="p_btn">
            <input type="hidden" name="product_id" value="${vo.product_id}">
            <input type="button" class="p_bt" id="editBtn" value="수정" style="padding:5px;">
            <input type="button" class="p_bt" id="deleteBtn" value="삭제" style="padding:5px;">
            <input type="button" class="p_bt" id="listBtn" value="상품목록" style="padding:5px;">
    	</div>
   </form>
   </div>
</body>
<%@ include file="include/footer.jsp" %>
</html>