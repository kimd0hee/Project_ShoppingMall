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
			var cs_title = $("#cs_title").val();
			var cs_context = $("#cs_context").val();
			var cs_writer = $("#cs_writer").val();
			if(cs_title == ""){
				alert("제목을 입력하세요");
				document.form1.cs_title.focus();
				return;
			}
			if(cs_context == ""){
				alert("내용을 입력하세요");
				document.form1.cs_context.focus();
				return;
			}
			if(cs_writer == ""){
				alert("이름을 입력하세요");
				document.form1.cs_writer.focus();
				return;
			}
			document.form1.action="${path}/boardUpdate.do"
			
			document.form1.submit();
		});
	});
</script>
</head>
<body>
<h2>게시글 보기</h2>
<form name="form1" method="post">
	<div>
		작성일자 : <fmt:formatDate value="${dto.cs_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
	</div>
	<div>
		제목
		<input name="cs_title" id="cs_title" size="80" value="${dto.cs_title }" placeholder="제목을 입력해주세요.">
	</div>
	<div>
		내용
		<textarea name="cs_context" id="cs_context" rows="4" cols="80" placeholder="내용을 입력해주세요.">${dto.cs_context }</textarea>
	</div>
	<div>
		이름
		<input name="cs_writer" id="cs_writer" value="${dto.cs_writer }" placeholder="이름을 입력해주세요">
	</div>
	<div style="width:650px; text-align: center;">
		<input type="hidden" name="cs_id" value="${dto.cs_id }">
		<button type="button" id="btnUpdate">수정</button>
		<button type="button" id="btnDelete">삭제</button>
	</div>
</form>
<%@ include file="include/footer.jsp" %>
</body>
</html>