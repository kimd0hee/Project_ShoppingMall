<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="UTF-8">

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
      padding-left:1px;
      
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
 



img.otsajo {
width : 230px;
height : 80px;
text-align:center;
margin: auto;
display: flex;
justify-content: center;
align-items: center;

} 
#abc {
  position: fixed;
  top: 240px; /* 테이블이 보여질 위치 */
  z-index: 1;
}

.container {
  display: flex;

  justify-content: center;
}

.table-wrapper {
  display: flex;
  justify-content: space-between;
  width: 100%;
}

@media (max-width: 600px) {
  .container {
    flex-direction: column;
    align-items: center;
  }
  
  .table-wrapper {
    width:100%;
  }
}

@media (max-width: 400px) {
  .table-wrapper {
    flex-direction: row;
  }
}
</style>


    
</head>

<body>
<br>
<a href="#"><img class="otsajo" src="img/logo.jpg" alt=""></a>
<br>

<div class="body-container">
  <div class="container" id="body_con" style="width:90%;">
    <div class="table-wrapper" id="detail" style="float:left;">
      <div id="mainImg">
        <c:forEach var="product_url" items="${vo.product_url}">
          <img src="${path}/img/product/${product_url}" width="500px;" height="500px;" alt="img"><br>
        </c:forEach>
      </div>
    </div>
    <div class="table-wrapper" id="detail2" style="float:right;">
      <table style="width:500px;" id="abc">
        <tr id="tb_t">
          <td id="pro_name" class="tb_row">상품명 : ${vo.product_name}
            <div>
              가격 : <fmt:formatNumber value="${vo.product_price}" pattern="###,###,###"/>원
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
          <td class="tb_row" id="p_desc" style="">상품내용 :<br> ${vo.product_desc}</td>
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



  
  
</body>
<script>
window.addEventListener("scroll", function() {
  var abc = document.getElementById("abc");
  var targetPosition = 1500; // 멈추고자 하는 위치의 값 (예: 500px)

  if (window.pageYOffset >= targetPosition) {
    abc.style.position = "absolute";
    abc.style.top = targetPosition + "px";
  } else {
    abc.style.position = "fixed";
    abc.style.top = "240px";
  }
});
</script>



<%@ include file="include/footer.jsp" %>