<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>옷 목록화면</title>
<link rel="stylesheet" href="/proj21_shop/resources/product/css/productList.css">
<link rel="stylesheet" href="/proj21_shop/resources/main/css/main.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".size span, .color span").on({
		"click" : clickFnc
	})
	
	$(".like").click(function() {
		$(".like").toggleClass("active");
	})
	
	function clickFnc() {
		$(this).addClass("active");
		$(this).siblings().removeClass("active");
	}
	var contextPath = "${contextPath}";
	var proImgState = ${proImgState};
	var proCategory = ${proCategory};

	var proSize = ["XS","S","M","L","XL"]
	
	$.get(contextPath + "/api/productlist/"+proImgState+"/"+proCategory,
	function(json){

		var dataLength = json.length;
		if(dataLength >= 1){
			var sCont = "";
			for(i = 0; i < dataLength; i++){
				var proNum =json[i].proNum+"" 
				sCont += "<div class='item'>";
				sCont += "			<div><a href='productDetail?proNum=" + proNum.substring(0,3) + "'><img src="+  contextPath+"/thumbnails?proNum="+proNum.substring(0,3)+"3&fileName="+json[i].proImgfileName+"></a></div>";
				sCont += "			<div class='detail'>"
				sCont += "				<div class='title'>"
				sCont += "					<span class='proName'>"+ json[i].proName +"</span><br>"
				sCont +="					<span class='price'>"+ json[i].proPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") +"원</span>"       
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
			$(".productList").append(sCont);
		}
	});
	
	$('.orderKind').on('click', 'li',function(){
		var contextPath = "${contextPath}";
		var sortOrder = $(this).data("order")
		var sortPrice = $(this).data("price")
		var proCategory = ${proCategory};
		$(".productList *").remove(); 
		if(sortPrice == undefined){
			sortPrice = 0;
			$.get(contextPath + "/api/selectProductsCondition/"+proCategory+"/"+sortOrder+"/"+sortPrice,
					function(json){
						var sCont = "";
						var dataLength = json.length;
						if(dataLength >= 1){
							for(i = 0; i < dataLength; i++){
								var proNum =json[i].proNum+"" 
								sCont += "<div class='item'>";
								sCont += "			<div><a href='productDetail?proNum=" + proNum.substring(0,3) + "'><img src="+  contextPath+"/thumbnails?proNum="+proNum.substring(0,3)+"3&fileName="+json[i].proImgfileName+"></a></div>";
								sCont += "			<div class='detail'>"
								sCont += "				<div class='title'>"
								sCont += "					<span class='proName'>"+ json[i].proName +"</span><br>"
								sCont +="					<span class='price'>"+ json[i].proPrice +"</span>"       
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
							$(".productList").append(sCont);
						}
					})
		}else{
			$.get(contextPath + "/api/selectProductsCondition/"+proCategory+"/"+sortOrder+"/"+sortPrice,
					function(json){
						console.log(json)
						var dataLength = json.length;
						var sCont = "";
						if(dataLength >= 1){
							for(i = 0; i < dataLength; i++){
								var proNum =json[i].proNum+"" 
								sCont += "<div class='item'>";
								sCont += "			<div><a href='productDetail?proNum=" + proNum.substring(0,3) + "'><img src="+  contextPath+"/thumbnails?proNum="+proNum.substring(0,3)+"3&fileName="+json[i].proImgfileName+"></a></div>";
								sCont += "			<div class='detail'>"
								sCont += "				<div class='title'>"
								sCont += "					<span class='proName'>"+ json[i].proName +"</span><br>"
								sCont +="					<span class='price'>"+ json[i].proPrice +"</span>"       
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
							$(".productList").append(sCont);
						}else{
							sCont +="<div class = 'searchBlank'>검색 결과<br> 없습니다.</div>"
							$(".productList").append(sCont);
						}
						
					})	
		}
		
	})
	
	$('.prodSearchBtn span').on('click',function(){
		if($(this).text() == 'Filter'){
			$('.prodSearchCondition').addClass('active')
			$('.searchPlace').removeClass('active')
			
		}else if($(this).text() == 'Search'){
			$('.prodSearchCondition').removeClass('active')
			$('.searchPlace').addClass('active')
		}
	})
	
	$('.fa-search').on('click',function(){
			$(".productList *").remove(); 
			var sCont = "";
			var test = $(this).prev().val()
			if(test != ''){
				$.get(contextPath + "/api/selectProductByProName/"+test,
					function(json){
						console.log(test)
						var dataLength = json.length;
						
						if(dataLength >= 1){
							for(i = 0; i < dataLength; i++){
								var proNum =json[i].proNum+"" 
								sCont += "<div class='item'>";
								sCont += "			<div><a href='productDetail?proNum=" + proNum.substring(0,3) + "'><img src="+  contextPath+"/thumbnails?proNum="+proNum.substring(0,3)+"3&fileName="+json[i].proImgfileName+"></a></div>";
								sCont += "			<div class='detail'>"
								sCont += "				<div class='title'>"
								sCont += "					<span class='proName'>"+ json[i].proName +"</span><br>"
								sCont +="					<span class='price'>"+ json[i].proPrice +"</span>"       
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
							
						}else if(dataLength == 0 | test == ''){
							sCont +="<div class = 'searchBlank'>검색 결과<br> 없습니다.</div>"
						}
						$(".productList").append(sCont);
					
				})	
			}else {
				sCont +="<div class = 'searchBlank'>검색 결과<br> 없습니다.</div>"
				$(".productList").append(sCont);
			}
				
			
			
		}) 
		
})
	

</script>
</head>
<body>
<div class="container">
<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
	<div class="prodSearchBtn">
		<span>Filter</span>
		<span>Search</span>
	</div>
	<div class="prodSearchCondition">
		<div class="conditions">
			<p>Sort By</p>
			<ul class="orderKind" >
				<li data-order = "asc">가격낮은순</li>
				<li data-order ="desc">가격높은순</li>
				<li data-order ="asc">오래된상품순</li>
				<li data-order ="신상">최신상품순</li>
				<li data-order ="proHits">조회수순</li>
			</ul>
		</div>
		<div class="conditions">
			<p>Price</p>
			<ul class="orderKind" >
				<li data-price=0>All</li>
				<li data-price=1>10000 ~ 30000</li>
				<li data-price=2>30000 ~ 50000</li>
				<li data-price=3>50000 ~ 80000</li>
				<li data-price=4>80000 ~ 100000</li>
				<li data-price=5>100000~</li>
			</ul>
		</div>
	</div>
	<div class="searchPlace">
		<input type="text" placeholder="검색하세요"><i class="fas fa-search"></i>
	</div>
	<div class="productList"></div>

<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</div>
</body>
</html>