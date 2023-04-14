<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원관리</title>
<%@ include file="include/header.jsp" %>
<%@ include file="include/menu.jsp" %>
</head>
<body>
<h2>회원 목록</h2>
<input type="button" value="회원등록" onclick="location.href='${path}/writeUser.do'">
	<table border="1" width="700px">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>가입일자</th>
		</tr>
		<c:forEach var="row" items="${list }">
		<tr>
			<td>${row.user_idx }</td>
			<td><a href="${path}/userView.do?user_id=${row.user_id}">${row.user_id }</a></td>
			<td>${row.user_name }</td>
			<td>${row.user_phone }</td>
			<td>${row.user_joindate }</td>
			
		</tr>
		</c:forEach>
	</table>
</body>
<%@ include file="include/footer.jsp" %>
</html>
