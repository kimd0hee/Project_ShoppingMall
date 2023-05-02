<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
	
	#detail {
		
		
	}
	
	#detail2 {
		margin-right:35px;
		text-align:left;
		padding-bottom:130px;
		
	}
	
	#img {
		padding-left:15px;
		
	}
	
	td {
		
		vertical-align: top;
	}
	
	.container {
		display:inline-block;
	}
	
	#form {
		
		text-align:right;
		
		width:90%;
		
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
		padding:18px 22px;
	}
</style>

    
</head>

<body>
   <p id="p_head">홈 > 상품목록 > ${vo.product_name}</p>
   <div id="form">
   <div id="detail" style="width:50%;  float:left;">   
   <table style="width:90%; margin-left:10px;">
      <tr>
         <td id="img">
            <img src="${path}/img/product/${vo.product_url}" width="500px;" height="350px;"  >
         </td>
         </tr>
            </table>
         </div>
         
         <div style="float:right;" id="detail2">
            <table style="height:700px; width:400px;">
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
                     <form name="form=1" method="post" action="${path}/cartInsert.do">
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
</body>


<%@ include file="include/footer.jsp" %>
</html>