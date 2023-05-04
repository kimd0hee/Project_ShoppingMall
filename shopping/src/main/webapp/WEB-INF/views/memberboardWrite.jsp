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
  <form name="form" method="post" action="${path}/memberboardInsert.do">
    <div class="form-group">
      <label for="title">제목</label>
      <input type="text" class="form-control" id="board_title"
       name="board_title" size="80" placeholder="제목을 입력하세요"> 
       
    </div>
    <div class="form-group">
   	  <label for="content">내용</label>
      <textarea class="form-control" name="content" id="content" rows="13" cols="80" placeholder="내용을 입력하세요"></textarea>
 	</div>
    <div style="width:100%; text-align:right;">
      <button class="btn" type="button" id="btnSave">확인</button>
      <button class="btn" type="reset">취소</button>
   </div>
  </form>
</div>

</body> 

</html>