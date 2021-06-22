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
<link rel="stylesheet" href="/proj21_shop/resources/product/css/star.css" />
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

// 제이쿼리 시작
$(function() {
		var contextPath = "${contextPath}";
		var proNum = ${proNum};
		var memberId = "${authInfo.id }";
		var proSize = ["0","XS","S","M","L","XL"];
		var proColor =["0","white", "ivory", "gray", "pink", "yellow", "mint", "green", "purple", "navy", "10", "black", "brown", "orange", "blue", "red", "basic"];
		var num = 0;
		
		/*마지막 댓글번호*/
		
		
		$.get(contextPath + "/api/selectMaxReRepNum",
				function maxNum(lastNum){
					num = lastNum;
						getNum(num)
		})	
		
		function getNum(num){
			return num
		}
		
		$.get(contextPath + "/api/productDetail/"+proNum, 
		function(json) {
			var proSalerate = json[0].proSalesrate;
			var proPrice = parseInt(json[0].proPrice);
			var salePrice = ((100-proSalerate)/100)*proPrice;
			/* 콤마 찍기용 */
			var temp = proPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			var add = salePrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			var  sCont = "";
					sCont += "<div class = 'productImage'><img src="+contextPath+"/resources/product/images/"+json[0].proImgfileName+"></div>";
					sCont += "<div class = 'productInfo'>"
					sCont += "<div class = 'productInfoName'>"
					sCont += "<strong>"+json[0].proName+"</strong>";
					sCont += "<span class = 'review'>"+json[0].reReplyCount+"개 리뷰 보기</span>";
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
				window.location.href = contextPath+"/cart?memId=${authInfo.id }"; 
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
						}else if(selectProNum.responseJSON.length == 1){
							var cartNum = selectProNum.responseJSON[0].cartNum
							var cN = parseInt($('#result').text())
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
							alert("로그인 창으로 이동하겠습니다.")
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
				console.log(orderProd)
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
			
			 /*스타일 후기 보기*/
			 var notice = [ '별로에요', '보통이에요', '그냥 그래요', '맘에 들어요','아주 좋아요' ];
			 var  sCont = "";	
			 
			$.get(contextPath + "/api/selectReviewByProNum/"+ proNum, 
				function(json){
					if(json.length != 0){
						console.log(json)
						for(i = 0; i < json.length; i++){
								sCont += "<div class = 'reviewMembers'>"
								sCont += "<hr style='border-radius: 10%; border-style: dashed; color: #ccc'>"
								sCont += "			<h1 class = 'memberId'>ID : " + json[i].memberId +"</h1>" 
								sCont += "		<div class='starRate'>"
								sCont += "			<div class='star-rating'>"
								sCont += "				<div class='stars'>"
								if(json[i].reviewStar != 0){
									for(j = 1; j < json[i].reviewStar+1; j++){
										$('.print').html('<img src="images/star-lv' +j + '.png">' + notice[j-1]);
										sCont += "<i class='s"+j+" fa fa-star active'></i>"	
									}
									for(j = 1; j < 5-json[i].reviewStar+1; j++){
										sCont += "<i class='s"+j+" fa fa-star'></i>"
									}
								}
								sCont += "					<div class='print'></div>"
								sCont += "					</div>"
								sCont += "				</div>"
								sCont += "			</div>"
								sCont += "		<div class = 'reviewList'>"
								sCont += "			<img class = 'prodImg' src='/proj21_shop/resources/product/images/" + json[i].proImagefilename.proImagefilename + "' width = '70' height= '70'>"
								sCont += "				<div class = 'proAndMemInfo'>"
								sCont += "					<span>" + json[i].proName.proName+"</span><br>"
								sCont += "					<span>"+proColor[json[i].proName.proColor] +"/"+proSize[json[i].proName.proSize]+ "</span><br>"
								sCont += "				</div>"
								sCont += "			<div class = 'reivewContent'>"+json[i].reviewContent+"</div><br>";	
								sCont += "			<div class = 'reviewImg'>"
								sCont += "				<img src='/proj21_shop/resources/review/images/" + json[i].reviewImagefilename1 + "'>"
								/* sCont += "			<img src='/proj21_shop/resources/review/images/" + json[i].reviewImagefilename2 + "' width = '70' height= '70'>" */
								sCont += "			</div>"
								sCont += "		</div>"
								sCont += "		<div class='replyGroup'>"
								sCont += "			<input type= 'hidden' class = 'rno' name= 'rno' value="+json[i].reviewNum+"/>"
								sCont += "			<input type= 'text' class= 'replyContent' name='replyContent' placeholder='내용을 입력하세요.'>"
								sCont += "	    	<button class = 'commentInsertBtn' name='commentInsertBtn'>댓글</button>"
								sCont += "		</div>"
								if(json[i].reviewReplys[0].reRepNum != 0){
									for(j = 0; j < json[i].reviewReplys.length; j++){
										sCont += "<div class='commentArea'>"
										sCont += "		<div class='commentUser'>"+json[i].reviewReplys[j].reRepMember+"</div>"
										sCont += "		<div class='commentContentAndBtns'>"
										sCont += "			<div class='commentContent'>"+json[i].reviewReplys[j].reRepContent +"</div>"
										sCont += "			<div class='commentBtns'>"
										sCont += "				<input type= 'hidden' class = 'rrno' name= 'rrno' value="+json[i].reviewReplys[j].reRepNum+"/>"
										sCont += "				<button class='commentBtn updateBtn'>수정</button>"
										sCont += "				<button class='commentBtn deleteBtn'>삭제</button>"
										sCont += "			</div>"
										sCont += "		</div>"
										sCont += "</div>"
									}
								}
								sCont += "</div>"
						 }                                                                                                                          
					}else{                                                                                                                                      
							$('.star-rating').text("")
							sCont += "<p class = 'noReview'>후기가 없습니다.</p>" 
					}
					$("#productReview").append(sCont);
					
					
					/* 댓글 등록 버튼 클릭 */
					$('.commentInsertBtn').on("click",function(){
						var maxNum = getNum(num);
						console.log(maxNum++)
						var pReviewNum = $(this).prev().prev().val();
						
						/*댓글을 달 후기 번호*/
						var useNum = pReviewNum.substring(0,pReviewNum.length-1)
						var replyContent = $(this).prev().val()
						var reRepNum = $(this).parent().parent().children('.updateMem').children().next().children('.commentBtns').children().val()+"";
						var useReRepNum = reRepNum.substring(0,reRepNum.length-1)
						
						var reply = {
							  "reNum" : useNum,
							  "reRepMember" : memberId,
							  "reRepContent" : replyContent
						}
						
						var reviewReply = {
							  "reRepNum"  : useReRepNum,
							  "reRepMember" : memberId,
							  "reRepContent" : replyContent
						}
						
						if($(this).text() == '댓글'){
							insertReviewReply(reply);
							var sCont = "";
							sCont += "<div class='commentArea'>"
							sCont += "		<div class='commentUser'>"+memberId+"</div>"
							sCont += "		<div class='commentContentAndBtns'>"
							sCont += "			<div class='commentContent'>"+replyContent +"</div>"
							sCont += "			<div class='commentBtns'>"
							sCont += "				<input type= 'hidden' class = 'rrno' name= 'rrno' value="+maxNum+"/>"
							sCont += "				<button class='commentBtn updateBtn'>수정</button>"
							sCont += "				<button class='commentBtn deleteBtn'>삭제</button>"
							sCont += "			</div>"
							sCont += "		</div>"
							sCont += "</div>"
							$(this).parent().before(sCont);
							$(this).prev().val('')
							
						}else if($(this).text() == '수정'){
							updateReviewReply(reviewReply)
							
							/*replyContent의 value값*/
							$(this).prev().val()
							
							/*수정 버튼을 누르면 형제중에 updateMem이 생기고 그걸 찾는다.*/
							$(this).parent().parent().children('.updateMem').children().next().children('.commentContent').text($(this).prev().val())
							$(this).text('댓글')
							$(this).prev().val('')
							$(this).parent().parent().children().removeClass('updateMem')
							alert("수정완료하였습니다.")
						}
						
					})
					
					$('.updateBtn').on('click',function(){
						var useNum = $(this).prev().val()
						var reRepNum = useNum.substring(0, useNum.length-1)
						var replyContent = $(this).parent().parent().parent().next().children().next().val()
						var commentInsertBtn = $(this).parent().parent().parent().parent().next().children().next().next().text()
						var id = $(this).parent().parent().prev().text()
						if(id == memberId){
							
							/*댓글 옆 수정버튼을 누르면 댓글버튼이 수정으로 이름이 바뀐다.*/
							$(this).parent().parent().parent().parent().children('.replyGroup').children('.replyContent').next().text('수정')
							
							/*세팅되는 곳 '.replyContent' , ()안은 세팅 할 값*/
							$(this).parent().parent().parent().parent().children('.replyGroup').children('.replyContent').val($(this).parent().prev().text())
							
							/*수정 버튼 누르면 class 생성*/
							$(this).parent().parent().parent().addClass('updateMem')
							
						}else{
							alert('자신의 글만 수정할 수 있습니다.')
						}
					})
					
					$('.deleteBtn').on('click',function(){
						var useNum = $(this).prev().prev().val()
						var reRepNum = useNum.substring(0, useNum.length-1)
						var delItem = {
								"reRepMember" :	memberId,
								"reRepNum" : reRepNum
						}
						deleteReviewReply(delItem)
						var id = $(this).parent().parent().prev().text()
						if(id == memberId){
							$(this).parent().parent().parent().remove()
						}else{
							alert("자신이 쓴 글만 삭제 하실수 있습니다. ")
						}
					})
					
				})
				
				
				function insertReviewReply(reply){
					
					$.ajax({
						url : contextPath + '/api/insertReviewReply',
						type: 'Post' ,
						contentType : "application/json; charset=utf-8",
						datatype : "json",
						data: JSON.stringify(reply),
						success: function(res){
							window.location.reload()
						},
						error:function(request, status, error){
							console.log(request)
							alert(status);
							/* alert("code:"+request.status+"\n"+"message:"
					                  +request.responseText+"\n"+"error:"+error); */
						}
					})
				}//insertReviewReply
				
				function updateReviewReply(reviewReply){
					$.ajax({
						url : contextPath + '/api/updateReviewReply/'+reviewReply.reRepNum,
						type: 'Patch' ,
						contentType : "application/json; charset=utf-8",
						datatype : "json",
						data: JSON.stringify(reviewReply),
						success: function(res){
							console.log(reviewReply)
							/* window.location.reload() */
						},
						error:function(request, status, error){
							console.log(request)
							alert(status);
							alert("code:"+request.status+"\n"+"message:"
					                  +request.responseText+"\n"+"error:"+error); 
						}
					})
				} 
				
				function deleteReviewReply(delItem){
					console.log(delItem)
					$.ajax({
						url : contextPath + '/api/deleteReviewReply',
						type: 'Post' ,
						contentType : "application/json; charset=utf-8",
						datatype : "json",
						data: JSON.stringify(delItem),
						success: function(res){
							/* alert(res) */
						},
						error:function(request, status, error){
							/* alert(status); */
							/* alert("code:"+request.status+"\n"+"message:"
					                  +request.responseText+"\n"+"error:"+error); */
						}
					})
				}
		  
				
})// 제이쿼리 끝

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
		<section id="productDetailImg"></section>
		<section id="productReview">
			<p class="menuTitle">REVIEW</p>
		</section>
<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</div>
</body>
</html>









