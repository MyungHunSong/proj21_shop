<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>

</head>
<body>
	<h3>회원탈퇴</h3>
	<section id="deleteFormArea">
		<form:form modelAttribute="DeleteRequest">
			<table>
				<tr>
					<td><label for="passwd">비밀번호</label></td>
					<td><form:password path="password" /></td>
				</tr>
				<tr>
					<td><label for="passwdConfirm">비밀번호 확인</label></td>
					<td><form:password path="passConfirm" /></td>
				</tr>
			</table>
			<input type="submit" value="탈퇴하기" id="deleteButton" />
			<input type="button" value="취소" id="cancel" onClick="history.go(-1)" />
		</form:form>
	</section>
</body>
</html>