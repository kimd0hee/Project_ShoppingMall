<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>
<%@ include file="include/header.jsp" %>
<%@ include file="include/menu.jsp" %>
</head>
<body>   
<div id="container" class="container">
<div class="titleArea">
    <h2>My Page</h2>
<c:if test="${sessionScope.user_id == user_id}">
</c:if>
</div>
<div class="container mt-3">
  <table class="table" border=10 bordercolor="gray" class="ec-base-box typeMember gMessage ">
    <tbody>
       <tr>
            <td align="center"><img src="" alt="" onerror="this.src='//img.echosting.cafe24.com/skin/base/member/img_member_default.gif';" class="myshop_benefit_group_image_tag"/></td>
           <td colspan="2">안녕하세요 ${user_id}님 [ OTSAYOO ] 옷사줘 입니다.</br>저희 쇼핑몰을 이용해 주셔서 감사합니다.</td>
       </tr>
     </tbody>
  </table>
</div>
 <table class="table" border=1 class="ec-base-box typeMember gMessage ">
   <thead>
      <td align="center" bgcolor="gray" colspan="4" ><strong>Information</strong></td>
    </thead>
 
   <table class="table" border=1>
      <thead>
         <td class="shopMain order">
               <h3><a href="${path}/orderList.do"><strong>Order</strong></br><span>주문내역 조회</span></a></h3>
               <p><a href="#">고객님께서 주문하신 상품의<br/> 주문내역을 확인하실 수 있습니다.</a></p>
           </td>
           <td class="shopMain wishlist">
               <h3><a href="${path}/cartList.do"><strong>Cart</strong></br><span>장바구니</span></a></h3>
               <p><a href="#">장바구니에 넣어두신<br/> 상품의 목록을 보여드립니다.</a></p>
           </td>
           <td class="shopMain likeIt displaynone ">
               <h3><a href="https://www.cjlogistics.com/ko/tool/parcel/tracking"><strong>Delivery Check</strong></br><span>배송조회</span></a></h3>
               <p><a href="#">주문하신 상품의<br/>배송 조회를 보여드립니다.</a></p>
           </td>
      </thead>
      <tbody>
           <td class="shopMain profile">
               <h3><a href="${path}/profileform.do"><strong>Profile</strong></br><span>회원 정보</span></a></h3>
               <p><a href="#">회원이신 고객님의 개인정보를<br/> 관리하는 공간입니다.</a></p>
           </td>
           <td class="shopMain askboard ">
               <h3><a href="${path}/memberboardList.do"><strong>MemberBoard</strong></br><span>문의글 작성</span></a></h3>
               <p><a href="#">고객님께서 문의사항에 대하여<br/> 작성하는 공간입니다.</a></p>
           </td>
           <td class="shopMain cs ">
               <h3><a href="${path}/boardList.do"><strong>CS / Board</strong></br><span>고객센터</span></a></h3>
               <p><a href="#">공지사항 및 문의사항들에 대하여<br/>확인하실 수 있습니다.</a></p>
           </td>
      </tbody>
   </table>
</div>

</body>
<%@ include file="include/footer.jsp" %>
</html>
