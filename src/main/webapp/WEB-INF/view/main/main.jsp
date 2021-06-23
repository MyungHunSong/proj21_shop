<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />  	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet" href="/proj21_shop/resources/main/css/main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="/proj21_shop/resources/main/css/mainProductList.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script   src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
/*bxslider*/
   $(document).ready(function() {
      $('.slider').bxSlider({
    	  slideWidth: 1200, 
    	  mode: 'horizontal',// 가로 방향 수평 슬라이드
    	  speed: 500,        // 이동 속도를 설정이탷
    	  pager: false,      // 현재 위치 페이징 표시 여부 설정
    	  moveSlides: 1,     // 슬라이드 이동시 개수
		  auto:true,
		  autoHover:true
      });
   });
$(function(){
	var contextPath = "${contextPath}";
	var proSize = ["XS","S","M","L","XL"]
	var proStatus = ["RECOMMEND","BEST","SALE","NEW" ]
	
	$.get(contextPath + "/api/selectProductsMain/"+proStatus[0],
			function(json){
				var dataLength = json.length;
				if(dataLength >= 1){
					var sCont = "";
					for(i = 0; i < dataLength; i++){
						var proNum =json[i].proNum+"" 
						sCont += "<div class='item'>";
						sCont += "			<div><a href='productDetail?proNum=" + proNum.substring(0,3) + "'><img src="+contextPath+"/resources/product/images/"+json[i].proImgfileName+"></a></div>";
						sCont += "			<div class='detail'>"
						sCont += "				<div class='proTitle'>"
						sCont += "					<span class='proName'>"+ json[i].proName +"</span><br>"
						sCont +="					<span class='price'>"+ (json[i].proPrice*(100-json[i].proSalesrate)/100).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") +"원</span>"       
						sCont +="				</div>"
						sCont +="				<div class='info'>"
						sCont +="					<div class='size'>"
				        sCont +="						<label>Sizes</label>"
				        for(j = 0;j < proSize.length;j++){
				        	sCont +="						<span>"+proSize[j]+"</span>"	
				        }
				        sCont +="					</div>"
				        sCont +="				</div>"
				        sCont +="			</div>"
				        sCont +="		<button class='add-cart'>Add to Cart</button>"
				        sCont +="</div>"
					}
					$("#"+proStatus[0]).append(sCont);
				} 
			});
	$.get(contextPath + "/api/selectProductsMain/"+proStatus[1],
			function(json){
				var dataLength = json.length;
				if(dataLength >= 1){
					var sCont = "";
					for(i = 0; i < dataLength; i++){
						var proNum =json[i].proNum+"" 
						sCont += "<div class='item'>";
						sCont += "			<div><a href='productDetail?proNum=" + proNum.substring(0,3) + "'><img src="+contextPath+"/resources/product/images/"+json[i].proImgfileName+"></a></div>";
						sCont += "			<div class='detail'>"
						sCont += "				<div class='proTitle'>"
						sCont += "					<span class='proName'>"+ json[i].proName +"</span><br>"
						sCont +="					<span class='price'>"+ (json[i].proPrice*(100-json[i].proSalesrate)/100).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")  +"원</span>"       
						sCont +="				</div>"
						sCont +="				<div class='info'>"
						sCont +="					<div class='size'>"
				        sCont +="						<label>Sizes</label>"
				        for(j = 0;j < proSize.length;j++){
				        	sCont +="						<span>"+proSize[j]+"</span>"	
				        }
				        sCont +="					</div>"
				        sCont +="				</div>"
				        sCont +="			</div>"
				        sCont +="		<button class='add-cart'>Add to Cart</button>"
				        sCont +="</div>"
					}
					$("#"+proStatus[1]).append(sCont);
				} 
			});
	$.get(contextPath + "/api/selectProductsMain/"+proStatus[2],
			function(json){
				var dataLength = json.length;
				if(dataLength >= 1){
					var sCont = "";
					for(i = 0; i < dataLength; i++){
						var proNum =json[i].proNum+"" 
						sCont += "<div class='item'>";
						sCont += "			<div><a href='productDetail?proNum=" + proNum.substring(0,3) + "'><img src="+contextPath+"/resources/product/images/"+json[i].proImgfileName+"></a></div>";
						sCont += "			<div class='detail'>"
						sCont += "				<div class='proTitle'>"
						sCont += "					<span class='proName'>"+ json[i].proName +"</span><br>"
						sCont +="					<span class='price'>"+ (json[i].proPrice*(100-json[i].proSalesrate)/100).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")  +"원</span>"       
						sCont +="				</div>"
						sCont +="				<div class='info'>"
						sCont +="					<div class='size'>"
				        sCont +="						<label>Sizes</label>"
				        for(j = 0;j < proSize.length;j++){
				        	sCont +="						<span>"+proSize[j]+"</span>"	
				        }
				        sCont +="					</div>"
				        sCont +="				</div>"
				        sCont +="			</div>"
				        sCont +="		<button class='add-cart'>Add to Cart</button>"
				        sCont +="</div>"
					}
					$("#"+proStatus[2]).append(sCont);
				} 
			});
	$.get(contextPath + "/api/selectProductsMain/"+proStatus[3],
			function(json){
				var dataLength = json.length;
				if(dataLength >= 1){
					var sCont = "";
					for(i = 0; i < dataLength; i++){
						var proNum =json[i].proNum+"" 
						sCont += "<div class='item'>";
						sCont += "			<div><a href='productDetail?proNum=" + proNum.substring(0,3) + "'><img src="+contextPath+"/resources/product/images/"+json[i].proImgfileName+"></a></div>";
						sCont += "			<div class='detail'>"
						sCont += "				<div class='proTitle'>"
						sCont += "					<span class='proName'>"+ json[i].proName +"</span><br>"
						sCont +="					<span class='price'>"+ (json[i].proPrice*(100-json[i].proSalesrate)/100).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")  +"원</span>"       
						sCont +="				</div>"
						sCont +="				<div class='info'>"
						sCont +="					<div class='size'>"
				        sCont +="						<label>Sizes</label>"
				        for(j = 0;j < proSize.length;j++){
				        	sCont +="						<span>"+proSize[j]+"</span>"	
				        }
				        sCont +="					</div>"
				        sCont +="				</div>"
				        sCont +="			</div>"
				        sCont +="		<button class='add-cart'>Add to Cart</button>"
				        sCont +="</div>"
					}
					$("#"+proStatus[3]).append(sCont);
					
				} 
			});
	$('.listRemocon').on('click',function(){
		var listRemocon = $(this).text();
		if(listRemocon == "RECOMMEND"){
			$('html, body').animate({scrollTop:$('#recommend').position().top}, 'slow');
		}
		else if(listRemocon == "SALE"){
			$('html, body').animate({scrollTop:$('#sale').position().top}, 'slow');
		}
		else if(listRemocon == "NEW"){
			$('html, body').animate({scrollTop:$('#new').position().top}, 'slow');
		}
		else if(listRemocon == "BEST"){
			$('html, body').animate({scrollTop:$('#best').position().top}, 'slow');
		}
	})
	
})   
</script>
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
	<section id="home-main-section-slider">
		<div class="home-main-slider-container">
			<jsp:include page="/WEB-INF/view/main/mainContent.jsp"></jsp:include>
		</div>
	</section>
	<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</div>
</body>
</html>