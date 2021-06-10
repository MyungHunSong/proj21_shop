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

	$.get(contextPath + "/api/productlist/"+proImgState+"/"+proCategory,
	function(json){

		var dataLength = json.length;
		if(dataLength >= 1){
			var sCont = "";
			for(i = 0; i < dataLength; i++){
				sCont += "<div class='item'>";
				sCont += "<td><a href='productDetail?proNum=" + json[i].proNum[0].proNum + "'><img src="+contextPath+"/resources/product/images/"+json[i].proImagefilename+"></a></td>";
				sCont += "<div class='detail'>"
				sCont += "<div class='title'>"
				sCont += "<h2><em>"+ json[i].proNum[0].proName +"</em></h2>"
				sCont +="<span class='price'>"+ json[i].proNum[0].proPrice +"</span>"       
				sCont +="</div>"
				sCont +="<div class='info'>"
				sCont +="<div class='size'>"
		        sCont +="<label>Sizes</label>" 
		        sCont +="<span>XS</span><span>S</span><span>M</span><span>L</span><span>XL</span>"
		        sCont +="</div>"
		        sCont +="<div class='color'>"
		        sCont +="<label>Colors</label>"            
		        sCont +="<span></span><span></span><span></span><span></span><span></span>"           
		        sCont +="</div>"
		        sCont +="<span class='like'></span>"       
		        sCont +="</div>"
		        sCont +="<button class='add-cart'>Add to Cart</button>"
			    sCont +="</div>"
		        sCont +="</div>"
			}
			$(".productList").append(sCont);
		}
	});
});
</script>
</head>
<body>
<div class="container">
<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>

	<div class="productList"></div>

<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</div>
</body>
</html>