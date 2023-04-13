<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 게시글 목록</title>
<%@ include file="include/header.jsp" %>
<%@ include file="include/menu.jsp" %>

<script>
	$(document).ready(function(){
		$("#btnWrite").click(function(){
			// 페이지 주소 변경(이동)
			location.href = "${path}/memberboardWrite.do";
		});
	});
		// 원하는 페이지로 이동시 검색조건, 키워드 값을 유지
	function list(page){
		location.href="${path}/memeberboardList.do?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
	}
</script>
</head>
<body>

	<h2>회원 게시글 목록</h2>
	<form name="form" method="post" action="${path}/memberboardList.do">
		<select name="searchOption">
			<option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> >제목+이름+제목</option>
			<option value="user_name" <c:out value="${map.searchOption == 'user_name'?'selected':''}"/> >이름 </option>
			<option value="content" <c:out value="${map.searchOption == 'content'?'selected':''}"/> >내용</option>
			<option value="title" <c:out value="${map.searchOption == 'title'?'selected':''}"/> >제목</option>
		</select>
		<input name="keyword" value="${map.keyword}">
		<input type="submit" value="조회">
		<c:if test="${sessionScope.user_id != null}">
			<button type="button" id="btnWrite">글쓰기</button>
		</c:if>
	</form>
	${map.count}개의 게시물이 있습니다
	<table border="1" width="600px">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>이름</th>
			<th>작성일</th>
			<th>조회수</th>		
		</tr>
		<!-- 게시글 상세보기 페이지로 이동시 게시글 목록페이지에 있는 검색조건, 키워드 현재 페이지 값을 유지 -->
		<!-- ** 댓글이 있으면 게시글 이름 옆에 출력 -->
		<!-- 원하는 날짜 형식으로 출력하기 위해 fmt태그 사용 -->		
		<c:forEach var="row" items="${map.list}">
			<tr>
				<td>${row.bno}</td>
				<td><a href="${path}/memberboardView.do?bno=${row.bno}
				&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.title}
				<c:if test="${row.recnt > 0}">
				<span style="color : red;">(${row.recnt})</span>
				</c:if>
				</a>
				</td>
				<td>${row.user_name}</td>
				<td>
					<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>${row.viewcnt}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
				<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면 [처음]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curBlock > 1}">
					<a href="javascipt:list('1')">[처음]</a>
				</c:if>
				
				<!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curBlock > 1}">
					<a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
				</c:if>
				
				<!-- **하나의 블럭 시작페이지부터 끝 페이지까지 반복문 실행 -->
				<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
					<!-- 현재페이일경우 하이퍼링크 제거 -->
					<c:choose>
						<c:when test="${num == map.boardPager.curPage}">
							<span style="color:red">${num}</span>&nbsp;
						</c:when>
						<c:otherwise>
							<a href="javascript:list('${num}')">${num}</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
			
				<!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같은경우 [다움]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
					<a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
				</c:if>
				
				<!-- 끝 페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같을경우 [끝]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curPage <= boardPager.totPage}">
					<a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
				</c:if>
			</td>
		</tr>
	</table>
</body>
</html>