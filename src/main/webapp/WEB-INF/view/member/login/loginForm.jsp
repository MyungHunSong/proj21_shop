<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${contextPath }/resources/main/css/main.css">
<link rel="stylesheet" href="${contextPath }/resources/member/css/loginForm.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="container">
<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
	<h1>회원 로그인</h1>
	<section id="loginFormArea">
	<!-- 요청 파라미터의 값을 로그인 커맨드 객체로 넘겨주기
	Controller 경로 : proj21_shop.controller.member/LoginController  -->
		<form:form modelAttribute="loginCommand">
			<div>
				<table>
					<tr>
						<td><label for="id">아이디 </label></td>
						<td><input type="text" name="id" id="id"></td>
					</tr>
					<tr>
						<td><label for="password">비밀번호 </label></td>										
						<td><input type="password" name="password" id="password" value="${authinfo.password}"/></td>
				</table>
				<input type="submit" value="로그인" class="button" />
				<!-- 회원가입 페이지로 이동 -->
				<input type="button" value="회원가입" class="button" onClick="location.href='register'" />
			</div>
		</form:form>
	</section>
<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</div>
</body>
</html>