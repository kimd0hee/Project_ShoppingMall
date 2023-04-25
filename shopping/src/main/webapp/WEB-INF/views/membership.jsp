<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입 페이지</title>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>

    <link href="css/signup.css" rel="stylesheet" />

    <script src="js/signup.js"></script>

</head>

<body>
    <h1 style="font-size:24px;">회원가입</h1>
    <div id="form">
	<table class="table table-bordered m-0">
        <tbody>
        <tr>
            <th class="row">이메일 : </th>
            <td><input class="col-md-4" id="email" type="email" placeholder="이메일을 입력해 주세요.">
            <div id="emailError" class="error"></div></td>
        
        </tr>
        <tr>
        <th class="row">이름 : </th>
            <td><input id="name"  type="text" placeholder="이름을 입력해 주세요.">
            <div id="nameError" class="error"></div></td>
        </tr>
        <tr>
        <th class="row">비밀번호 : </th>
            <td><input id="password" type="password" placeholder="비밀번호를 입력해 주세요.">
            <div id="passwordError" class="error"></div></td>
        </tr>
        <tr>
        <th class="row">비밀번호 확인 : </th>
            <td><input id="passwordCheck" type="password" placeholder="비밀번호를 다시 입력해 주세요.">
            <div id="passwordCheckError" class="error"></div></td>
        </tr>
        <tr>
        <th class="row">전화번호 : </th>
            <td><input id="phone1" type="text" size="5" maxlength="3" oninput="changePhone1()"> -
            <input id="phone2" type="text" size="8" maxlength="4" oninput="changePhone2()"> -
            <input id="phone3" type="text" size="8" maxlength="4" oninput="changePhone3()"></td>

        </tr>
        <tr>
        <th class="row"></th>
            <td id="certificationNumber">000000
            <button disabled id="sendMessage" onclick="getToken()">인증번호 전송</button></td>
        </tr>
        <tr>
        <th class="row"></th>
            <td><div id="timeLimit">03:00
            <button disabled id="completion" onclick="checkCompletion()">인증확인</button></div>
        </tr>
        <tr>
        <th class="row">성별 : </th>
            <td><input id="gender_man" type="radio" name="gender">남성  
            <input id="gender_woman" type="radio" name="gender">여성
            <div id="genderError" class="error"></div></td>
        </tr>
        <tr>
        <th class="row"><div class="line">
            <hr>
        </div></th>
        <tr>
        <td class="row"><div class="signUp">
            <button id="signUpButton" disabled onclick="signUpCheck()">가입하기</button>
        </div></td>
        </tr>
 
</tbody>
</table>
</div>
</body>

<%@ include file="include/footer.jsp" %>
</html>