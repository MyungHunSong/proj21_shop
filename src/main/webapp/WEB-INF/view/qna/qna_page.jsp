<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>QNA페이지</title>
<link rel="stylesheet" href="/proj21_shop/resources/qna/css/qna_qna.css"">
<script type="text/javascript">
$(function(){
	var contextPath = "${contextPath}";
	var page = ${page}
	
	$.get(contextPath + "/api/qna/"+page,
	function(json){
		var dateLength = json.length;
		
			if(dateLength >= 1){
				var sCont = "";
				for(i = 0; i<dateLength; i++){
					sCont += "<tr>";
					sCont += "<td>" + json[i].qOp + "</td>";
					sCont += "<td>" + json[i].qMember + "</td>";
					sCont += "<td>" + json[i].qOption + "</td>";
					sCont += "<td>" + json[i].qTitle + "</td>";
					sCont += "<td>" + json[i].qDate + "</td>";
					sCont += "<td>" + json[i].qHit + "</td>";		
					sCont += "</tr>";
				}
				$("#load").append(sCont);
			}
	});
});

</script>
</head>
<body>
	<!-- Q&A 시작 -->
		<div id="qna_board">
			<table class="qna_table">
				<tr>
					<td>번호</td>
					<td>작성자</td>
					<td>문의사항</td>
					<td>제목</td>
					<td>날짜</td>
					<td>조회수</td>
				</tr>
				<tbody id='load'></tbody>
			</table>

			<!-- 페이징 -->
			<div class="div_pagenation">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li><a
						href="/proj21_shop/listPaging?page=${pageMaker.startPage - 1}">이전</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li <c:out value="${pageMaker.cri.page == idx}"/>><a
						href="/proj21_shop/listPaging?page=${idx}">${idx}</a></li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a
						href="/proj21_shop/listPaging?page=${pageMaker.endPage + 1}">다음</a></li>
				</c:if>
			</ul>
			</div>
			<!-- 페이징 끝 -->
		</div>
		<!-- Q&A 끝 -->
</body>
</html>