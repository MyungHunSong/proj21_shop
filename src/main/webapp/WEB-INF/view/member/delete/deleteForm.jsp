<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
	<h3>회원탈퇴</h3>
	<section id="deleteFormArea">
		<form action="delete" method="post">
			<table>
				<tr>
					<td><label for="passwd">비밀번호</label></td>
					<td><input type="password" name="passwd" id="passwd"></td>
				</tr>
				<tr>
					<td><label for="passwdConfirm">비밀번호 확인</label></td>
					<td><input type="password" name="passwdConfirm" id="passwdConfirm"></td>
				</tr>
			</table>
		</form>
	</section>
	<input type="submit" value="탈퇴하기" id="deleteButton"/>
	<input type="button" value="취소"id="cancel" onClick="history.go(-1)" />
</body>
</html>