<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />    
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/proj21_shop/resources/include/css/header.css">
<script>
	$(function(){
		$('.headerImg').click(function(){
			location.href='main';
		})
	});
	
	
</script>
</head>
<body>
	<header>
		<ul>
			<!-- 각자 넘어갈시 필요한 페이지를 기입해주세요. --> 
			<c:if test="${empty authInfo }">
				<li><a href="login">로그인</a></li>
			</c:if>
			<c:if test="${!empty authInfo }">
				<li><a href="logout">로그아웃</a></li>
			</c:if>
			
			<c:if test="${empty authInfo }">
				<li><a href="register" id="memberShip">회원가입</a></li>
			</c:if>		
			
			<c:if test="${!empty authInfo }">
				<li><a href="register" id="memberShip" style="display: none">회원가입</a></li>
			</c:if>		
			
			<li><a href="mypage">마이페이지</a></li>
			
			<li><a href='<c:url value="/listPaging?page=1&perPageNum=10&searchType=a&keyword="/>'>고객센터</a></li>

			


		</ul>
			<c:if test="${!empty authInfo }">
			<br>
					<p class="login_member mem_id"><strong>${authInfo.id }</strong>님 반갑습니다.</p>
					<p class="login_member point">포인트: <strong>${authInfo.mPoint }P</strong>입니다</p>
			</c:if>
			<c:if test="${empty authInfo }">
				<br>
			</c:if>
	<div class="main_img"><img alt="헤더 오른쪽 옷걸이" src="/proj21_shop/resources/banner/headerR.jpg" class="headerImg" ></div>
	</header>
</body>
</html>