<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Top</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script
 src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
 src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
 src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link href="/resources/css/main.css" rel="stylesheet">
<script src="/resources/js/upload.js" type="text/javascript"></script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
	#text_in_the_image{
		float: left;
		margin-top: 50px;
		margin-left: 130px;
		text-align: left;
	}
	
	#text_in_the_image h1{

		font-size: 5em;
		font-family: 'Impact';
	}
	
	#text_in_the_image h3{

		font-size: 3em;
		font-family: 'Copperplate';
	}	
	
	#text_in_the_image p{

		font-size: 8em;
		font-family: 'Impact';
	}	
	
	#text_in_the_image p span{
	
		text-align: center;
		font-family: 'Impact';
		color: red;
		text-shadow: 3px 4px 5px gray;
	}
	
	.container{
		margin-top: 50px;
	}
	
	.products li{
		list-style: none;
	}
	
	.products li .scale{
		text-align: center;
		font-family: '나눔명조 Bold';
	}
	
	.nav li{
		cursor: pointer;
	}

	
</style>
</head>
<body>
	<div class="container">

		<c:set value="${orderVO}" var="vo"/>
		<div class="row" style="text-align: center;">
			<h1 class="page-header" style="margin-bottom: 50px;">주문이 완료되었습니다.</h1>
			<table class="table table-hover" style="margin: auto; border-bottom: 1px solid #D5D5D5;">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center !important;">상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>옵션</th>
						<th>결제금액</th>
					</tr>
				</thead>
				<tbody style="text-align: left; vertical-align: middle;">
						<tr>
							<td style="text-align: center;"><img alt="thumbnail" src="/resources/upload${vo.product_thumbnail}" width="30%">
							<input type="hidden" value="${vo.product_id}" name="product_id" id="product_id">
							</td>
							<td>${vo.product_name}<br>${vo.product_info}</td>
							<td><fmt:formatNumber type="number" value="${vo.product_price}"/>&nbsp;원</td>
							<td>${vo.order_con}</td>
							<td>${vo.product_opt}</td>
							<td><fmt:formatNumber type="number" value="${vo.total_amount}"/>&nbsp;원</td>
						</tr>
				</tbody>
			</table>
		</div>
		
		<hr>
		
		<div class="row" style="text-align: center;">
			
			<table class="table table-hover" style="margin: auto; border-bottom: 1px solid #D5D5D5;">
				<thead>
					<tr>
						<th>주문자</th>
						<th>배송지</th>
						<th>전화번호</th>
						<th>배송상태</th>
						<th>배송메세지</th>
					</tr>
				</thead>
				<tbody style="text-align: left;">
						<tr>
							<td>${vo.user_name}</td>
							<td>${vo.postcode}<br>${vo.user_address1}</td>
							<td>${vo.postcode}<br>${vo.user_address2}</td>
							<td>${vo.postcode}<br>${vo.user_address3}</td>
							<td>${vo.user_phone}</td>
							<td id="del_situ"></td>
							<td>${vo.order_message}</td>
						</tr>
				</tbody>
			</table>
		</div>
		
		<div class="row" style="margin: 80px 0; text-align: center;">
			<button class="btn btn-default back_btn">쇼핑을 계속하기</button>
			<button class="btn btn-default mycart_btn">장바구니로 이동하기</button>
		</div>
	</div>

<script type="text/javascript">
	
	$(document).ready(function() {
		
		var userid = $("#login_user_id").val();
		var productId = $("#product_id").val();
		
		
		$(".back_btn").click(function(event) {
			event.preventDefault();
			location.assign("/");
		});

		$(".mycart_btn").click(function(event) {
			event.preventDefault();
			location.assign("/order/mycart/" + user_id);
			
		});
		
		$("li").on('click', function() {
			var productDist = $(this).attr("value");
			location.assign("/product/" + product_desc);
		});
		
		$("#go_to_member_insert").click(function(event) {
			event.preventDefault();
			
			location.assign("/member/insert");
		});
		
		$("#mypage_btn").click(function(event) {
			event.preventDefault();
			var userid = $("#login_user_id").val();
			
			location.assign("/member/read/" + user_id);
		})
		
		$("#logout_btn").click(function(event) {
			event.preventDefault();
			
			var logout = confirm("로그아웃 하시겠습니까?");
			
			if (logout) {
				location.assign("/member/logout");
			}
		});
		
		$("#go_to_adminPage").click(function(event) {
			event.preventDefault();
			
			location.assign("/admin/main");
		
		});
		
		$("#searchAdd").click(function(event) {
			event.preventDefault();
			postcode();

		});
	    
	    function del_situ() {
	    	var situ = "<c:out value='${dto.deliver_situ}'/>";
	    	if (situ == '0') {
				situ = "배송 준비중";
			} else if (situ == '1') {
				situ = "배송중";
			} else if (situ == '2') {
				situ = "배송 완료";
			}
	    	
	    	$("#del_situ").html(situ);
		}
	
	});
	
</script>

</body>
</html>
