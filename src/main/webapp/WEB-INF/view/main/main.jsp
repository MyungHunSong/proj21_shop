<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />  	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet" href="${contextPath }/resources/main/css/main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="${contextPath }/resources/main/css/mainProductList.css">
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
    	  moveSlides: 1,     // 슬라이드 이동시 개수
		  auto:true,
		  autoHover:true
      });
   });
<!-- 하나의 json데이터 함수영역
	ProductServiceController -> /productDetail/{proNum} 매핑 영역을 걸쳐감
-->
$(function(){
	var contextPath = "${contextPath}";
	var proSize = ["XS","S","M","L","XL"]
	var proStatus = ["RECOMMEND","BEST","SALE","NEW" ]
	
	/*sCont 누적값을 처리 할수 있으면 반복문 개선 가능*/
	<!-- main.jsp 옷상세보기 영역 -->
	$.get(contextPath + "/api/selectProductsMain/"+proStatus[0],
			function(json){
				var dataLength = json.length;
				
				
				if(dataLength >= 1){
										
					var sCont = "";
					for(i = 0; i < dataLength; i++){
						var proNum =json[i].proNum+""
						console.log(proNum);
						sCont += "<div class='item'>";
						sCont += "			<div><a href='productDetail?proNum=" + proNum.substring(0,3) + "'><img src="+  contextPath+"/thumbnails?proNum="+proNum.substring(0,3)+"3&fileName="+json[i].proImgfileName+"></a></div>";
						sCont += "			<div class='detail'>"
						sCont += "				<div class='proTitle'>"
						sCont += "					<span class='proName'>"+ json[i].proName +"</span><br>"
						sCont +="					<span class='price'>"+ (json[i].proPrice*(100-json[i].proSalesrate)/100).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") +"원</span>"
						console.log((json[i].proPrice*(100-json[i].proSalesrate)/100).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
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
				<!-- cart 팝업 옵션 -->
				$('.add-cart').on('click',function(){
					var uri = $(this).prev().prev().children().attr("href")
					var proNum = uri.substring(uri.length,uri.length-3)
					console.log(proNum)
					openPop(proNum)
				})
				
				function openPop(proNum){
					var popup = window.open("productDetailItem2?proNum="+proNum,'상품상세정보','width=1070px, height=600px');
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
						sCont += "			<div><a href='productDetail?proNum=" + proNum.substring(0,3) + "'><img src="+  contextPath+"/thumbnails?proNum="+proNum.substring(0,3)+"3&fileName="+json[i].proImgfileName+"></a></div>";
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
				$('.add-cart').on('click',function(){
					var uri = $(this).prev().prev().children().attr("href")
					var proNum = uri.substring(uri.length,uri.length-3)
					console.log(proNum)
					openPop(proNum)
				})
				
				function openPop(proNum){
					var popup = window.open("productDetailItem2?proNum="+proNum,'상품상세정보','width=1070px, height=600px');
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
						sCont += "			<div><a href='productDetail?proNum=" + proNum.substring(0,3) + "'><img src="+  contextPath+"/thumbnails?proNum="+proNum.substring(0,3)+"3&fileName="+json[i].proImgfileName+"></a></div>";
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
				$('.add-cart').on('click',function(){
					var uri = $(this).prev().prev().children().attr("href")
					var proNum = uri.substring(uri.length,uri.length-3)
					console.log(proNum)
					openPop(proNum)
				})
				
				function openPop(proNum){
					var popup = window.open("productDetailItem2?proNum="+proNum,'상품상세정보','width=1070px, height=600px');
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
						sCont += "			<div><a href='productDetail?proNum=" + proNum.substring(0,3) + "'><img src="+  contextPath+"/thumbnails?proNum="+proNum.substring(0,3)+"3&fileName="+json[i].proImgfileName+"></a></div>";
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
				$('.add-cart').on('click',function(){
					var uri = $(this).prev().prev().children().attr("href")
					var proNum = uri.substring(uri.length,uri.length-3)
					console.log(proNum)
					openPop(proNum)
				})
				
				function openPop(proNum){
					var popup = window.open("productDetailItem2?proNum="+proNum,'상품상세정보','width=800px, height=700px');
				}
	});
	
	/* 메인화면 (RECOMMEND,SALE,NEW,BEST) 클릭시 해당 목록으로 이동*/
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