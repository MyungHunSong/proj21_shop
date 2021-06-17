<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/proj21_shop/resources/main/css/mainContent.css">
</head>
<body>
<!-- 슬라이더 섹션 부분  -->
<section id="home-main-section-slider">
	<div class="homeMainSliderContainer">
  		<div class="slider">
    		<div><a href=""><img src="resources/banner/slide1.jpg"></a></div>
    		<div><a href=""><img src="resources/banner/slide2.jpg"></a></div>
    		<div><a href=""><img src="resources/banner/slide3.jpg"></a></div>
    		<div><a href=""><img src="resources/banner/slide4.jpg"></a></div>
  		</div>
 	</div>
 </section>
 
 <!-- 바로가기 섹션 부분  -->
 <section id="homeMainSection">
 	<div class="homeMainContentTop">
 		<div class="homeMainContentTop_recmmend">RECOMMEND</div>
 		<div class="homeMainContentTop_mostview">MOST VIEW</div>
 	</div>
 	<div></div>
 	<div class="homeMainContentBottom">
 		<div class="homeMainContentBottomNew">NEW</div>
 		<div class="homeMainContentBottomBest">BEST</div>
 		<div class="homeMainContentBottomSale">SALE</div>
 	</div>
 </section>

 <!-- 바로가기에 맞는 옷목록 부분  -->
 
 <section id="recommend">
 	<div id="recommendLoad"></div>
 </section>
 <section id="mostview">
 	<div id="mostviewLoad"></div>
 </section>
 <section id="new">
 	<div id="newLoad"></div>
 </section>
 <section id="best">
 	<div id="bestLoad"></div>
 </section>
 <section id="sale">
 	<div id="saleLoad"></div>
 </section>
</body>
</html>