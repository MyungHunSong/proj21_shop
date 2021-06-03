<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/proj21_shop/resources/member/css/loginForm.css">
</head>
<body>
	<h1>회원 로그인</h1>
	<section id="loginFormArea">
		<form:form modelAttribute="loginCommand">
			<div>
				<table>
					<tr>
						<td><label for="id">아이디 </label></td>
						<td><input type="text" name="id" id="id"></td>
					</tr>
					<tr>
						<td><label for="password">비밀번호 </label></td>
						<td><input type="password" name="password" id="password" /></td>
				</table>
				<input type="submit" value="로그인" id="selectButton" /><br> <input
					type="button" value="회원가입" id="memberButton"
					onClick="location.href='register'" />
			</div>
		</form:form>
	</section>
</body>
</html>