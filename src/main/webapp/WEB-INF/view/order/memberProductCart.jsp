<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />        
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="${contextPath }/resources/main/css/main.css">
<link rel="stylesheet" href="${contextPath }/resources/order/css/memberProductCart.css">
<script type="text/javascript" src="${contextPath }/resources/order/js/memberProductCart.js"></script>  
<meta charset="UTF-8">
<title>장바구니</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
<!-- Controller 경로 : proj21_shop.controller.order/CartServiceController.java (json을 위한 형식)  -->
$(function(){
	
	var contextPath = "${contextPath}";
	var memId = "${memId}";
	
	$.get(contextPath + "/api/memberProductCart/"+memId,
		function(json){
			console.log(json)
			var dataLength = json.length;
			if(dataLength >= 1){
				var sCont = "";
				for(i = 0; i < dataLength; i++){
			
					console.log(json[i].cartProNum)
					var proSize = ["none","XS","S","M","L","XL"];
					var point = parseInt((100-json[i].cartProNum.proSalesrate)*json[i].cartProNum.proPrice*0.0001*json[i].cartProQuantity);
					
					sCont += "<div class='row data'>"
					sCont +=		"<div class='subdiv'>"
					sCont +=			"<div class='check'><input type='checkbox' name = 'remove'  class = 'checkbox' name='buy' value = "+json[i].cartNum+" onclick='javascript:basket.checkItem();''>&nbsp;</div>"
					sCont +=			"<div class='img'><img src="+contextPath+"/resources/product/images/"+json[i].cartProNum.proImgfileName+" width='40' height='60'></div>"
					sCont +=			"<div class='pname'>"
					sCont +=       			"<span>"+json[i].cartProNum.proName+"("+proSize[json[i].cartProNum.proSize]+")"+"</span>"
					sCont +=  	  		"</div>"
					sCont +=		"</div>"
					sCont +=		"<div class='subdiv'>"
					sCont +=			"<div class='basketprice'>"+point+"P</div>"
					sCont +=			"<div class='num'>"
					sCont +=				"<div class='updown'> "
					sCont +=       			"<input type='hidden' name='p_price' id='p_price1' class='p_price' value="+((100-json[i].cartProNum.proSalesrate)*json[i].cartProNum.proPrice)/100+"/>"
					sCont +=					"<span class='up1' onclick='javascript:basket.changePNum("+i+","+json[i].cartProNum.proQuantity+");'><button id = 'upBtn' value="+json[i].cartNum+" class='up fas fa-arrow-alt-circle-up countBtn upBtn'></button></span>"
					sCont +=					"<input type='text' name='p_num"+i+"' id='p_num"+i+"' size='2' maxlength='4' class='p_num' value="+json[i].cartProQuantity+" onkeyup='javascript:basket.changePNum("+i+");' readonly>"
					sCont +=					"<span onclick='javascript:basket.changePNum("+i+");'><button id = 'downBtn' value="+json[i].cartNum+" class='fas fa-arrow-alt-circle-down down countBtn downBtn'></button></span>"
					sCont +=				"</div>"
					sCont +=			"</div>"
					sCont +=			"<div class='sum'>"+(((100-json[i].cartProNum.proSalesrate)*json[i].cartProNum.proPrice*json[i].cartProQuantity)/100).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원</div> "
					sCont +=			"<div class='subdiv'>"
					sCont +=			"<input type='hidden' name='p_del'  class='p_del' value="+json[i].cartNum+"/>"
					sCont +=			      "<div class='basketcmd'><a href='javascript:void(0)' class='delButton abutton' onclick='javascript:basket.delItem();'>삭제</a></div>"
					sCont +=			"</div>"
					sCont +=		"</div>"
					sCont +="</div> "
					
				}
			$(".load_row_data").append(sCont);
				
			}
			
			/* 개별 삭제용 버튼 */
			$('.delButton').on("click",function(){
				var numItem = $(this).parent().parent().children('.p_del').val()
				var cartNum = parseInt(numItem.split('/'));
				delCart(cartNum)
			})
			
			/* 제품 수량 변경용 버튼 */
			$('.upBtn').on("click", function(){
				var cartNum = $(this).val();
				var countNum = $(this).parent().parent().children('.p_num').val()
				var cN = parseInt(countNum)
				if(cN == 99){
					cN = 98;
				}
				count(cartNum, cN)
			}) 

			/* 제품 수량 변경용 버튼 */
			$('.downBtn').on("click", function(){
				var cartNum = $(this).val();
				var countNum = $(this).parent().parent().children('.p_num').val()
				var cN = parseInt(countNum)-1
				if(cN == 0){
					cN = 1;
				}
				count(cartNum, cN)
			}) 
			
		});/*end function*/
	
		/* 장바구니 수량 변경시 update(function) */
		function count(cartNum, cN){
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
				success: function(res){
				},
				error:function(request, status, error){
					 alert("code:"+request.status+"\n"+"message:"
			                  +request.responseText+"\n"+"error:"+error);
				} 
			})
		}
	
	
		// 모두 체크
		$("#allCheck").click(function checkAll(){
			console.log("#allCheck")
				if(orderform.remove.length == undefined){
					orderform.remove.checked = orderform.allCheck.checked;
				}else{
					for(var i=0;i<orderform.remove.length;i++){
						orderform.remove[i].checked = orderform.allCheck.checked;
					}
					javascript:basket.checkItem();
				}
		}); 
			
		//#delButton을 누르면 체크박스 타입이고 name = remove인 input이 체크 되었는지 확인 후 값을 얻어내서 cartNum에 값을 저장하고 ajax를 이용해 단일삭제
		//( 위치 : proj21_shop.controller.order/CartServiceController.java )
		$('#delButton').on("click", function(){
				
				/* 여러개 체크된값 가져오기 */
 			var data_arr = [];
 			$("input:checkbox[name = 'remove']:checked").each(function(){
 					var item = $(this).val();
 					data_arr.push(item);
 			})	
 			// 반복문 사용후 push로 인한 값들을 형식에 맞게 사용후 넣어주자.	
			var cartNums = {cartNum : [data_arr]}; 
			delCarts(cartNums)				 
		});
	 	
		// 배열로 여러개 받아서 삭제 하기
		function delCarts(cartNums){
			$.ajax({
				url: contextPath + "/api/memberProductCarts",
				type: 'post' ,
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				data: JSON.stringify(cartNums.cartNum[0]),
				success: function(res){
					window.location.href = contextPath + "/cart?memId=${authInfo.id }";
					},
				error:function(request, status, error){
					alert("제품을 선택해주세요")
				window.location.href = contextPath+"/cart?memId=${authInfo.id }";
				} 
			});
		}
		
		// 단일 삭제 하기 (proj21_shop.controller.order/CartServiceController.java )
		function delCart(cartNum){
			 $.ajax({
				url: contextPath + "/api/memberProductCart/" + cartNum,
				type: 'delete' ,
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				data: JSON.stringify(cartNum),
				success: function(res){
				},
				error:function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"
			                  +request.responseText+"\n"+"error:"+error);
				} 
			}); 
		}
		
		/* 선택한 상품 주문 버튼 클릭 */
		$(".orderBtn").on("click",function(){
			var data_arr = [];
 			$("input:checkbox[name = 'remove']:checked").each(function(){
 					var item = $(this).val();
 					data_arr.push(item);
 			})	
 				
			var cartNums = {cartNum : [data_arr]};
 			selectOrderProduct(cartNums) 
			
		})
		
		/* 선택한 버튼으로 검색후 주문페이지로 이동하기 */
		function selectOrderProduct(cartNums){
			$.ajax({
				url: contextPath + "/api/chooseProductCarts",
				type: 'post' ,
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				data: JSON.stringify(cartNums.cartNum[0]),
				success: function(res){
					console.log(cartNums.cartNum[0])
					window.location.href = contextPath+"/order?memId=${authInfo.id}";
				},
				error:function(request, status, error){
					/* alert("code:"+request.status+"\n"+"message:"
			                  +request.responseText+"\n"+"error:"+error); */
					alert("제품을 선택해주세요")			                  
				}  
			});
		}
			
	});
