<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세정보</title>
<link rel="stylesheet" href="/proj21_shop/resources/main/css/main.css">
<link rel="stylesheet" href="/proj21_shop/resources/product/css/productDetail.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function count(type)  {
    // 결과를 표시할 element
    var resultElement = document.getElementById('result');

    // 현재 화면에 표시된 값
    let number = resultElement.innerText;

    // 더하기/빼기
    if(type === 'plus') {
        number = parseInt(number) + 1;
    }else if(type === 'minus' && number > 0)  {
        number = parseInt(number) - 1;
    }
     // 결과 출력
     resultElement.innerText = number;
    }
$(function() {
	var contextPath = "${contextPath}";
	var proNum = ${proNum};
	$.get(contextPath + "/api/productDetail/"+proNum, 
	function(json) {
		var proSalerate = json.proNum[0].proSalesrate;
		var proPrice = json.proNum[0].proPrice;
		var salePrice = ((100-proSalerate)/100)*proPrice;
		/* 콤마 찍기용 */
		var temp = proPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		var add = salePrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		var sCont = "";
			sCont += "<div class = 'productImage'><img src="+contextPath+"/resources/product/images/"+json.proImagefilename+"></div>";
			sCont += "<div class = 'productInfo'>"
			sCont += "<div class = 'productInfoName'>"
			sCont += "<strong>"+json.proNum[0].proName+"</strong>";
			sCont += "<span class = 'review'>"+json.proNum[0].reReplyCount+"개 리뷰 보기</span>";
			sCont += "</div>"
			sCont += "<p> 조회수 : "+json.proNum[0].proHits+"</p>";
			sCont += "<p>"+json.proNum[0].proContent+"</p>";
			sCont += "<p>"+json.proNum[0].proStatus+"</p>";
			sCont +="<p><select id='size'><option value='size01'>사이즈를 선택해주세요</option><option value='size_01'>XS</option><option value='size_02'>S</option><option value='size_03'>M</option><option value='size_04'>L</option><option value='size_05'>XL</option></select></p>"
			sCont += "<p class ='proPrice'>"+temp+" 원</p>";
			sCont += "<span class ='proSalerate'>"+proSalerate+"%  </span>";
			sCont += "<span class ='proPriceSale'>"+add+"원</span>";
			sCont += "</div>"
		    $("#ProductLoad").append(sCont);
		
		$('#cart').on("click", function() {
			window.location.href = contextPath+"/order/cart?memId=${authInfo.id }";
		});
		
		$('#purchase').on("click", function() {
			window.location.href = contextPath+"/purchase?proNum=${authInfo.id }";
		});
	});
});

</script>
</head>
<body>
<div class="container">
<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
		<section id="ProductLoad"></section>
		<div class="productRight">
			<div class="calculator">
				<input class="cal btn" type='button'onclick='count("minus")'value='-'/>
				<div class="cal" id = "result">0</div>
				<input class="cal btn" type='button'onclick='count("plus")'value='+'/>
			</div>
			<div class='submitBtns'>
				<input type='submit' id='cart' value='장바구니' />
				<input type='submit' id='purchase' value='구매하기' />
			</div>
		</div>
<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</div>
</body>
</html>









