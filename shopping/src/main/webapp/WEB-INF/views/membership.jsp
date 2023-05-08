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

<script
 src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
 src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
 src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link href="/resources/css/main.css" rel="stylesheet">
<script src="/resources/js/upload.js" type="text/javascript"></script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>

<body>
    <h1 style="font-size:35px;">회원가입</h1>
      <form action="${path}/userInsert.do" method="post" >
    <div id="form_div">
	<table class="table table-bordered m-0">
		
        <tbody>
        <tr class="member" class="name">
        <th class="col-md-3"><p>이름</p></th>
            <td style="text-align:left;">
            <input class="col-md-6" id="name" name="user_name" maxlength="10"  type="text" placeholder="이름을 입력해 주세요." style="height:35px; border-radius:7px;">
            <div id="nameError" class="error"></div></td>
        </tr>
        <tr class="member" class="id">
            <th class="col-md-3"><p>아이디</p></th>
            <td style="text-align:left;">
            <input class="col-md-6" id="id" name="user_id" type="text" maxlength="20" placeholder="아이디를 입력해 주세요." style="height:35px; border-radius:7px;">
            <div id="idError" class="error"></div></td>
        </tr>

        <tr class="member" class="password">
        <th class="col-md-3"><p>비밀번호</p></th>
            <td style="text-align:left;">
            <input class="col-md-6" id="password" name="user_pw" maxlength="20" type="password" placeholder="비밀번호를 입력해 주세요." style="height:35px; border-radius:7px;">
            <div id="passwordError" class="error"></div></td>
        </tr>
        <tr class="member" class="passwordCheck">
        <th class="col-md-3"><p>비밀번호 확인</p></th>
            <td style="text-align:left;">
            <input class="col-md-6" id="passwordCheck" maxlength="20" type="password" placeholder="비밀번호를 다시 입력해 주세요." style="height:35px; border-radius:7px;">
            <div id="passwordCheckError" class="error"></div></td>
        </tr>
        <tr class="member" class="email">
            <th class="col-md-3"><p>이메일</p></th>
            <td style="text-align:left;">
            <input class="col-md-6" id="email" name="user_email" type="email" maxlength="50" placeholder="이메일을 입력해 주세요." style="height:35px; border-radius:7px;">
            <div id="emailError" class="error"></div></td>
        </tr>
         <tr class="member" class="address">
		<th class="col-md-3"><p style="margin-top:50px;">주소</p></th>
			<td style="text-align:left;">
				<input type="text" id="postcode" name="postcode" style="height:35px; border-radius:7px;">
				<input type="button" class="btn btn-default btn-sm" id="searchAdd" value="우편번호 찾기" style="height:35px; border-radius:7px;"><br>
				<input class="col-md-6" class="form-control" type="text" id="roadAddress" name="useraddress" style="height:35px; border-radius:7px;">
				<input class="col-md-6" class="form-control" type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" style="height:35px; border-radius:7px;">
					
		</tr>
        <tr class="member" class="phone">
        <th class="col-md-3"><p>전화번호</p></th>
            <td style="text-align:left;" id="phone">
            <input class="col-md-2" id="phone1" type="text" maxlength="3" oninput="changePhone1()" style="height:35px; border-radius:7px;"> -
            <input id="phone2" type="text" maxlength="4" oninput="changePhone2()" style="height:35px; border-radius:7px;"> -
            <input id="phone3" type="text" maxlength="4" oninput="changePhone3()" style="height:35px; border-radius:7px;"></td>
        </tr>
		<tr>
		<th class="member" ><p>인증번호 받기</p></th>
            <td><div id="certificationNumber">000000</div>
            <button type="button" disabled id="sendMessage" onclick="getToken()">인증번호 전송</button></td>
		</tr>
		
		<tr>
        <th class="member" class="timer"><p>인증하기</p></th>
            <td><div id="timeLimit">03:00</div>
            <button type="button" disabled id="completion" onclick="checkCompletion()">인증확인</button></td>
        </tr>
        <tr class="member" class="gender">
        <th class="col-md-3"><p>성별</p></th>
            <td style="text-align:left;"><input id="gender_man" type="radio" name="gender">남성  
            <input id="gender_woman" type="radio" name="gender">여성
            <div id="genderError" class="error"></div></td>
        </tr>
       
     
        
 
</tbody>
</table>
		<div class="signUp">
            <button id="signUpButton" disabled onclick="signUpCheck()">가입하기</button>
            <button type="button" onclick="location.href='/' ">취소</button>
        </div>
</div>
  </form> 

</body>
<!-- 주소 입력관련 스크립트 -->
<script type="text/javascript">

	$(document).ready(function() {
		
		$("#searchAdd").click(function(event) {
			event.preventDefault();
			postcode();

		});
		
		
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function postcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("roadAddress").value = roadAddr;
	                
	            }

	        }).open();
	    }
	
	});
	
</script>

<%@ include file="include/footer.jsp" %>
</html>