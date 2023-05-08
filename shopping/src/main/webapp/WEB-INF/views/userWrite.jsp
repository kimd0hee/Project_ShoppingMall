<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원관리</title>
<%@ include file="include/header.jsp" %>
<%@ include file="include/menu.jsp" %>

<link href="css/signup.css" rel="stylesheet" />

<script
 src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
 src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
    if (/^[0-9+]*$/.test(userPhone)) {
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
<h1 style="font-size:35px; text-align: center">회원가입</h1>
   <form name="form1" method="post" onsubmit="return validateForm()" action="${path}/userInsert.do">
      <div id="form_div">
      <table class="table table-bordered m-0">
         <tbody>
         <tr class="member" class="name">
            <th class="col-md-3"><p>아이디</p></th>
            <td style="text-align:left;">
               <input class="col-md-6" id="id" name="user_id" type="text" maxlength="20" placeholder="아이디를 입력해 주세요." style="height:35px; top:10px; border-radius:7px;">
               
         </tr>
         
          <tr class="member" class="password">
              <th class="col-md-3"><p>비밀번호</p></th>
               <td style="text-align:left;" onchange="pass_check()">
               <input class="col-md-6" id="user_pw" name="user_pw" maxlength="20" type="password" placeholder="비밀번호를 입력해 주세요." style="height:35px; top:10px; border-radius:7px;">
				</td>
           </tr>
         
         <tr class="member" class="passwordCheck">
              <th class="col-md-3"><p>비밀번호 확인</p></th>
               <td style="text-align:left;" onchange="pass_check()">
               <div style="display:inline">
               <input class="col-md-6" id="pass_check" name="pass_check" maxlength="20" type="password" placeholder="비밀번호를 다시 입력해 주세요." style="height:35px; top:5px; border-radius:7px;">
           		<span id="check" style="margin-top:20px;"></span></div></td>
           </tr>
         
         <tr class="member" class="name">
              <th class="col-md-3"><p>이름</p></th>
               <td style="text-align:left;">
               <input class="col-md-6" id="name" name="user_name" maxlength="10"  type="text" placeholder="이름을 입력해 주세요." style="height:35px; top:10px; border-radius:7px;">

           </tr>
           
            <tr class="member" class="address">
            <th class="col-md-3"><p style="margin-top:50px;">주소</p></th>
            <td style="text-align:left;">
               <input type="text" id="postcode" name="user_address1" style="height:35px; border-radius:7px;">
               <input type="button" class="btn btn-default btn-sm" id="searchAdd" value="우편번호 찾기" style="height:35px; border-radius:7px;"><br>
               <input class="col-md-6" class="form-control" type="text" id="roadAddress" name="user_address2" style="height:35px; border-radius:7px;">
               <input class="col-md-6" class="form-control" type="text" name="user_address3" placeholder="상세주소" style="height:35px; border-radius:7px;"></td>
         </tr>
         
         <tr class="member" class="phone">
              <th class="col-md-3"><p>전화번호</p></th>
              
               <td style="text-align:left;" id="phone">
               <div>
               <input class="col-md-2" type="text" name="user_phone" maxlength="3" style="height:35px; top:7px; border-radius:7px;">&nbsp;_
               <input class="col-md-2" type="text" name="user_phone" maxlength="4" style="height:35px; top:7px; border-radius:7px;">&nbsp;_
               <input class="col-md-2" type="text" name="user_phone" maxlength="4" style="height:35px; top:7px; border-radius:7px;">
               </div>
           	  </td> 
           </tr>      
           
           <tr class="member" class="email">
               <th class="col-md-3"><p>이메일</p></th>
               <td style="text-align:left;">
               <input class="col-md-6" id="email" name="user_email" type="email" maxlength="50" placeholder="이메일을 입력해 주세요." style="height:35px; top:10px; border-radius:7px;">
               <div id="emailError" class="error"></div></td>
           </tr>
           
         <tr class="member">
            <th class="col-md-3"><p>생년월일</p></th>
            <td style="text-align:left;">
            <input class="col-md-6" type="date" name="user_birth" placeholder="생일을 입력하세요" style="height:35px; top:10px; border-radius:7px;"></td>
         </tr> 
         <tr> 
            <td colspan="2" align="center">
               <input id="write" type="submit" value="회원가입">
               <input type="reset" value="취소">
            </td>
         </tr> 
      </table>
      </div> 
   </form>

</body>
<!-- 비밀번호 확인  -->
<script type="text/javascript">
	function pass_check(){
		var user_pw = document.getElementById('user_pw').value;
		 if(document.getElementById('user_pw').value !='' && document.getElementById('pass_check').value!=''){
             if(document.getElementById('user_pw').value==document.getElementById('pass_check').value){
                 document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                 document.getElementById('check').style.color='blue';
             }
             else{
                 document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                 document.getElementById('check').style.color='red';
             }
         }
     };

<!-- 주소 입력관련 스크립트 -->
   $(document).ready(function() {
      
      $("#searchAdd").click(function(event) {
         event.preventDefault();
         postcode();

      });
      
     
       
       function postcode() {
           new daum.Postcode({
               oncomplete: function(data) {
                   var roadAddr = data.roadAddress; // 도로명 주소 변수
                   var extraRoadAddr = ''; // 참고 항목 변수
                   
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