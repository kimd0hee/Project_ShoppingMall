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
		$("#btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.form1.action="${path}/boardDelete.do";
				document.form1.submit();
			}
		});
		$("#btnUpdate").click(function(){
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
				document.form1.board_context.focus();
				return;
			}
			if(board_writer == ""){
				alert("이름을 입력하세요");
				document.form1.board_writer.focus();
				return;
			}
			document.form1.action="${path}/boardUpdate.do"
			
			document.form1.submit();
		});
	});
</script>

<style>
	.btn {
   	border:1px solid black;
    margin:0px 2px;
   }
</style>

</head>
<body>
<div class="container">
<h2 style="margin:20px 0px;">게시글 보기</h2>
<form name="form1" method="post">
	<div class="form-group">
	<div>
		작성일자 : <fmt:formatDate value="${dto.board_createdate }" pattern="yyyy-MM-dd HH:mm:ss"/>
	</div>
	</div>
	<div class="form-group">
	<div>
		<label for="title">제목</label>
		<input type="text" class="form-control" name="board_title" id="board_title" size="80" value="${dto.board_title }">
	</div>
	</div>
	<div class="form-group">
	<div>
		<label for="content">내용</label>
		<textarea class="form-control" name="board_content" id="board_content" rows="4" cols="80" >${dto.board_content }</textarea>
	</div>
	</div>
	<div class="form-group">
	<div>
		<label for="writer">이름</label>
		<input type="text" class="form-control" name="board_writer" id="board_writer" value="${dto.board_writer}" >
	</div>
	</div>
	<div style="width:100%; text-align:right;">
		<input type="hidden" name="board_id" value="${dto.board_id}">
		<button type="button" id="btnUpdate" class="btn">수정</button>
		<button type="button" id="btnDelete" class="btn">삭제</button>
	</div>
</form>
</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>