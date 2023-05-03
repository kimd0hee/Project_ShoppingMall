<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원관리</title>
<%@ include file="include/header.jsp" %>
<%@ include file="include/menu.jsp" %>

<!-- 유효성 검사 함수 -->
<script type="text/javascript">
function validateForm() {
    var userId = document.forms["form1"]["user_id"].value;
    var userPw = document.forms["form1"]["user_pw"].value;
    var userName = document.forms["form1"]["user_name"].value;
    var userPhone = document.forms["form1"]["user_phone"].value;
    var userEmail = document.forms["form1"]["user_email"].value;
    var userBirth = document.forms["form1"]["user_birth"].value;

    // 아이디는 5자 이상이어야 합니다.
    if (userId.length < 5) {
        alert("아이디는 5자 이상이어야 합니다.");
        return false;
    }

    // 비밀번호는 8자 이상이어야 합니다.
    if (userPw.length < 8) {
        alert("비밀번호는 8자 이상이어야 합니다.");
        return false;
    }

    // 이름은 필수 입력 항목입니다.
    if (userName.trim() == "") {
        alert("이름은 필수 입력 항목입니다.");
        return false;
    }

    // 전화번호는 숫자만 입력 가능합니다.
    if (!/^\d+$/.test(userPhone)) {
        alert("전화번호는 숫자만 입력 가능합니다.");
        return false;
    }

    // 이메일 형식이 유효한지 검사합니다.
    if (!/\S+@\S+\.\S+/.test(userEmail)) {
        alert("유효한 이메일 주소를 입력해주세요.");
        return false;
    }

    // 생년월일은 필수 입력 항목입니다.
    if (userBirth.trim() == "") {
        alert("생년월일은 필수 입력 항목입니다.");
        return false;
    }

    alert("회원가입이 완료되었습니다.");
    return true;
}

</script>
</head>
<body>
<h2>회원등록</h2>
   <form name="form1" method="post" action="${path}/userInsert.do" onsubmit="return validateForm()">
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