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

<style>
	button {
		border:1px solid black;
		padding:7px 12px;
	}
	
	#btnSave {
		margin-right:3px;
	}
	
	.btn {
   	border:1px solid black;
    margin:0px 2px;
   }
</style>

</head>
<body>
<div class="container">
  <h2 style="margin:20px 0px;">게시글 작성</h2>
<form name="form1" method="post" action="${path }/boardInsert.do">
	<div class="form-group">
      <label for="title">제목</label>
      <input type="text" class="form-control" id="board_title"
       name="board_title" size="80" placeholder="제목을 입력하세요"> 
       
    </div>
    <div class="form-group">
   	  <label for="content">내용</label>
      <textarea class="form-control" name="board_content" id="board_content" rows="13" cols="80" placeholder="내용을 입력하세요"></textarea>
 	</div>
	<div class="form-group">
	<label for="name">이름</label>
		<input class="form-control" name="board_writer" id="board_writer" placeholder="이름을 입력해주세요">
	</div>
	<div style="width:100%; text-align:right;">
		<button class="btn" type="button" id="btnSave">확인</button>
		<button class="btn"type="reset">취소</button>
	</div>
</form>
</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>