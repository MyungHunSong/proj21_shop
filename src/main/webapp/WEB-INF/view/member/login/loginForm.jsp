<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="css/member/loginForm.css">
</head>
<body>
	<h1>회원 로그인</h1>
	<section id="loginFormArea">
		<form action="login" method="post">
			<div>
				<table>
					<tr>
						<td><label for="id">아이디 </label></td>
						<td><input type="text" name="id" id="id"></td>
					</tr>
					<tr>
						<td><label for="passwd">비밀번호 </label></td>
						<td><input type="password" name="passwd" id="passwd" /></td>
				</table>
				<input type="submit" value="로그인" id="selectButton" /><br> <input
					type="button" value="회원가입" id="memberButton"
					onClick="location.href='register'" />
			</div>
		</form>
	</section>
</body>
</html>