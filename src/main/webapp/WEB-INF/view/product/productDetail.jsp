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
			var proSalerate = json.proSalesrate;
			var proPrice = parseInt(json.proPrice);
			var salePrice = ((100-proSalerate)/100)*proPrice;
			/* 콤마 찍기용 */
			var temp = proPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			var add = salePrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			var  sCont = "";
					sCont += "<div class = 'productImage'><img src="+contextPath+"/resources/product/images/"+json.proImgfileName+"></div>";
					sCont += "<div class = 'productInfo'>"
					sCont += "<div class = 'productInfoName'>"
					sCont += "<strong>"+json.proName+"</strong>";
					sCont += "<span class = 'review'>"+json.reReplyCount+"개 리뷰 보기</span>";
					sCont += "</div>"
					sCont += "<p> 조회수 : "+json.proHits+"</p>";
					sCont += "<p>"+json.proContent+"</p>";
					sCont += "<p>"+json.proStatus+"</p>";
					sCont +="<p><select id='size'><option value='size01'>사이즈를 선택해주세요</option><option value='1'>XS</option><option value='2'>S</option><option value='3'>M</option><option value='4'>L</option><option value='5'>XL</option></select></p>"
					sCont += "<p class ='proPrice'>"+temp+" 원</p>";
					sCont += "<span class ='proSalerate'>"+proSalerate+"%  </span>";
					sCont += "<span class ='proPriceSale'>"+add+"원</span>";
					sCont += "</div>"
				    $("#ProductLoad").append(sCont);
			
			}); 
		
			/* 장바구니 버튼 */
			$('#cart').on("click",function(){
				var memberId = "${authInfo.id }";
				var proNum = parseInt(${proNum}+$('#size').val())
				
				if($('#size').val() == "size01"){
					return alert("사이즈를 선택해주세요")
				}	
			
				if(parseInt($('#result').text()) == 0){
					return alert("수량을 선택해주세요");
				}
				
				selectCartByMemberIdAndProNum(memberId, proNum)
				
				  
			}) 
		
			/* 장바구니 내에서 회원아이디,제품 번호로 검색 있으면 update 없으면 insert*/
			function selectCartByMemberIdAndProNum(memberId, proNum){
				var test = $.ajax({
					url : contextPath+"/api/selectCartByIdAndProNum/"+memberId+"/"+proNum,
					type : 'get',
					datatype : 'json',
					cache : false,
					success : function(res){
						if(test.responseJSON.length == 0){
							insertCart();
						}else if(test.responseJSON.length == 1){
							var cartNum = test.responseJSON[0].cartNum
							var cN = test.responseJSON[0].cartProQuantity+parseInt($('#result').text())
							updateCart(cartNum, cN) 
						}
					},
					error : function(request, status, error){
						alert("로그인 창으로 이동하겠습니다.")
						window.location.href = contextPath + "/login"
					}
				})
						
			}
		
			/* 장바구니 추가 function */
			function insertCart() {
				
				var newCart = {
					 "memberId": {
					      "memberId": "${authInfo.id }"
					    },
					    "cartProNum": {
					      "proNum": parseInt(${proNum}+$('#size').val())
					    },
					    "cartProQuantity": parseInt($('#result').text())
					}
					$.ajax({
						url : contextPath + "/api/memberProductCart/",
						type:"POST",
						contentType : "application/json; charset=utf-8",
						datatype : "json",
						cache : false,
						data: JSON.stringify(newCart),
						success : function(res){
							console.log(res)
							window.location.href = contextPath+"/cart?memId=${authInfo.id }";
						},
						error : function(request, status, error){
							alert("로그인 창으로 이동하겠습니다.")
							window.location.href = contextPath + "/login"
						}   
					}) 
			}
			
			/* 장바구니 이미 있는 옷일때는  update(function) */
			function updateCart(cartNum, cN){
				console.log(cartNum)
				console.log(cN)
				var cartItem = {
						  "cartNum": cartNum,
						  "cartProQuantity": cN
						}
				console.log(cartItem)
				$.ajax({
					url: contextPath + "/api/memberProductCart/" + cartNum,
					type: 'Patch' ,
					contentType : "application/json; charset=utf-8",
					datatype : "json",
					data: JSON.stringify(cartItem),
					success: function(cartItem){
						window.location.href = contextPath + "/cart?memId=${authInfo.id }";
					},
					error:function(request, status, error){
						 alert("code:"+request.status+"\n"+"message:"
				                  +request.responseText+"\n"+"error:"+error);
						/* window.location.href = contextPath+"/cart?memId=${authInfo.id }"; */
					} 
				})
			}
		
			
			/* 구입하기 버튼 */					
			$('#purchase').on("click", function() {
				window.location.href = contextPath+"/purchase?proNum=${authInfo.id }";
			});
	})

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









