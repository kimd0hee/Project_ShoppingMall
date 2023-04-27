<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>상품 등록 페이지</title>
    <script>
       $(document).ready(function() {
          $("#addBtn").click(function() {
          var review_title = $("#review_title").val();
          var review_comment = $("#review_comment").val();
          //var review_photo = $("#review_photo").val();
          
          if(product_name == "") {
             alert("제목을 입력해주세요");
             review_title.focus();
          }	else if (product_desc == "") {
             alert("내용을 입력해주세요");
             review_comment.focus();
          }
          /*else if (product_desc == "") {
              alert("내용을 입력해주세요");
              review_photo.focus();
           }*/
            document.form1.action = "${path}/reviewWrite.do";
            document.form1.submit();
       });
    });
    </script>
</head>
<body>
	<form role="form" action="reviewInsert.do" method="post">
		<div class="form-group">
			<label for="name">제목:</label> 
			<input type="text" name="title"
				class="form-control" id="review_title" name="review_title"
				placeholder="제목 (100자 이내)" maxlength="100" required="required"
				autofocus="autofocus">
		</div>
		<div class="form-group">
			<label for="comment">내용:</label>
			<textarea class="form-control" rows="5" id="review_comment" name="review_content"
				placeholder="내용 (1000자 이내)" maxlength="1000"
				required="required"></textarea>
		</div>
		<div class="form-group">
			<label for="photo">첨부파일</label>
			<input type="file" class="btn btn-default btn-sm" id="review__photo" name="review_photo" >
		</div>
		<button type="submit" class="btn btn-default btn-sm">등록</button>
		<button type="reset" class="btn btn-default btn-sm">취소</button>
	</form>
</body>
</html>