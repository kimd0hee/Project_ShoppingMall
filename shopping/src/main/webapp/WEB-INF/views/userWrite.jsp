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
<h2>회원등록</h2>
	<form name="form1" method="post" action="${path }/userInsert.do">
		<table border="1" width="400px">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="user_id" placeholder="아이디를 입력하세요"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="user_pw" placeholder="비밀번호를 입력하세요"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="user_name" placeholder="이름을 입력하세요"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="user_phone" placeholder="전화번호를 입력하세요"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="user_email" placeholder="이메일을 입력하세요"></td>
			</tr>
			<tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="user_birth" placeholder="생일을 입력하세요"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="회원가입">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
<%@ include file="include/footer.jsp" %>
</html>
