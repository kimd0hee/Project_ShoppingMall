<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
<%@ include file="include/header.jsp" %>
<script>
		$(document).ready(function(){
			$("#btnWrite").click(function(){
				location.href = "${path}/memberboardWrite.do";
			});
		});

		function list(page){
			location.href="${path}/memeberboardList.do?curPage="page+"&searchOption-
					${map.searchOption}"+ "&keyword="${map.keyword}";
					}
</script>
</head>
<body>
<%@ include file="include/menu.jsp" %>
	<h2>게시글 목록</h2>
	<form name="form" method="post" action="${path}/memberboardList.do">
		<select name="searchOption">
			<option value="all" <c:out value="${map.searchOption == 'all'?'seleted':''}"/> >제목+이름+제목</option>
			<option value="user_id" <c:out value="${map.searchOption == 'user_id'?'seleted':''}"/> >아이디 </option>
			<option value="cs_context" <c:out value="${map.searchOption == 'cs_context'?'seleted':''}"/> >내용</option>
			<option value="cs_title" <c:out value="${map.searchOption == 'cs_title'?'seleted':''}"/> >제목</option>
		</select>
		<input name="keyword" value="${map.keyword}">
		<input type="submit" value="조회">
		<!-- <c:if test="${sessionScope.user_id != null}"> -->
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
		<c:forEach var="row" items="${map.list}">
			<tr>
				<td>${row.cs_id}</td>
				<td><a href="${path}/viewMemberboard.do?cs_id=${row.cs_id}
				&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.cs_title}
				<c:if test="${row.cs_recnt > 0}">
				<span style="color : red;">(${row.cs_recnt})</span>
				</c:if>
				</a>
				</td>
				<td>${row.user_id}</td>
				<td>
					<fmt:formatDate value="${row.cs_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>${row.cs_viewcnt}</td>
			</tr>
		</c:forEach>
		<tr>input type submit 위치 왼쪽 정렬
			<td colspan="5">
			<c:if test="${map.boardPager.curBlock > 1}">
				<a href="javascript:list"('${map.boardPager.prevPage}')">[이전]</a>
			</c:if>
			<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.boardPager.curPage}">
						<span style="color:red">${num}</span>&nbsp;
					</c:when>
					<c:otherwise>
						<a href="javascript:list('${num}')">${num}</a>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
				<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
					<a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
				</c:if>
				
				<c:if test="${map.boardPager.curPage <=boardPager.totPage}">
					<a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
				</c:if>
			</td>
		</tr>
	</table>
</body>
</html>