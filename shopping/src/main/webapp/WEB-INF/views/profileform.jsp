<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="include/header.jsp" %>
<%@ include file="include/menu.jsp" %>
<script><!-- 자바스크립트 -->
	<!--JQuery-->
	<!--문자에 스크립트를 준비-->
	$(document).ready(function(){
		$("#btn_Update").click(function(){//아이디명이 btn_Update에서 클릭이 발생하면
			if(confirm("수정하시겠습니까?")){//수정하시겠습니까 메시지에서 예를 누르면
				document.form1.action="${path}/user/update";
				document.form1.submit();
			}
		})
	});

</script>
<meta charset="UTF-8">
<!-- 아이디,비밀번호,이름,전화번호,생년월일,이메일 -->
</head>
<body>
<p>profile</p>
<div class="container mt-3">
 	<table class="table" border=10 bordercolor="gray" class="ec-base-box typeMember gMessage ">
    	<thead>
    		<tr>
      			<td align="center"><img src="" alt="" onerror="this.src='//img.echosting.cafe24.com/skin/base/member/img_member_default.gif';" class="myshop_benefit_group_image_tag"/></td>
    	    	<td colspan="2">안녕하세요 ${user_id}님 [ OTSAYOO ] 옷사줘 입니다.</br>저희 쇼핑몰을 이용해 주셔서 감사합니다.</td>
    		</tr>
    	</thead>
	</table>
	<form name="form1" method="post" action="${path }/user/update">
    <table border="1" width="1140px">
	    <tr class="id">
			<th scope="row"><img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"/>아이디(수정불가)</th>
			<td><input name="user_id" value="${dto.user_id}" readonly="readonly"></td>
		</tr>
		
		<tr class="pw">	
			<th>비밀번호</th>
			<td><input type="password" name="user_pw"></td>
		</tr>
		
		<tr class="name">
			<th scope="row"><img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"/>이름(수정불가)</th>
			<td><input name="user_name" value="${dto.user_name}" readonly="readonly"></td>
		</tr>
		
		<tr class="address">
		<th>주소</th>
			<td>
				<input id="postcode1" name="postcode1" fw-filter="isLengthRange[1][14]" fw-label="우편번호1" fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" maxlength="14" value="" type="text"  />                    <a href="#none" class="btnNormal" onclick="ZipcodeFinder.Opener.bind('postBtn', 'postcode1', 'postcode2', 'addr1', 'layer', 'ko_KR');" id="postBtn">우편번호</a><br/>
				<input id="addr1" name="addr1" fw-filter="" fw-label="주소" fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" value="" type="text"  /> 기본주소<br/>
				<input id="addr2" name="addr2" fw-filter="" fw-label="주소" fw-msg="" class="inputTypeText" placeholder="" value="" type="text"  /> 상세주소                 
			</td>
		</tr>
		
		<tr class="phone">	
			<th>전화번호</th>
			<td>
				<select id="user_phone" name="user_phone" fw-filter="isNumber&isFill" fw-label="휴대전화" fw-alone="N" fw-msg=""  >
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>
				-<input id="user_phone2" name="user_phone" maxlength="4" fw-filter="isNumber&isFill" fw-label="휴대전화" fw-alone="N" fw-msg="" value="${dto.user_phone}" type="text"  />
				-<input id="user_phone3" name="user_phone" maxlength="4" fw-filter="isNumber&isFill" fw-label="휴대전화" fw-alone="N" fw-msg="" value="${dto.user_phone}" type="text"  />
				<!-- <input type="text" name="user_phone" value="${dto.user_phone}">  -->
			</td>
		</tr>
		
		<tr class="birth">	
			<th>생년월일</th>
			<td><input type="date" name="user_birth" value="${dto.user_birth}"> </td>
		</tr>
		
		<tr class="email">	
			<th>이메일</th>
			<td><input name="user_email" value="${dto.user_email }"></td>
		</tr>
		
		<tr>
			<td colspan="12" align="center">
				<input type="button" value="등록" onclick="location.href='${path }/profileform'"/>
				<input type="button" value="취소" onclick="location.href='${path }/mypageform'"/>
			</td>
		</tr>
	</table>
	</form>
</div>
</body>
<%@ include file="include/footer.jsp" %>
</html>