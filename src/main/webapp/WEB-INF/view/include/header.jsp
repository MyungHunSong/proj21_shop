<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/proj21_shop/resources/include/css/header.css">
<script>
	$(function(){
		$('.headerImg').click(function(){
			location.href='main';
		});
	});
</script>
</head>
<body>
	<header>
		<ul>
			<!-- 각자 넘어갈시 필요한 페이지를 기입해주세요. --> 
			<li><a href="login">로그인</a></li>
			<li><a href="register">회원가입</a></li>
			<li><a href="#">마이페이지</a></li>
			<li><a href='<c:url value="/qna_main"/>'>고객센터</a></li>
		</ul>
			<img alt="헤더 오른쪽 옷걸이" src="/proj21_shop/resources/banner/headerR.jpg" class="headerImg" >
	</header>
</body>
</html>