<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
<%@ include file="include/header.jsp" %>
<%@ include file="include/sessionCheck.jsp" %>
<script>
	$(document).ready(function(){
		$("#btnSave").click(function(){
			// var cs_title = document.form.cs_title.value; // name 속성으로 실행
			// var cs_context = document.form.cs_context.value;
			// var cs_writer = document.form.cs_writer.value;
			var cs_title = $("#cs_title").val();
			var cs_context = $("#cs_context").val();
			// var cs_writer = $("#cs_writer").val();
			if(cs_title == ""){
				alert("제목을 입력하세요");
				document.form.cs_title.focus();
				return;
			}
			if(cs_context == ""){
				alert("내용을 입력하세요");
				document.form.cs_context.focus();
				return;
			}
			document.form.submit();
		});
	});
</script>
</head>
<body>
<%@ include file="include/menu.jsp" %>
<h2>게시글 작성</h2>
<form name="form" method="post" action="${path}/insertMemberboard.do">
	<div>
		제목
		<input name="cs_title" id="cs_title" size="80" placeholder="제목을 입력하세요">
	</div>
	<div>
		내용
		<textarea name="cs_context" id="cs_context" rows="4" cols="80" placeholder="내용을 입력하세요"></textarea>
	</div>
	<div style="width:650px; text-align:center;">
		<button type="button" id="btnSave">확인</button>
		<button type="reset">취소</button>
	</div>
	</form>
</body>
</html>