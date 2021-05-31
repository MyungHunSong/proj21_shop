<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js">
var start_year="2015";// 시작할 년도
var today = new Date(); var today_year= today.getFullYear();
var index=0; for(var y=start_year; y<=today_year; y++){ //start_year ~ 현재 년도 
	document.getElementById('select_year').options[index] = new Option(y, y); index++; } index=0; for(var m=1; m<=12; m++){ document.getElementById('select_month').options[index] = new Option(m, m); index++; } lastday(); function lastday(){ //년과 월에 따라 마지막 일 구하기 var Year=document.getElementById('select_year').value; var Month=document.getElementById('select_month').value; var day=new Date(new Date(Year,Month,1)-86400000).getDate(); var dayindex_len=document.getElementById('select_day').length; if(day>dayindex_len){ for(var i=(dayindex_len+1); i<=day; i++){ document.getElementById('select_day').options[i-1] = new Option(i, i); } } else if(day<dayindex_len){ for(var i=dayindex_len; i>=day; i--){ document.getElementById('select_day').options[i]=null; } } }

</script>
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