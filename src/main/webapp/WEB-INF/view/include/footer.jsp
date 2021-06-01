<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/proj21_shop/resources/include/footer.css">
<script>
	/*위, 아래 이동 jquery문*/
	$(function(){
		$("#go_top").click(function(){
			$('html, body').animate({scrollTop:0},100);
			
			var scrollHeight = $(document).height();
			$("#go_bottom").click(function(){
				$('html, body').animate({scrollTop:scrollHeight}, 100);
			});
		});
	});
</script>
</head>
<body>
	<footer>
		<section class="bottom1">
			<h3>Up Street</h3>
			<img alt="곧 이미지" src="/proj21_shop/resources/banner/bot1.jpg">
		</section>
		<section class="bottom2">
			<p>쇼핑몰 주소 : 서울</p>
			<p>쇼핑몰 전화번호 : 02-444-4444</p>
		</section>
		<section class="bottom3">	
			<p>영업 시간:<span>06:00 ~ 06:00</span></p>
			<p>은행정보:<span></span></p>
			<p>계좌 번호:940***-**-******</p>
			<p>예금주:이태훈</p>
		</section>
		<div class="scrollMenu">
			<img id="go_top" alt="상단으로 이동하기" 
			src="http://cdn1-aka.makeshop.co.kr/design/smblue111/wib_2020/img/top_go.png">
			<img id="go_bottom" alt="하단으로 이동하기" 
			src="http://cdn1-aka.makeshop.co.kr/design/smblue111/wib_2020/img/bottom_go.png">
		</div>
		</footer>
</body>
</html>