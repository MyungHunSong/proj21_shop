<%@page import="proj21_shop.dto.qna.SearchCriteria"%>
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
<script>
$(function(){
	$("#searchBtn").on("click", function(event){
		var test = $("#keywordInput").val();
				
		if(test != null){
		self.location= "/proj21_shop/listPaging${pageMaker.makeQuery(1)}"
		+"&searchType=" +$("select option:selected").val()
		+"&keyword=" + encodeURIComponent($("#keywordInput").val());
		}else if(test == null || test == ""){
			alert("공백이 존재 합니다.")
		}
			
	}) 
	
	$("#goList").on("click", function(event){
		self.location = "/proj21_shop/listPaging${pageMaker.makeQuery(1)}"
		+"&searchType=" +$("select option:selected").val();
	})
}); 
</script>

<style type="text/css">
.search_qna{
	margin-bottom: 80px;
}
#insertQnaPage{
	text-decoration:none !important;
	width:25px;
	color: #ccc;	
}

search_qna #insertQnaPage:hover{
	background-color:gray;
	color:#048ef;
}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="search_qna">
	<!-- '전체검색' = a
			'공지' = b
					'제품문의' = c 
						'환불문의' = d 
						'포인트 º 적립금' = e 
						'회원관련' = f
						'주문결제' = g
						'기타' = h -->
				<select name="searchType" id = "searchType">	
					<option value="a"><c:out value="${searchCriteria.searchType == null ? 'selected' : ' '}"/>==전체검색==</option>
					<option value="b"><c:out value="${searchCriteria.searchType eq 'b' ? 'selected' : ' '}"/>공지</option>
					<option value="c"><c:out value="${searchCriteria.searchType eq 'c' ? 'selected' : ' '}"/>제품문의</option>
					<option value="d"><c:out value="${searchCriteria.searchType eq 'd' ? 'selected' : ' '}"/>환불문의</option>
					<option value="e"><c:out value="${searchCriteria.searchType eq 'e' ? 'selected' : ' '}"/>포인트 º 적립금</option>
					<option value="f"><c:out value="${searchCriteria.searchType eq 'f' ? 'selected' : ' '}"/>회원관련</option>
					<option value="g"><c:out value="${searchCriteria.searchType eq 'g' ? 'selected' : ' '}"/>주문결제</option>
					<option value="h"><c:out value="${searchCriteria.searchType eq 'h' ? 'selected' : ' '}"/>기타</option>
				</select>

				<input type="text" class ="search_control"
				 name="keyword" id="keywordInput"  value = "${searchCriteria.keyword}" placeholder="검색어를 입력해 주세요">
				<button type="button" id="searchBtn">검색</button>
				<button type="button" id="goList">목록</button>
				
				<c:if test="${empty authInfo}">
					<a id='insertQnaPage' href="login">글 작성하기[로그인 필요]</a>					
				</c:if>
				<c:if test="${!empty authInfo}">
					<a id = 'insertQnaPage'  href="<c:url value="/qnaInsert" />">글 작성 하기</a>
				</c:if>
				<!-- value 이름과 getMapping 이름을 일치 시켜 줘야한다. -->
		</div>
			
			
</body>
</html>