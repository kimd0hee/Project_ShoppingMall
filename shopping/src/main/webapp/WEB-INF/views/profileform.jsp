<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="include/header.jsp" %>
<%@ include file="include/menu.jsp" %>
<meta charset="UTF-8">
<!-- 아이디,비밀번호,이름,전화번호,생년월일,이메일 -->
</head>
<body>
<div class="container mt-3">
    <table class="table" border=10 bordercolor="gray">
       <thead>
          <tr>
               <td align="center"><img src="" alt="" onerror="this.src='//img.echosting.cafe24.com/skin/base/member/img_member_default.gif';" class="myshop_benefit_group_image_tag"/></td>
              <td colspan="2">안녕하세요 ${user_id}님 [ OTSAYOO ] 옷사줘 입니다.</br>저희 쇼핑몰을 이용해 주셔서 감사합니다.</td>
          </tr>
       </thead>
   </table>
   <form name="form1" method="post" action="${path}/mypageform.do">
    <table border="1" width="1140px">
       <tr>
         <th scope="row"><img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"/>아이디</th>
         <td><input name="user_id" value="${user_id}" readonly="readonly"></td>
      </tr>

      <tr>
         <th scope="row"><img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"/>이름</th>
         <td><input name="user_name" value="${user_name}" readonly="readonly"></td>
      </tr>
      
      <tr>
      <th>주소</th>
         <td>
            <input name="user_address1" value="${user_address1}" readonly="readonly">&nbsp;<input name="user_address2" value="${dto.user_address2}" readonly="readonly">&nbsp;기본주소<br/>
            <input name="user_address3" value="${user_address3}" readonly="readonly"/> 상세주소                 
         </td>
      </tr>
      
      <tr>   
    <th>전화번호</th>
    <td><input name="user_phone" value="${user_phone}" readonly="readonly"></td>
</tr>
      
      <tr>   
         <th>생년월일</th>
         <td><input type="date" value="${user_birth}" readonly="readonly"></td>
      </tr>
      
      <tr>   
         <th>이메일</th>
         <td><input value="${user_email}" readonly="readonly"></td>
      </tr>
   </table>
      <td colspan="12" align="center">
            <input type="button" value="돌아가기" onclick="location.href='${path}/mypageform.do'"/>
         </td>
   </form>
</div>
</body>
<%@ include file="include/footer.jsp" %>
</html>