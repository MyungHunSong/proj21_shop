<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet"
	href="/proj21_shop/resources/member/css/deleteForm.css">
</head>
<body>
	<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
	<h3>회원탈퇴</h3>
	<section id="deleteFormArea">
		<form:form modelAttribute="DeleteRequest">
		<form:errors/>
			<table class="type02">
				<tr>
					<th scope="row"><label for="passwd">비밀번호</label></th>
					<td><form:password path="password" /></td>
				</tr>
				<tr>
					<th scope="row"><label for="passwdConfirm">비밀번호 확인</label></th>
					<td><form:password path="passConfirm" /></td>
				</tr>
			</table>
			<div>
				<input type="submit" value="탈퇴하기" id="deleteButton" /> <input
					type="button" value="취소" id="cancelButton" onClick="history.go(-1)" />
			</div>
		</form:form>
	</section>
	<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</body>
</html>