</script>
</head>
<body>
<div class="container">
<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
	<h1 style="font-size: 70px">장바구니</h1>
	<form name="orderform" id="orderform" method="post" class="orderform" action="/Page" onsubmit="return false;">
            <input type="hidden" name="cmd" value="order">
            <div class="basketdiv" id="basket">
                <div class="row head">
                    <div class="subdiv">
                        <div class="check"><input type="checkbox" id="allCheck" name="allCheck" /></div>
                        <div class="img">이미지</div>
                        <div class="pname">상품명(사이즈)</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">적립금</div>
                        <div class="num">수량</div>
                        <div class="sum">가격</div>
                    </div>
                    <div class="subdiv">
                    </div>
                    <div class="split"></div>
                </div>
        	<div class="load_row_data">
            </div>
    		</div>

            <div class="right-align basketrowcmd">
                <a href="javascript:void(0)" id="delButton" class="abutton">선택상품삭제</a>
            </div>
    
            <div class="bigtext right-align sumcount" id="sum_p_num">상품개수: 0개</div>
            <div class="bigtext right-align box summoney" id="sum_p_price">합계금액: 0원</div>
    
            <div id="goorder">
                <div class="clear"></div>
                <div class="buttongroup center-align cmd">
                    <a class = "orderBtn">선택한 상품 주문</a>
                </div>
            </div>
        </form>
        
<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</div>
</body>
</html>