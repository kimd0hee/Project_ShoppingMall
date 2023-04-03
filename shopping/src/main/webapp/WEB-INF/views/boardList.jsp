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
</head>
<body>
<h2>게시글 목록</h2>
<button type="button" id="btnWrite">글쓰기</button>
<table border="1" width="600px">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>이름</th>
		<th>작성일</th>
	</tr>
	<c:forEach var="row" items="${list}">
	<tr>
		<td>${row.cs_id}</td>
		<td><a href="${path }/boardView.do?cs_id=${row.cs_id }">${row.cs_title }</a></td>
		<td>${row.cs_writer }</td>
		<td><fmt:formatDate value="${row.cs_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	</tr>
	</c:forEach>
</table>
<%@ include file="include/footer.jsp" %>
</body>
</html>