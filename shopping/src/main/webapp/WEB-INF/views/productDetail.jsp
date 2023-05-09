<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="UTF-8">
<meta charset="UTF-8">

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<head>
	<%@ include file="include/header.jsp" %>
    <%@ include file="./include/menu.jsp" %>
    <title>상품 상세정보</title>

<style>

	body {
     padding: 0;
     margin: 0;
     color:#000;
}

	#tb_t {
		border-top:1px solid gray;
		
	}
	
	#img {
		padding-left:15px;
		
	}
	
	td {
		
		vertical-align: top;
	}
	

	
	#price {
		vertical-align:bottom;
		font-weight:600;
		font-size:30px;
	}
	
	#pro_name {
		font-size:30px;
		font-weight:500;
		height:100px;
		vertical-align:bottom;
		padding-left:20px;
		font-color:black;
		padding:20px 0px;
	}
	
	.tb_row {
		border-bottom:1px solid black;
	}
	
	.pro_bt {
		border-radius : 50%;
		padding:0px 8px;
		background-color:white;
		font-size:20px;
		border-color:#888;
		margin-top:6px;
	}
	
	.pro_ht {
		border-radius : 50%;
		padding:4px 8px;
		background-color:white;
		font-size:20px;
		border-color:#888;
		
		
	}
	
	#p_icon {
		font-size:25px;
		font-weight:600;
		color:gray;
		width:100%;
		
	}
	
	.p_button {
		width:10%;
		float:right;
	}
	
	#local {
		
		color:#000;
		padding-top:9px;
	}
	
	#lo_icon {
		
		height:100px;
		padding:20px;
		
	}
	
	.lo_pont {
		font-weight:600;
		font-size:20px;
		display: inline-block;
		
	}
	
	#p_local {
		font-size:40px;
		padding-top:10px;
	}
	
	.i_loc {
		
		margin-left:15px;
	}
	
	#p_desc {
		
		font-size:17px;
		font-weight:500;
		height:120px;
		padding:8px 15px 0px;
	}
	
		
	#text {
		
		padding-top:80px;
		text-align:center;
	}
	
	#p_btn {
		border:1px solid black;
		border-radius:5px;
		background-color:#fff;
		font-size:20px;
		padding:10px;
		margin:0px 5px;
	}
	
	#p_amount {
		border:1px solid black;
		border-radius:5px;
		font-size:20px;
		padding:6px;
	}
	
	#option {
		font-size:15px;
	}
	
	#p_head {
		font-size:20px;
		font-weight:500;
		color:#000;
		padding:25px 22px;
		padding-left:190px;
	}
	
	
.thumbs {
   width:100px; 
   float:left;
}
.thumbs img {
    border:1px solid #ccc;
    
    margin-bottom:3px;
}
 
#mainImg {
    border:solid 1px #ccc;
    width:600px;
    height:560px;
    margin-left:110px;
}

#form {


}

.container {
	display:inline-block;
	max-width:2000px;
}

#detail {
	margin-left:170px;
	width:600px;
}
	
#detail2 {

	padding-bottom:130px;
	width:500px;
	margin-right:90px;
}	
</style>

    
</head>

<body>	

<div class="container" style="width:90%;">
   <p id="p_head">홈 > 상품목록 > ${vo.product_name}</p>
   
   <div id="form">
   <div id="detail" style="float:left;">   
   <table style="">
      <tr>
         <td id="img">
         	<div class="thumbs">
 	        	<a href="${path}/img/product/${vo.product_url}" title="img1">
         		<img src="${path}/img/product/${vo.product_url}" >
				</a>
				<a href="${path}/img/product/product-6.jpg" title="img1">
         		<img src="${path}/img/product/product-6.jpg">
				</a>
				<a href="${path}/img/product/product-3.jpg" title="img1">
         		<img src="${path}/img/product/product-3.jpg">
				</a>
            </div>
            <div id="mainImg"><img src="${path}/img/product/${vo.product_url}" alt="img" width="600px;" height="560px;" ></div>
         </td>
         </tr>
            </table>
         </div>
         
         <div style="float:right;" id="detail2">
            <table style="height:900px;">
               <tr id="tb_t">  
                  <td id="pro_name" class="tb_row">${vo.product_name}
                  	<div class="p_button">
                  	<button onclick="location.href='#'" class="pro_ht"><span class="icon_heart_alt" id="p_icon" style="padding-bottom:10px;"></span></button>
                  	<button onclick="location.href='#'" class="pro_bt"><span class="material-symbols-outlined" id="p_icon" style="margin-top:5px;">share</span></button>
                  	</div>
                  	<div>
                  	<fmt:formatNumber value="${vo.product_price}" pattern="###,###,###"/>원
                  	</div>
                  </td>
               </tr>
               
               <tr>
               	<td class="tb_row" style="height:80px;" id="local">
               	<div class="i_loc" style="align:left;">
               	<span class="material-symbols-outlined" id="p_local" id="lo_icon">local_shipping</span>
               	<p class="lo_pont" style="vertical-align:top; padding-top:20px; color:#000;">내일 출발예정</p>
               	</div>
               	</td>
               
               </tr>
               <tr>
                  <td class="tb_row" id="p_desc" >${vo.product_desc}</td>
               </tr>
               <tr>
                  <td id="text">
                     <form name="form-1" method="post" action="${path}/cartInsert.do">
                        <input type="hidden" name="product_id" value="${vo.product_id}">
                        <select name="amount" id="p_amount">
                           <c:forEach begin="1" end="10" var="i">
                              <option id="option" value="${i}">${i}</option>
                           </c:forEach>
                        </select>&nbsp;<a style="font-size:17px;">개</a>
                        <input type="submit" id="p_btn" value="장바구니에 담기">
                        <button id="p_btn" onclick="location.href='${path}/productList.do'">상품목록</button>
                     </form>    
                  </td>
               </tr>
         

   </table>
   </div>
   </div>
   </div>
   </div>
</body>

<script>
$(function(){
    $(".thumbs a").click(function(){            //클릭 시
        var imgPath = $(this).attr("href");     //클릭한 a태그의 하이퍼링크를 변수저장
        $("#mainImg>img").attr({src:imgPath})   //메인 이미지의 주소 속성에 할당
        .hide()                                 //fadein()효과를 보여주기 위해 숨김처리
        .fadeIn();                              //fadeIn()
        return false;                           //<a> 의 본래기능 (하이퍼링크) 작동방지
    });
});
</script>

<%@ include file="include/footer.jsp" %>
</html>