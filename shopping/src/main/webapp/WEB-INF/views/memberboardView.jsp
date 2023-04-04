<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
<%@ include file="include/header.jsp" %>
	<script>
		// 게시글 수정
		$(doxument).ready(function(){
			$("#btnupdate").click(function(){
				var cs_title = ${"#cs_title"}.val();
				var cs_context = ${"#cs_context"}.val();
				if(cs_title == ""){
					alert("제목을 입력하세요");
					document.form.cs_title.focus();
					return;
				}
				if(cs_context == "") {
					alert("내용을 입력하세요");
					document.form.cs_context.focus();
					return;
				}
				document.form.action="${path}/updateMemberboard.do"
				document.form.submit();
			});
			// 게시글 삭제
			$("#btndelete").click(function(){
				var count = "${count}"
				if(count > 0) {
					alert("댓글이 있는 게시물은 삭제할 수 없습니다");
					return;
				}
				if(confirm("삭제하시겠습니까?")){
					document.form.action = "${path}/deleteMemberboard.do";
					document.form.submit();	
				}
			});
			
			// 목록 이동
			$("#btnList").click(function(){
				location.href="${path}/memberboardList.do?curPage=${curpage}
				&searchOption=${searchOption}&keyword=${keyword}";
			});
			
			// 댓글 입력
			$("#btnReply").click(function(){
				// reply(); // 폼데이터 형식
				replyJson(); // json 형식
			});
			//댓글 목록
			// listReply("1") // 댓글 목록 불러오기
			// listReply2() // json 방식
			listReplyRest("1"); // rest 방식
		});
		// 댓글 입력 함수(폼 데이터 방식)
		function reply(){
			var replytext=${"#replytext"}.val();
			var bno="${dto.cs_id}"
			var secretReply = "n";
			if( $("#secretReply")).is(":checked") ){
				secretReply = "y";
			}
			// 비밀댓글 파라미터 추가
			var param="replytext="+replytext+"&cs_id="+cs_id+"&secretReply="+secretReply;
			$.ajax({
				type: "post", url : "${path}/insertReply.do", data: param, success: function(){
					alert("댓글이 등록되었습니다");
					listReply("1");
				}
			});
		}
		
		// 댓글 입력 함수(json 방식)
		function replyJson(){
			var replytext=$("#replytext").val();
			var cs_id="${dto.cs_id}"
			// 비밀댓글 체크 여부
			var secretReply = "n";
			// 태그.is(":속성") 체크여부 true/false
			if( $("#secretReply").is(":checked") ){
				secretReply = "y";
			}
			$.ajax({
				type: "post", url : "${path}/insertRest.do", headers:{"Content-Type" : application/json"
					}, dateType: "text", data: JSON.stringify({
						cs_id : cs_id, replytext : replytext, secretReply : secretReply
					}),
					success: function(){
						alert("댓글이 등록되었습니다.");
						// 댓글 입력 완료 후 댓글 목록 불러오기 함수 호출
						// listReply("1"); // Controller 방식
						// listReply2(); // json 방식
						listReplyRest("1"); // rest 방식
					}
			});
			
		}
		// 댓글 목록 // Controller 방식
		function listReply(num){
			$.ajax({
				type : "get",
				// contentType: "application/json", // RestController 방식이여서 생략이 가능
				url : "${path}listJson.do?cs_id=${dto.cs_id}&curPage="+num,
						success : function(result){
							console.log(result);
							var output = "<table>";
							for(var i in result){
								output +="<tr>";
								output +="<td>"+result[i].user_id;
								output +="("+changeDate(result[i].regdate)+")<br>";
								output += result[i].replytext+"</td>";
								output += "<tr>";
							}
							output += "</table>";
							$("#listReply").html(output);
				}
			});
		}
		// 댓글 목록 // 날짜 형식 변환 함수
		function changeDate(date){
			date = new Date(parseInt(date));
			year = date.getFullYear();
			month = date.getMonth();
			day = date.getDate();
			hour = date.getHours();
			minute = date.getMinutes();
			second = date.getSeconds();
			strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
			return strDate;
		}
		
		// 댓글 목록 // rest 방식
		function listReplyRest(num){
			$.ajax({
				type : "get", url : "${path}/replylist.do${dto.cs_id}/"+num,
				success: function(result){
					$("#listReply").html(result);
				}
			});
		}
		
		// 댓글 수정화면 생성 함수
		function showReplyModify(rno){
			$.ajax({
				type : "get", url : "${path}/replydetail.do/"+rno,
				success: function(result){
					$("#modifyReply").html(result);
					// 태그.css("속성", "값")
					$("#modifyReply").css("visibility", "visible");
				}
			})
		}
	</script>
	<style>
		#modifyReply {
		width: 600px;
		height: 130px;
		background-color : gray;
		padding: 10px;
		z-index: 10;
		visibility: hidden;
		}
	</style>
</head>
<body>
<%@ include file="include/menu.jsp" %>
	<h2>게시글 보기</h2>
	<form name="form" method="post">
		<div>
			작성일자 : <fmt:formatDate value="${dto.cs_date}" pattern= "yyyy-MM-dd a HH:mm:ss"/>
		</div>
		<div>
			조회수 : ${dto.cs_viewcnt}
		</div>
		<div>
			제목
			<input name="cs_title" id="cs_title" size="80" value="${dto.cs_title}" placeholder="제목을 입력 하세요">
		</div>
		<div>
			내용
			<textarea name="cs_context" id="cs_context" value="${dto.cs_context}" rows="4" cols="80" placeholder="내용을 입력하세요">
			${dto.cs_context}</textarea>
		</div>
		<div>
			아이디
			<%-- <input name="cs_writer" id="cs_writer" value="${dto.cs_writer}" placeholder="이름을 입력하세요"> --%>
			${dto.user_id}
		</div>
	<div style="width: 650px; text-align:center;">
		<input type="hidden" name="cs_id" value="${dto.cs_id}">
		<!-- 본인이 쓴 게시물만 수정, 삭제가 가능 -->
		<c:if test="${sessionScope.user_id == dto.cs_writer}">
			<button type="button" id="btnUpdate">수정</button>
			<button type="button" id="btndelete">삭제</button>
		</c:if>
			<button type="button" id="btnList">목록</button>
	</div>
	</form>
	
	<div style="width:650px; text-align:center;">
		<br>
		<!-- 로그인 한 회원에게만 댓글 작성 가능 -->
		<c:if test="${sessionScope.user_id != null}">
			<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 입력하세요"></textarea>
		<br>
		<!-- 비밀댓글 체크박스 -->
		<input type="checkbox" id="secretReply">비밀 댓글
		<button type="button" id="btnReply">댓글 작성</button>
		</c:if>
	</div>
	
	<!-- 댓글 목록 출력 위치 -->
	<div id="listReply"></div>
</body>
</html>