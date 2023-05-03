<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
	<%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
<script>
	$(document).ready(function(){
		$("#btnWrite").click(function(){
			location.href = "${path}/boardWrite.do";
		});
	});
</script>

<style>
	 a:link { color:black; text-decoration: none;}
	 a:visited {color:black; text-decoration: none;}
	 a:hover {color:dark; text-decoration: none;}

	table {
		border:2px solid black;
		text-align:center;
		border-collapse: collapse;
		margin:0 auto;
	}
	
	#padding {
		padding:7px;
	}
	
	h2 {
		text-align:center;
		margin-top:15px;
	}
	
	#div {
	   margin-left:10px;
	   margin:5px 10px;
	}
	
		
	#button1 {
		width:32px;
		height:27px;
		text-align:center;
	}
	
	#btnWrite {
		position:absolute;
	}
	
	.write {
		border:2px solid black;
		right:20px;
		
		
	}
	
	#t_head{
		background-color:#EBF5FF;
	}
	
	
</style>

</head>
<body>
<h2>게시글 목록</h2>
<table class="table table-sm" style="width:90%;">
          <thead id="t_head">
            <tr>
         		<th id="padding">번호</th>
         		<th id="padding">제목</th>
         		<th id="padding">이름</th>
         		<th id="padding">작성일</th>
      		</tr>
          </thead>
	<tbody>
            <c:forEach var="row" items="${list}">
         <tr>
            <td id="padding">${row.board_id}</td>
            <td id="padding"><a href="${path }/boardView.do?board_id=${row.board_id }">${row.board_title }</a></td>
            <td id="padding">${row.board_writer}</td>
            <td id="padding">
               <fmt:formatDate value="${row.board_createdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
         </tr>
      </c:forEach>
          </tbody>
</table>
<button type="button" id="btnWrite" class="write">글쓰기</button>
<%@ include file="include/footer.jsp" %>
</body>
</html>