<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/proj21_shop/resources/main/css/main.css">
<link rel="stylesheet" href="${contextPath }/resources/order/css/memberOrderProduct.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${contextPath }/resources/order/js/memberAddress.js"></script>  
<script type="text/javascript">
$(function(){
	var contextPath = "${contextPath}";
	var memId =  "${memId}";
	var cartNums = ${cartNums};
	
	/* 유저 포인트 */
	var totalMemberPoint = ${authInfo.mPoint};
	var totalMemberPointFmt = totalMemberPoint.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"P";
	
	/* 원래 판매 금액 */
	var sumPrice = 0;
	
	/* 결제 예정 금액 */
	var sumOrderPrice = 0;
	
	/* 결제 상품 개수 */
	var sumNum = 0;

	/* 할인된 금액 */
	var sumSale = 0;
	
	for(j = 0; j < cartNums.length; j++){
		$.get(contextPath + "/api/chooseProductCart/"+cartNums[j],
			function(json){
							
				var dataLength = json.length;
					if(dataLength >= 1){
						var sCont = "";
							for(i = 0; i < dataLength; i++){
									
									switch(json[i].cartProNum.proSize){
									case 1:
										json[i].cartProNum.proSize = "XS";
										break;
									case 2:
										json[i].cartProNum.proSize = "S";
										break;
									case 3:
										json[i].cartProNum.proSize = "M";
										break;
									case 4:
										json[i].cartProNum.proSize = "L";
										break;
									case 5:
										json[i].cartProNum.proSize = "XL";
										break;
									}
									
									sCont += "<div class='row data'>"
										sCont +=		"<div class='subdiv'>"
										sCont +=			"<div class='check'>&nbsp;</div>"
										sCont +=			"<div class='img'><img src="+contextPath+"/resources/product/images/"+json[i].cartProNum.proImgfileName+" width='40' height='60'></div>"
										sCont +=			"<div class='pname'>"
										sCont +=       			"<span>"+json[i].cartProNum.proName+"("+json[i].cartProNum.proSize+")"+"</span>"
										sCont +=  	  		"</div>"
										sCont +=		"</div>"
										sCont +=		"<div class='subdiv'>"
										sCont +=			"<div class='basketprice'>"+(100-json[i].cartProNum.proSalesrate)*json[i].cartProNum.proPrice*0.0001*json[i].cartProQuantity+"P</div>"
										sCont +=			"<div class='num'>"
										sCont +=				"<div class='updown'> "
										sCont +=       			"<input type='hidden' name='pPrice' id='pPrice1' class='pPrice' value="+((100-json[i].cartProNum.proSalesrate)*json[i].cartProNum.proPrice)/100+"/>"
										sCont +=					"<input type='text' name='pNum"+i+"' id='pNum"+i+"' size='2' maxlength='4' class='pNum' value="+json[i].cartProQuantity+" onkeyup='javascript:basket.changePNum("+i+");' readonly>"
										sCont +=				"</div>"
										sCont +=			"</div>"
										sCont +=			"<div class='sum'>"+(((100-json[i].cartProNum.proSalesrate)*json[i].cartProNum.proPrice*json[i].cartProQuantity)/100).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원</div> "
										sCont +=			"<div class='subdiv'>"
										sCont +=			"</div>"
										sCont +=		"</div>"
										sCont +="</div> "
										
										sumOrderPrice += (((100-json[i].cartProNum.proSalesrate)*json[i].cartProNum.proPrice*json[i].cartProQuantity)/100);
										sumNum += json[i].cartProQuantity;
										sumSale += (((json[i].cartProNum.proSalesrate)*json[i].cartProNum.proPrice*json[i].cartProQuantity)/100);
										sumPrice	+= json[i].cartProNum.proPrice*json[i].cartProQuantity
							}
								$(".loadRowData").append(sCont);
								
					}
					$('.sumPNum').text("상품개수 : "+sumNum+"개")
					$('.sumPOrderprice').text((sumOrderPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원"))
					$('.sumPSale').text((sumSale.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원"))
					$('.sumPPrice').text((sumPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원"))
					
					$('.actualOrderPrice').val(sumOrderPrice)
					$('.sumPrice').val(sumPrice)
		})
		/* 계산하기 */
	
	}
	
	/* 요청사항 직접입력 클릭시 */
	$("#divSelectbox").on("click",function(){
		var test = $(this).val()
		if(test == "etc"){
			$("#etcTextarea").addClass('active')
		}else{
			$("#etcTextarea").removeClass('active')
		}
	})
	
	/* 회원 포인트 */
	$('#memberPoint').text(totalMemberPointFmt)
	
	
	/* 회원 포인트 사용 모두사용버튼 클릭시*/
	$("input:checkbox[name='checkPoint']").on("click",function(){
		/* 결제 예정 금액 */
		var actualPrice = sumOrderPrice
		var actualPriceFmt = sumOrderPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
		var actualPriceFmtOne = sumOrderPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원"
		
		/* 원래 판매 금액 - 결제 예정 금액 = 할인금액*/
		var price = sumPrice - actualPrice 
		var priceFmt = (sumPrice - actualPrice).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원" 
		
		
		var afterTotalMemberPoint = totalMemberPoint - actualPrice
		var afterTotalMemberPointFmt = afterTotalMemberPoint.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"P"
		
		
		if($("input:checkbox[name='checkPoint']").is(":checked") == true) {
			/* 실제 내야할 금액이 포인트 보다 크다면 전체 사용시 모든 포인트 사용후 사용한 포인트 만큼 할인금액 + , 결제예정금액 -*/
			if($('.actualOrderPrice').val() > ${authInfo.mPoint}){
				$('.usePoint').val((${authInfo.mPoint}).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","))
				$('.sumPSale').text((price + totalMemberPoint).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원")
				$('.sumPOrderprice').text((actualPrice - totalMemberPoint).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원")
				$('#memberPoint').text("0P")
			}
			/* 실제 내야할 금액이 포인트 보다 작다면 전체 사용시 지불해야할 금액만큼 포인트 사용*/
			else if($('.actualOrderPrice').val() <= ${authInfo.mPoint}){
				$('.usePoint').val(actualPriceFmt)
				$('.sumPSale').text($('.sumPPrice').text())
				$('.sumPOrderprice').text("0원")
				$('#memberPoint').text(afterTotalMemberPointFmt)
			}
			
		}else{
			
			$('.usePoint').val(0)
			$('.sumPSale').text(priceFmt)
			$('.sumPOrderprice').text(actualPriceFmtOne)
			
			/* 포인트 계산 */
			$('#memberPoint').text(totalMemberPointFmt)
		}
	})
		
	/* 키보드입력으로 포인트 사용 */
	$('.usePoint').keyup(function(e){
		/* 정규표현식 숫자만 */
		var regexp = /^[0-9]*$/
		var consumePoint = $(this).val()
		
		/* 사용된 포인트 */
		var res = totalMemberPoint - consumePoint
		
		/* 원래금액 - 할인된 결제 금액 = 할인금액 에 추가 사용할 포인트를 더한값*/
		var oldPrice = parseInt(sumPrice - sumOrderPrice);
		var newPrice = parseInt(sumPrice - sumOrderPrice) + parseInt(consumePoint)
		
		/* 포인트 추가로 적용된 제품 가격 */
		var oldOrderPrice = sumOrderPrice
		var newOrderPrice = sumOrderPrice - consumePoint
		
		
		
		if(!regexp.test(consumePoint)){
			$('#memberPoint').text("숫자를 입력해주세요")
		}else if(consumePoint <= totalMemberPoint){
			$('.sumPOrderprice').text(newOrderPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원")
			$('.sumPSale').text(newPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원")
			$('#memberPoint').text(res.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"P")
			if(consumePoint == ""){
				$('.sumPSale').text(oldPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원")
			}
		}else if(consumePoint > totalMemberPoint){
			$('#memberPoint').text("사용 가능한 포인트를 초과하였습니다.")
			$('.sumPSale').text(oldPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원")
			$('.sumPOrderprice').text(oldOrderPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원")
		}
		
		if(newOrderPrice < 0){
			$('#memberPoint').text("모두 사용 버튼을 눌러주세요")
		}
	})
	
	
	/* 회원정보 set하기 버튼*/
	$("input:radio[name = 'setMemberOrderInfo']").on("click",function(){
		if($("input:radio[name = 'setMemberOrderInfo']").is(":checked") == true){
			var chooseInfo = $(this).val()
			if(chooseInfo == "memberInfo"){
				$.get(contextPath + "/api/existOrderMember/"+memId,
					function(json){
					var memberPh = json.memberPh
					var setPh = memberPh.split("-")
					$('#memberName').val(json.memberName)
					$('#memberEmail').val(json.memberEmail)
					$('#memberTel1').val(setPh[0])
					$('#memberTel2').val(setPh[1])
					$('#memberTel3').val(setPh[2])
					$('#sample4_postcode').val(json.memberAddr1)
					$('#sample4_roadAddress').val(json.memberAddr2)
					$('#sample4_detailAddress').val(json.memberAddr3)
				})
					
					
						/* $('#memberName').val("이태훈") */
			}else if(chooseInfo == "newMemberInfo"){
				$("input:radio[name='setSameMemberInfo']").prop("checked",false)
				$('#memberName').val("")
				$('#memberEmail').val("")
				$('#memberTel1').val("")
				$('#memberTel2').val("")
				$('#memberTel3').val("")
				$('#sample4_postcode').val("")
				$('#sample4_roadAddress').val("")
				$('#sample4_detailAddress').val("")
				$('.receiver').val("")
				$('.receiverTel1').val("")
				$('.receiverTel2').val("")
				$('.receiverTel3').val("")
			}
		}
	})
	
	$("input:radio[name='setSameMemberInfo']").on("click",function(){
		if($(this).is(":checked") == true){
			$('.receiver').val($('#memberName').val())
			$('.receiverTel1').val($('#memberTel1').val())
			$('.receiverTel2').val($('#memberTel2').val())
			$('.receiverTel3').val($('#memberTel3').val())
		}
	})
	
})

</script>
<title>상품 구매 페이지</title>
</head>
<body>
<div class="container">
<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
<h1 class="orderMenuTitle ">현재 주문 상품 내역</h1>
<form name="orderform" id="orderform" method="post" class="orderform" action="/Page" onsubmit="return false;">
            <div class="basketdiv" id="basket">
                <div class="row head">
	                    <div class="subdiv">
	                        <div class="check"></div>
	                        <div class="img">이미지</div>
	                        <div class="pname">상품명(사이즈)</div>
	                    </div>
	                    <div class="subdiv">
	                        <div class="basketprice">적립금</div>
	                        <div class="num">수량</div>
	                        <div class="sum">가격</div>
	                    </div>
               	 </div>
               	 <div></div>
        		<div class="loadRowData"></div>
    		</div>
    		
		<!-- 구매자 정보 -->    
    	<div class="orderMemberInfo">
    		<h1 class="orderMenuTitle orderMenuTitleMargin orderMem">구매자 정보</h1>
			  <input type="radio" name = "setMemberOrderInfo" value="memberInfo"/><span style="font-size: 15px; color: black;">기존 회원 정보로 주문</span>&nbsp;&nbsp; 
			  <input type="radio" name = "setMemberOrderInfo" value="newMemberInfo"/> <span style="font-size: 15px; color: black;">신규 정보로 주문</span>
					<p>
						<input type="text" id="memberName" placeholder="이름">
					</p>
					<p>
						<input type="text" id = "memberTel1" placeholder="전화번호">
						- <input id = "memberTel2" type="text">
						- <input id = "memberTel3" type="text">
					</p>
					<p>
						<input id = "memberEmail" type="email" placeholder="이메일">
					</p>
					
		
    	
    	<!-- 수령자 정보 -->
    		<h1 class="orderMenuTitle orderMenuTitleMargin">수령자 정보</h1>
    		<input type="radio" name = "setSameMemberInfo" value="setSameMemberInfo"/><span style="font-size: 15px; color: black;">구매자 정보와 동일</span>
    		<p>
				<input type="text" class="receiver" placeholder="수령인">
			</p>
			<p>
				<input type="text" class="receiverTel1" placeholder="전화번호">
				- <input type="text" class="receiverTel2">
				- <input type="text" class="receiverTel3">
			</p>
			<p>
				<select name="divSelectbox" id = 'divSelectbox'>
					<option value="notRequest">배송 시 요청사항을 선택해주세요</option>
					<option value="부재 시 경비실에 맡겨 주세요">부재 시 경비실에 맡겨 주세요</option>
					<option value="부재 시 택배함에 넣어주세요">부재 시 택배함에 넣어주세요</option>
					<option value="부재 시 집앞에 놔주세요">부재 시 집앞에 놔주세요</option>
					<option value="배송전 연락 바랍니다">배송전 연락 바랍니다</option>			
					<option value="파손의 위험이 있는 물건입니다. 배송 시 주위해주세요">파손의 위험이 있는 물건입니다. 배송 시 주위해주세요</option>			
					<option value="etc">직접 입력</option>
				</select>
					<br>
					<textarea id="etcTextarea" name="etcTextarea" placeholder="최대 30자까지 입력 가능합니다."></textarea>
			</p>
    		<input type="text" id="sample4_postcode" placeholder="우편번호"/> 
			<input type="button" onclick="sample4_execDaumPostcode()"value="우편번호 찾기"> <br> 
			<input type="text" id="sample4_roadAddress" placeholder="도로명주소"/>
			<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
			<span id="guide" style="color: #999; display: none"></span> 
			<input type="text" id="sample4_detailAddress" placeholder="상세주소"/> 
			<input type="text" id="sample4_extraAddress" placeholder="참고항목">
		</div>
		
		<!-- 결제정보 -->
    	<h1 class="orderMenuTitle orderMenuTitleMargin">결제 정보</h1>
            <table id="paymentInformation">
            	<thead>
            		<tr>
            			<td class="paymentInformationPPrice">상품금액</td>
            			<td class="paymentInformationSign"></td>
            			<td class="paymentInformationPPrice">할인금액</td>
            			<td>
            				<input class = "actualOrderPrice" type="hidden" value='sumOrderPrice'>
            			</td>
            			<td class="paymentInformationPOrderprice">결제예정금액</td>
            		</tr>
            	</thead>
            	<tbody>
            		<tr>
            			<td class="sumPPrice" >
            				<input class = "sumPrice" type="hidden" value='sumPrice'>
            			</td>
            			<td class="paymentInformationSign">-</td>
            			<td class="sumPSale"></td>
            			<td class="paymentInformationSign">=</td>
            			<td class="sumPOrderprice"></td>
            		</tr>
            	</tbody>
            </table>
            <div class="payInfo">
	            <p>적립금 사용 : 
	            	<input type="text" class="usePoint" value="0"> P<input type="checkbox" name="checkPoint" class="checkPoint" >
	            	<span>모두사용</span>
	            	<span style="font-size: 14px; color: #444444;">  사용가능한 포인트 : </span> 
	            	<span id="memberPoint" style="font-size: 14px; color: #444444;"></span>
	            </p>
	            <p>결제 방법 </p>
	            <p>무통장 입금 : <span>국민은행 계좌번호  940***-**-******  예금주 : ***</span></p>
            </div>
            <div class="orderBtnsGroup">
            <input class = 'orderBtns' type="submit" value="주문하기">
            <input class = 'orderBtns' type="submit" value="취소하기">
            </div>
</form> 
        
<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</div>
</body>
</html>