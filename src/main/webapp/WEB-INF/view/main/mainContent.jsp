<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="contextPath" value="<%=request.getContextPath()%>" />     
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
 		<div class="homeMainContentTopRecmmend listRemocon"><img class="imgBtn" src="${contextPath}/thumbnails?proNum=2113&fileName=2113-1.jpg"/><h2 class="imgBtnText">RECOMMEND</h2></div>
 		<div class="homeMainContentTopMostview listRemocon"><img class="imgBtn" src="${contextPath}/thumbnails?proNum=5033&fileName=5033-1.jpg"/><h2 class="imgBtnText">SALE</h2></div>
 	</div>
 	 <div></div>
 	<div class="homeMainContentTop">
 		<div class="homeMainContentTopMostview listRemocon"><img class="imgBtn" src="${contextPath}/thumbnails?proNum=5113&fileName=5113-1.jpg"/><h2 class="imgBtnText">BEST</h2></div>
 		<div class="homeMainContentTopRecmmend listRemocon"><img class="imgBtn" src="${contextPath}/thumbnails?proNum=6023&fileName=6023-1.jpg"/><h2 class="imgBtnText">NEW</h2></div>
 	</div>
 </section>

 <!-- 바로가기에 맞는 옷목록 부분  -->
 
<section id="recommend" >
	<h1 class="title">RECOMMEND</h1>
 	<div id="RECOMMEND" class="productList"></div>
</section>
<section id="sale" class="listRemocon">
 	<h1 class="title">SALE</h1>
 	<div id="SALE" class="productList"></div>
</section>
<section id="best" class="listRemocon">
 	<h1 class="title">BEST</h1>
 	<div id="BEST" class="productList"></div>
</section>
<section id="new" class="listRemocon">
 	<h1 class="title">NEW</h1>
 	<div id="NEW" class="productList"></div>
</section>
</body>
</html>