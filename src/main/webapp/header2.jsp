<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- <link href="${contextPath}/resources/admin/common/css/header2.css" rel="stylesheet"> --%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<style type="text/css">
* {padding: 0;	margin: 0; text-decoration: none; list-style: none;}
body {background: no-repeat center top/100% auto;}
.nav {position: fixed; left: -100px; top: 0; width: 300px; height: 100%; background: #ffff80;
border-radius: 0 20% 80% 0; transition: all .4s;}
.nav.on {left: 0; border-radius: 0;}
.nav nav {opacity: 0; transition: all .5s .2s;}
.nav.on nav{opacity: 1;}
.nav .menu{position: absolute; right:100px; top: 40px; z-index: 10; display: block; width: 50px; height: 50px;}
.nav .menu i { position: absolute; font-size: 0;}
.nav .menu span { display: block; width: 100%; height: 5px; background: black;  transition:all .5s;}
.nav .menu span ~ span { margin:10px 0 0;}
.nav .menu span:nth-of-type(1) { transform:rotate(0deg) translateY(0); transform-origin:left top; }
.nav .menu span:nth-of-type(2) { transform: translateX(0); opacity: 1;}
.nav .menu span:nth-of-type(3) { transform:rotate(0deg); transform-origin:left top;}
.nav .menu.on span:nth-of-type(1) { transform:rotate(45deg) translateY(-6px);}
.nav .menu.on span:nth-of-type(2) { transform: translateX(40px); opacity: 0;}
.nav .menu.on span:nth-of-type(3) { transform:rotate(-45deg); }
.nav nav {padding: 100px 50px 0;}

input[id*="answer"] {display:none;}
input[id*="answer"] + label {display:block; padding:20px; border:1px solid #232188; border-bottom:0; color: #fff; font-weight: 900; background: #3634a5; cursor: pointer; position:relative;}
input[id*="answer"] + label em {position: absolute; top: 50%; right: 10px; width:30px; height:30px; margin-top:-15px; display:inline-block; background: url('./images/arrow.png') 0 0 no-repeat;}
input[id*="answer"] + label + div {max-height: 0; transition: all .35s; overflow:hidden; background: #ebf8ff; font-size: 11px;}
input[id*="answer"] + label + div a{display:inline-block; padding: 20px;}
input[id*="answer"]:checked + label + div {max-height:100px}
input[id*="answer"]:checked + label em {background-position: 0 -30px;}

</style>
<!-- jQuery sidebarCustom Script -->
<script type="text/javascript">
	$(document).ready(function() {
		$('.nav .menu').on('click', function() {
			$(this).toggleClass('on');
			$('.nav').toggleClass('on');
		});
	});
</script>
</head>
<body>
	<div class="nav">
		<a href="#a" class="menu">
			<i>햄버거 메뉴</i>
			<span></span>
			<span></span>
			<span></span>
		</a>
		<nav>
			<div id="accordion">
				<input type="checkbox" id="answer01">
				<label for="answer01">제목<em></em></label>
				<div><a href="">링크 링크 링크</a></div>
				<div><a href="">링크 링크 링크</a></div>
				<input type="checkbox" id="answer02">
				<label for="answer02">제목<em></em></label>
				<div><a href="">링크 링크 링크</a></div>
				<input type="checkbox" id="answer03">
				<label for="answer03">제목<em></em></label>
				<div><a href="">링크 링크 링크</a></div>
			</div>
		</nav>
	</div>
</body>
</html>