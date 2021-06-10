<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/proj21_shop/resources/member/css/mypage.css" />
</head>
<body>
	<section id="mypage">
		<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
		<h3>마이페이지</h3>
		<div class="box1">
			<a href="#">내가 쓴 글(후기, QNA)</a>
		</div>
		<div class="box2">
			<a href="modify">EDIT</a>
		</div>
		<div class="box3">
			<a href="#">BASCKET</a>
		</div>
		<br>
		<div class="box4">
			<a href="#">ORDER</a>
		</div>
		<div class="box5">
			<a href="delete">QUIT(회원 탈퇴)</a>
		</div>
	</section>
	<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</body>
</html>