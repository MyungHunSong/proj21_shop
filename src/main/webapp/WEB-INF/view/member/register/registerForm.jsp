<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<h3>회원가입</h3>
	<section id="registerFormArea">
		<form action="register" method="post">
			<div>
				<table>
					<tr>
						<td><label for="name">이름</label></td>
						<td><input type="text" name="name" id="name"></td>
					</tr>
					<tr>
						<td><label for="id">아이디</label></td>
						<td><input type="text" name="id" id="id"></td>
					</tr>
					<tr>
						<td><label for="passwd">비밀번호</label></td>
						<td><input type="password" name="passwd" id="passwd"></td>
					</tr>
					<tr>
						<td><label for="passwdconfirm">비밀번호 확인</label></td>
						<td><input type="password" name="passwdconfirm"
							id="passwdconfirm"></td>
					</tr>
					<tr>
						<td><label for="tel">전화번호</label></td>
						<td><input type="text" name="text" id="text"></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><input type="text" name="year" id="year">년 <input
							type="text" name="month" id="month">월 <input type="text"
							name="day" id="day">일</td>
					</tr>
					<tr>
						<td><label for="gender">성별</label></td>
						<td><input type="radio" name="male" value="male">남자 <input
							type="radio" name="female" value="female">여자</td>
					</tr>
					<tr>
						<td><label for="address">주소</label></td>
					</tr>
					<tr>
						<td><label for="confirmQ">본인확인질문</label></td>

						<td><label for="답변">답변</label><input type="text"
							name="confirmQ" id="confirmQ"></td>
					</tr>
				</table>
				<input type="submit" value="회원 가입" id="registerButton" /> <input
					type="reset" value="초기화" /> <input type="button" value="취소"
					id="cancel" onClick="location.href='main'" />
			</div>
		</form>
	</section>
</body>
</html>