<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
<%@ include file="include/header.jsp" %>
<%@ include file="include/menu.jsp" %>
<%@ include file="include/sessionCheck.jsp" %>
<script>

	$(document).ready(function(){
		$("#btnSave").click(function(){
			// var title = document.form.title.value; // name 속성으로 실행
			// var content = document.form.content.value;
			// var writer = document.form.writer.value;
			var title = $("#title").val();
			var content = $("#content").val();
			// var cs_writer = $("#cs_writer").val();
			if(title == ""){
				alert("제목을 입력하세요");
				document.form.title.focus();
				return;
			}
			if(content == ""){
				alert("내용을 입력하세요");
				document.form.content.focus();
				return;
			}
			document.form.submit();
		});
	});

</script>
</head>
<body>

<h2>게시글 작성</h2>
<form name="form" method="post" action="${path}/memberboardInsert.do">
   <div>
      제목
      <input name="title" id="title" size="80" placeholder="제목을 입력하세요">
   </div>
   <div>
      내용
      <textarea name="content" id="content" rows="4" cols="80" placeholder="내용을 입력하세요"></textarea>
   </div>
   <div style="width:650px; text-align:center;">
      <button type="button" id="btnSave">확인</button>
      <button type="reset">취소</button>
   </div>
   </form>

</body>
<%@ include file="include/footer.jsp" %>
</html>