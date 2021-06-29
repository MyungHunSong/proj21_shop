<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" href="${contextPath }/resources/main/css/main.css">
<link rel="stylesheet" href="${contextPath }/resources/member/css/deleteForm.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container">
	<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
	<h3>회원탈퇴</h3>
	<section id="deleteFormArea">
		<form:form modelAttribute="DeleteRequest">
			<form:errors />
			<table class="type02">
				<tr>
					<th scope="row"><label for="passwd">비밀번호</label></th>
					<td><form:password path="password" /></td>
				</tr>
				<tr>
					<th scope="row"><label for="passwdConfirm">비밀번호 확인</label></th>
					<td><form:password path="passConfirm" /><span class="disMatch"></span></td>
				</tr>
			</table>
			<div>
				<input type="submit" value="탈퇴하기" id="deleteButton" /> <input
					type="button" value="취소" id="cancelButton" onClick="history.go(-1)" />
			</div>
		</form:form>
	</section>
	<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
	</div>
</body>
</html>