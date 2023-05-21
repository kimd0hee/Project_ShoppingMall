<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
	<%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
<script>
	$(document).ready(function(){
		$("#btnWrite").click(function(){
			location.href = "${path}/boardWrite.do";
		});
	});
</script>

<style>
	 a:link { color:black; text-decoration: none;}
	 a:visited {color:black; text-decoration: none;}
	 a:hover {color:dark; text-decoration: none;}

	table {
		border:1px solid black;
		text-align:center;
		border-collapse:separate;
	  	border-spacing: 0;
		margin:0 auto;
	}
	
	#padding_th {
		padding:7px;
		border-bottom:1px solid #333;
		
	}
	
	#padding_td {
		padding:7px;
		border-bottom:1px solid #FAFAFA;
	}
	
	h2 {
		text-align:center;
		margin-top:15px;
		margin-bottom:10px;
	}
	
	#div {
	   margin-left:10px;
	   margin:5px 10px;
	}
	
		
	#button1 {
		width:32px;
		height:27px;
		text-align:center;
	}
	
	#btnWrite {
		 border-radius:4px;
      background-color: #333;
	  color: #fff;
	  cursor: pointer;
	  border:1px solid black;
	  padding:3px 6px;
	}
	
	.write {
		border:1px solid black;
		float:right;
		
		
	}
	
	#t_head{
		background-color:#f8f8f8;
		border-bottom:1px solid black;
	}
	
	
</style>

</head>
<body>
<h2>게시글 목록</h2>
<div class="container">
<table class="table table-sm">
          <thead id="t_head">
            <tr>
         		<th id="padding_th" width="15%;">번호</th>
         		<th id="padding_th" width="40%">제목</th>
         		<th id="padding_th" width="15%;">이름</th>
         		<th id="padding_th" width="30%">작성일</th>
      		</tr>
          </thead>
	<tbody>
            <c:forEach var="row" items="${list}">
         <tr>
            <td id="padding_td">${row.board_id}</td>
            <td id="padding_td"><a href="${path }/boardView.do?board_id=${row.board_id }">${row.board_title }</a></td>
            <td id="padding_td">${row.board_writer}</td>
            <td id="padding_td">
               <fmt:formatDate value="${row.board_createdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
         </tr>
      </c:forEach>
          </tbody>
</table>
<button type="button" id="btnWrite" class="write">글쓰기</button>
</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>