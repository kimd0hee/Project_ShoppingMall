<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
	<%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
<script>
	$(document).ready(function(){
	$("#btnSave").click(function(){
		var board_title = $("#board_title").val();
		var board_content = $("#board_content").val();
		var board_writer = $("#board_writer").val();
		if(board_title == ""){
			alert("제목을 입력하세요");
			document.form1.board_title.focus();
			return;
		}
		if(board_content == ""){
			alert("내용을 입력하세요");
			document.form1.board_content.focus();
			return;
		}
		if(board_writer == ""){
			alert("이름을 입력하세요");
			document.form1.board_writer.focus();
			return;
		}
		
		document.form1.submit();
	});
});
</script>
</head>
<body>
<h2>게시글 작성</h2>
<form name="form1" method="post" action="${path }/boardInsert.do">
	<div>
		제목
		<input name="board_title" id="board_title" size="80" placeholder="제목을 입력해주세요.">
	</div>
	<div>
		내용
		<textarea name="board_content" id="board_content" rows="4" cols="80" placeholder="내용을 입력해주세요."></textarea>
	</div>
	<div>
		이름
		<input name="board_writer" id="board_writer" placeholder="이름을 입력해주세요">
	</div>
	<div style="width:650px; text-align: center;">
		<button type="button" id="btnSave">확인</button>
		<button type="reset">취소</button>
	</div>
</form>
<%@ include file="include/footer.jsp" %>
</body>
</html>