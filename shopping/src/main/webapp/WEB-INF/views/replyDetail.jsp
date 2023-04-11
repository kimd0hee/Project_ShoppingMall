<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="UTF-8">

<head>
	<%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    
    <script>
    	$("#btnReplyUpdate").click(function() {
    		var datailReplytext=$("#detailReplytext").val();
    		$.ajax({
    			type:"put",
    			url:"${path}/reply/update/${vo.rno}",
    			headers:{
    				"Content-Type":"application/json"
    			},
    			data:JSON.stringify({
    				replytext:detailReplytext
    			}),
    			dataType:"text",
    			success:function(result){
    				if(result=="success"){
    					$("#modifyReply").css("visibility", "hidden");
    					listReplyRest("1");
    				}
    			}
    		});
    	});
    	
    	$("#btnReplyClose").click(function() {
    		$("#modifyReply").css("visibility", "hidden");
    	});
    
    	$("#btnReplyDelete").click(function() {
    		if(confirm("삭제하시겠습니까?")) {
    		$.ajax({
    			type:"delete",
    			url:"${path}/reply/delete/${vo.rno}",
    			success:function(result){
    				alert("삭제되었습니다.");
    				$("#modifyReply").css("visibility", "hidden");
    				listReplyRest("1");
    			}
    		}
    	}
    });
</script>
</head>

<body>
	댓글 번호 : ${vo.rno}<br>
	<textarea id="detailReplytext" rows="5" cols="82">${vo.replytext}</textarea>
	<div style="$text-align:center;">
		<c:if test="${sessionScope.userId==vo.replyer}">
			<button type="button" id="btnReplyUpdate">수정</button>
			<button type="button" id="btnReplyDelete">삭제</button>
		</c:if>
			<button type="button" id="btnReplyClose">닫기</button>
	</div>	
</body>


<%@ include file="include/footer.jsp" %>
</html>