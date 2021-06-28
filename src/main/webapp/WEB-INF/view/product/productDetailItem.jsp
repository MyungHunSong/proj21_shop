<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	var memberId = "${authInfo.id }";
	console.log(memberId)
	var proSize = ["0","XS","S","M","L","XL"];
	var proColor =["0","white", "ivory", "gray", "pink", "yellow", "mint", "green", "purple", "navy", "10", "black", "brown", "orange", "blue", "red", "basic"];
	var num = 0;
	
	$.get(contextPath + "/api/productDetail/"+proNum, 
	function(json) {
		console.log(json)
		var proSalerate = json[0].proSalesrate;
		var proPrice = parseInt(json[0].proPrice);
		var salePrice = ((100-proSalerate)/100)*proPrice;
		/* 콤마 찍기용 */
		var temp = proPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		var add = salePrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		/* 후기수 */
		var reCount = 0;
		for(i  = 0; i < json.length; i++){
			reCount += json[i].reReplyCount
		}
		console.log(reCount)
		var  sCont = "";
				sCont += "<div class = 'productImage'><img src="+contextPath+"/resources/product/images/"+json[0].proImgfileName+"></div>";
				sCont += "<div class = 'productInfo'>"
				sCont += "<div class = 'productInfoName'>"
				sCont += "<strong>"+json[0].proName+"</strong>";
				sCont += "<span class = 'review'>"+reCount+"개 리뷰 보기</span>";
				sCont += "</div>"
				sCont += "<p> 조회수 : "+json[0].proHits+"</p>";
				sCont += "<p>"+json[0].proContent+"</p>";
				sCont += "<p>"+json[0].proStatus+"</p>";
				sCont += "<p class ='proPrice'>"+temp+" 원</p>";
				sCont += "<span class ='proSalerate'>"+proSalerate+"%  </span>";
				sCont += "<span class ='proPriceSale'>"+add+"원</span>";
				sCont +="<p><select id='size'><option value='size01'>사이즈를 선택해주세요</option>"
				for(i = 1; i < json.length+1; i++){
						sCont +="<option value="+i+">"+proSize[json[i-1].proSize]+"  남은 수량: "+json[i-1].proQuantity+"</option>"
					}
				sCont += "</div>"
			    $("#ProductLoad").append(sCont);
				var proNum = json[2].proNum+"";
				var imgCont = "";
				for(j = 1; j < 3; j++){
					 imgCont += "<img class = 'detailImg' src="+contextPath+"/resources/product/images/"+proNum+"-"+j+".jpg><br>"
				}
				imgCont += "<img class = 'detailImg' src="+contextPath+"/resources/product/sizeImages/"+json[0].proCategory+".jpg>"
				$("#productDetailImg").append(imgCont);
				
				$('.review').on('click',function(){
					$('html, body').animate({scrollTop:$('#productReview').position().top}, 'slow');
				})
		}); 
	
	
		/* 장바구니 버튼 */
		$('#cart').on("click",function(){
			/* var memberId = "${authInfo.id }";
			var proNum = parseInt(${proNum}+$('#size').val()) */
			
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
			var selectProNum = $.ajax({
				url : contextPath+"/api/selectCartByIdAndProNum/"+memberId+"/"+parseInt(proNum+$('#size').val()),
				type : 'get',
				datatype : 'json',
				cache : false,
				success : function(res){
					if(selectProNum.responseJSON.length == 0){
						insertCart();
						window.close()
						window.location.href = contextPath+"/cart?memId=${authInfo.id }"; 
					}else if(selectProNum.responseJSON.length == 1){
						var cartNum = selectProNum.responseJSON[0].cartNum
						var cN = parseInt($('#result').text())
						updateCart(cartNum, cN) 
						window.close()
						window.location.href = contextPath+"/cart?memId=${authInfo.id }";
					}
				},
				error : function(request, status, error){
					alert("로그인창으로 이동하겠습니다.")
					window.location.href = contextPath + "/login"
				}
			})
					
		}
	
		/* 장바구니 추가 function */
		function insertCart() {
			
			var newCart = {
				 "memberId": {
				      "memberId": memberId
				    },
				    "cartProNum": {
				      "proNum": parseInt(${proNum}+$('#size').val())
				    },
				    "cartProQuantity": parseInt($('#result').text())
				}
				$.ajax({
					url : contextPath + "/api/memberProductCart/",
					type:"Post",
					contentType : "application/json; charset=utf-8",
					datatype : "json",
					cache : false,
					data: JSON.stringify(newCart),
					success : function(res){
						console.log(newCart)
					},
					error : function(request, status, error){
						alert("장바구니에 등록 되었습니다.")
						window.location.href = contextPath + "/login"
					}   
				}) 
		}
		
		/* 장바구니 이미 있는 옷일때는  update(function) */
		function updateCart(cartNum, cN){
			var cartItem = {
					  "cartNum": cartNum,
					  "cartProQuantity": cN
					}
			$.ajax({
				url: contextPath + "/api/memberProductCart/" + cartNum,
				type: 'Patch' ,
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				data: JSON.stringify(cartItem),
				success: function(cartItem){},
				error:function(request, status, error){
					 alert("code:"+request.status+"\n"+"message:"
			                  +request.responseText+"\n"+"error:"+error);
				} 
			})
		}
		
		/* 구입하기 버튼 */					
		$('#purchase').on("click", function() {
			
			if($('#size').val() == "size01"){
				return alert("사이즈를 선택해주세요")
			}	
		
			if(parseInt($('#result').text()) == 0){
				return alert("수량을 선택해주세요");
			}				
			
			if (!confirm("바로 구매하시겠습니까")) {
	        } else {
				useOrderBtn()
	        }
		});
		
		function useOrderBtn(){
			var orderProd = {
					  "cartProQuantity": parseInt($('#result').text()),
					  "memberId": {
					      "memberId": memberId
					    },    
					  "cartProNum": {
					      "proNum": parseInt(${proNum}+$('#size').val())
					    }
					}
			$.ajax({
				url: contextPath + '/api/useOrderProductBtn',
				type: 'Post',
				contentType:"application/json; chartset=utf-8",
				datatype: "json",
				data: JSON.stringify(orderProd),
				success: function(res){
					console.log(res)
					selectOrderProduct(res);
				},
				error: function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"
			                  +request.responseText+"\n"+"error:"+error);
				}
			})
		}
		
		/*장바구니번호를 검색후 주문페이지로 이동 */
		function selectOrderProduct(cartNums){
			$.ajax({
				url: contextPath + "/api/chooseProductCarts",
				type: 'Post' ,
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				data: JSON.stringify(cartNums),
				success: function(res){
					window.location.href = contextPath+"/order?memId=${authInfo.id }";
				},
				error:function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"
			                  +request.responseText+"\n"+"error:"+error);
				}  
			});
		}
		
		
		
		
})
</script>
<title>상품 상세 정보</title>
</head>
<body>
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
</body>
</html>