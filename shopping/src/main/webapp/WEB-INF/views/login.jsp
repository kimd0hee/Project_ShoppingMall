<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인페이지</title>
<%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>

<script>
	$(document).ready(function(){
		$("#btnLogin").click(function(){
			// 태크.val() : 태그에 입력된 값
			// 태크.val("값ㅅ") : 태그의 값을변경
			var user_id = $("#user_id").val();
			var user_pw = $("#user_pw").val();
			if(user_id == ""){
				alert("아이디를 입력하세요.");;
				$("#user_id").focus(); //입력포커스 이동
				return;
			}
			if(user_pw == ""){
				alert("비밀번호를 입력하세요.");
				$("#user_pw").focus();
				return;
			}
			// 폼 내부의 데이터를 전송할 주소
			document.form1.action="${path}/loginCheck.do"
			//제출
			document.form1.submit();
		});
	});
</script>
</head>
<body>
<h2>로그인</h2>
	<form name="form1" method="post">
		<table border="1" width="400px">
			<tr>
				<td>아이디</td>
				<td><input name="user_id" id="user_id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type=password name="user_pw" id="user_pw"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" id="btnLogin">로그인</button>
					<button type="button" onclick="location.href='writeUser.do' ">회원가입</button>
					
					
				<c:if test="${msg == 'failure' }">
					<div style="color: red">
						아이디 또는 비밀번호가 일치하지 않습니다.
					</div>
				</c:if>
				
				<c:if test="${msg == 'logout' }">
					<div style="color: red">
						로그아웃되었습니다.
					</div>
				</c:if>
				</td>
							
			</tr>
			</table>
			
	</form>
</body>
</html>