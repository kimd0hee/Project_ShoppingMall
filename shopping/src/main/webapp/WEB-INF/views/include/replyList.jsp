<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="UTF-8">

<head>

    <%@ include file="include/menu.jsp" %>
</head>

<body>
	<table style="width:700px">
		<c:forEach var="row" items="${list}">
		<tr>
			<td>
				${row.userName}(<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd:mm:ss"/>
				<br>
				${row.replytext}
				<br>
				<c:if test="${sessionScope.userId == row.replyer}">
					<input type="button" id="btnModify" value="수정"
					onclick="shoeReplyModify('${row.rno}')">
				</c:if>
				<hr>
			</td>
		</tr>
		</c:forEach>
		
		<tr style="text-align:center;">
			<td>
				<c:if test="${replyPager.curBlock>1}">
					<a href="javascript:listReply('1')">[처음]</a>
				</c:if>
				
				<c:if test="${replyPager.curBlock>1}">
					<a href="javascript:listReply('${replyPager.prevPage}')">[이전]</a>
				</c:if>
		
				<c:forEach var="num" begin="${replyPager.blockBegin}" end="${replyPager.blockEnd}">
					<c:choose>
						<c:when test="{num==replyPager.curPage}">
							${num}&nbsp;
						</c:when>
						<c:otherwise>
							<a href="javascript:listReply('${num}')">${num}</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:if test="${replyPager.curBlock<=replyPager.totBlock}">
					<a href="javascript:listReply('${replyPager.nextPage}')">[다음]</a>
				</c:if>
				
				<c:if test="${replyPager.curBlock<=replyPager.totBlock}">
					<a href="javascript:listReply('${replyPager.totPage}')">[끝]</a>
				</c:if>
			</td>
		</tr>
	</table>
	
	<div id="modifyReply"></div>
</body>


<%@ include file="include/footer.jsp" %>
</html>