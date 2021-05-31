<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="css/mainContent.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
    $(document).ready(function(){
      $('.slider').bxSlider({
    	  slideWidth: 1200,
    	  mode:'horizontal',
    	  speed: 500,
    	  moveSlides: 1,
    	  auto: true,
    	  autoHover:true
      });
    });
</script>

</head>
<body>
<!-- 슬라이더 섹션 부분  -->
<section id="home-main-section-slider">
	<div class="home-main-slider-container">
  		<div class="slider">
    		<div><a href=""><img alt="" src="images/slide1.jpg"></a></div>
    		<div><a href=""><img src="images/slide2.jpg"></a></div>
    		<div><a href=""><img src="images/slide3.jpg"></a></div>
    		<div><a href=""><img src="images/slide4.jpg"></a></div>
  		</div>
 	</div>
 </section>
 
 <!-- 바로가기 섹션 부분  -->
 <section id="home-main-section">
 	<div class="home-main-content-top">
 		<div class="home-main-content-top_recmmend">RECOMMEND</div>
 		<div class="home-main-content-top_mostview">MOST VIEW</div>
 	</div>
 	<div></div>
 	<div class="home-main-content-bottom">
 		<div class="home-main-content-bottom_new">NEW</div>
 		<div class="home-main-content-bottom_best">BEST</div>
 		<div class="home-main-content-bottom_sale">SALE</div>
 	</div>
 </section>

 <!-- 바로가기에 맞는 옷목록 부분  -->
</body>
</html>