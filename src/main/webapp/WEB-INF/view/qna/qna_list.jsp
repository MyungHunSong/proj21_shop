<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="qna_board">
		Q&A
		<table>
			<tr>
				<td>번호</td>
				<td>작성자</td>
				<td>문의사항</td>
				<td>제목</td>
				<td>날짜</td>
				<td>조회수</td>
			</tr>
			<c:forEach var="articles" items="${articles}">
				<tr>
					<td>${articles.qOp}</td>
					<td>${articles.qMember}</td>
					<td>${articles.qOption}</td>
					<td>${articles.qTitle}</td>
					<td>${articles.qDate}</td>
					<td>${articles.qHit}</td>
				</tr>
			</c:forEach>
			<!-- <tbody id='load'>
					</tbody> -->
		</table>

		<div>
			<div>
				<ul>
					<c:if test="${pageMaker.prev}">
						<li><a
							href="/proj21_shop/listPaging?page=${pageMaker.startPage - 1}">이전</a></li>
					</c:if>
					
					
					
					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li
							<c:out value="${pageMaker.cri.page == idx}"/>>
							<a href="/proj21_shop/listPaging?page=${idx}">${idx}</a>
						</li>
					</c:forEach>
					
					
					
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="/proj21_shop/listPaging?page=${pageMaker.endPage + 1}">다음</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>