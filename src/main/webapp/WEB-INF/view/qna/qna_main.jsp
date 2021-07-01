<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" href="/proj21_shop/resources/qna/css/qna_faq.css">
<link rel="stylesheet" href="/proj21_shop/resources/main/css/main.css">
<link rel="stylesheet" href="/proj21_shop/resources/qna/css/qna_main.css">
<link rel="stylesheet" href="/proj21_shop/resources/qna/css/qna_faq.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".qnaPage").on("click", function(){
		if($(".fPage").css("display") != "none"){
			$(".qPage").css("display","block");
			$(".fPage").css("display","none");
		}else if($(".fPage").css("display") != "block"){
			$(".qPage").css("display","block");
			$(".fPage").css("display","none");
		}
	})

	$(".faqPage").on("click", function(){
		if($(".qPage").css("display") != "none"){
			$(".fPage").css("display","block");
			$(".qPage").css("display","none");
		}else if($(".qPage").css("display") == "none"){
			$(".fPage").css("display","block");
			$(".qPage").css("display","none");
		}
	});
});
</script>
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
<section class = "FAQ&QNA sec">

		<nav>
			<ul class="btn">
				<li class = 'faqPage'>FAQ<p>자주 묻는 질문</p></li>
				<li class = 'qnaPage'>Q&A<p>문의하기.</p></li>
			</ul>
		</nav>
		
			<div class = 'qPage'>	
				<jsp:include page="/WEB-INF/view/qna/qna_page.jsp"></jsp:include>
			</div>
	
			<div class = 'fPage' style = "display: none">
				<jsp:include page="/WEB-INF/view/qna/faq_page.jsp"></jsp:include>
			</div>
</section>

		<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
	</div>
</body>
</html>