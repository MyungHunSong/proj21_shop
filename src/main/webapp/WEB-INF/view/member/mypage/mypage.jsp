<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="${contextPath }/resources/member/css/mypage.css" />
<link rel="stylesheet" href="${contextPath }/resources/main/css/main.css">
</head>
<body>
<div class="container">
	<section id="mypage">
		<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
		<h3>마이페이지</h3>
		<div class="box1">
			<a href="board?memberId=${authInfo.id}"><img alt="board" src="/proj21_shop/images/board.jpg"></a>
		</div>
		<div class="box2">
			<a href="modify"><img alt="membership" src="/proj21_shop/images/membership.jpg" ></a>
		</div>
		<div class="box3">
			<a href="cart?memId=${authInfo.id}"><img alt="bascket" src="/proj21_shop/images/basket.jpg"></a>
		</div>
		<br>
		<div class="box4">
			<a href="myorder?memberId=${authInfo.id}"><img alt="order" src="/proj21_shop/images/order.jpg"></a>
		</div>
		<div class="box5">
			<a href ="delete"><img alt="quit" src="/proj21_shop/images/quit.jpg"></a>
		</div>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
	</section>
</div>
</body>
</html>