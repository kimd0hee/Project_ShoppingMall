<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원관리</title>
<%@ include file="include/header.jsp" %>
<%@ include file="include/menu.jsp" %>
	<script>
		$(document).ready(function(){
			$("#btnUpdate").click(function(){
				if(confirm("수정하시겠습니까?")){
					document.form1.action = "${path}/userUpdate.do";
					document.form1.submit();
				}	
			});
		});
		
		$(document).ready(function(){
			$("#btnDelete").click(function(){
				if(confirm("삭제하시겠습니까?")){
					document.form1.action = "${path}/userDelete.do";
					document.form1.submit();
				}	
			});
		});	
	</script>
</head>
<body>
<h2>회원정보 상세</h2>
<form name="form1" method="post">
	<table border="1" width="400px">
		<tr>
			<td>아이디</td> <!-- 수정 불가 -->
			<td><input name="user_id" value="${dto.user_id }" readonly="readonly"></td>
		</tr>
		<tr>
			<td>비밀번호</td> <!-- 비밀번호 입력해야 수정 가능 -->
			<td><input name="user_pw" value="${dto.user_pw }"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input name="user_name" value="${dto.user_name }"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input name="user_phone" value="${dto.user_phone }"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input name="user_email" value="${dto.user_email }"></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="date" name="user_birth" value="${dto.user_birth }"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input name="user_address1" value="${dto.user_address1 }"></td>
			<td><input name="user_address2" value="${dto.user_address2 }"></td>
			<td><input name="user_address3" value="${dto.user_address3 }"></td>
		</tr>
		<tr>
			<td>가입일자</td>
			<td><fmt:formatDate value="${dto.user_joindate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
		<tr>
			<td>수정일자</td>
			<td><fmt:formatDate value="${dto.user_update }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="수정" id="btnUpdate">
				<input type="button" value="삭제" id="btnDelete">
				<div style="color:red;">${message }</div>
			</td>
		</tr>
	</table>
</form>
</body>
<%@ include file="include/footer.jsp" %>
</html>
