<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet" href="/proj21_shop/resources/css/main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script   src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
   $(document).ready(function() {
      $('.slider').bxSlider({
    	  slideWidth: 1200, 
    	  mode: 'horizontal',// 가로 방향 수평 슬라이드
    	  speed: 500,        // 이동 속도를 설정
    	  pager: false,      // 현재 위치 페이징 표시 여부 설정
    	  moveSlides: 1,     // 슬라이드 이동시 개수
		  auto:true,
		  autoHover:true
      });
   });
</script>
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
	<section id="home-main-section-slider">
		<div class="home-main-slider-container">
			<jsp:include page="/WEB-INF/view/include/mainContent.jsp"></jsp:include>
		</div>
	</section>
	<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</div>
</body>
</html>