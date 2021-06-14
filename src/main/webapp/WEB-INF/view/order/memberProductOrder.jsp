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
	var total_member_point = ${authInfo.mPoint};
	var total_member_point_fmt = total_member_point.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"P";
	
	/* 원래 판매 금액 */
	var sum_price = 0;
	
	/* 결제 예정 금액 */
	var sum_order_price = 0;
	
	/* 결제 상품 개수 */
	var sum_num = 0;

	/* 할인된 금액 */
	var sum_sale = 0;
	
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
										sCont +=       			"<input type='hidden' name='p_price' id='p_price1' class='p_price' value="+((100-json[i].cartProNum.proSalesrate)*json[i].cartProNum.proPrice)/100+"/>"
										sCont +=					"<input type='text' name='p_num"+i+"' id='p_num"+i+"' size='2' maxlength='4' class='p_num' value="+json[i].cartProQuantity+" onkeyup='javascript:basket.changePNum("+i+");' readonly>"
										sCont +=				"</div>"
										sCont +=			"</div>"
										sCont +=			"<div class='sum'>"+(((100-json[i].cartProNum.proSalesrate)*json[i].cartProNum.proPrice*json[i].cartProQuantity)/100).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원</div> "
										sCont +=			"<div class='subdiv'>"
										sCont +=			"</div>"
										sCont +=		"</div>"
										sCont +="</div> "
										
										sum_order_price += (((100-json[i].cartProNum.proSalesrate)*json[i].cartProNum.proPrice*json[i].cartProQuantity)/100);
										sum_num += json[i].cartProQuantity;
										sum_sale += (((json[i].cartProNum.proSalesrate)*json[i].cartProNum.proPrice*json[i].cartProQuantity)/100);
										sum_price	+= json[i].cartProNum.proPrice*json[i].cartProQuantity
							}
								$(".load_row_data").append(sCont);
								
					}
					$('.sum_p_num').text("상품개수 : "+sum_num+"개")
					$('.sum_p_orderprice').text((sum_order_price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원"))
					$('.sum_p_sale').text((sum_sale.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원"))
					$('.sum_p_price').text((sum_price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원"))
					
					$('.actual_order_price').val(sum_order_price)
					$('.sum_price').val(sum_price)
		})
		/* 계산하기 */
	
	}
	
	/* 요청사항 직접입력 클릭시 */
	$("#div_selectbox").on("click",function(){
		var test = $(this).val()
		if(test == "etc"){
			$("#etc_textarea").addClass('active')
		}else{
			$("#etc_textarea").removeClass('active')
		}
	})
	
	/* 회원 포인트 */
	$('#member_point').text(total_member_point_fmt)
	
	
	/* 회원 포인트 사용 */
	$("input:checkbox[name='check_point']").on("click",function(){
		/* 결제 예정 금액 */
		var actual_price = sum_order_price
		var actual_price_fmt = sum_order_price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
		var actual_price_fmt_one = sum_order_price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원"
		
		/* 원래 판매 금액 - 결제 예정 금액 = 할인금액*/
		var price = sum_price - actual_price 
		var price_fmt = (sum_price - actual_price).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원" 
		
		
		var after_total_member_point = total_member_point - actual_price
		var after_total_member_point_fmt = after_total_member_point.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"P"
		
		
		if($("input:checkbox[name='check_point']").is(":checked") == true) {
			/* 실제 내야할 금액이 포인트 보다 크다면 전체 사용시 모든 포인트 사용후 사용한 포인트 만큼 할인금액 + , 결제예정금액 -*/
			if($('.actual_order_price').val() > ${authInfo.mPoint}){
				$('.use_point').val((${authInfo.mPoint}).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","))
				$('.sum_p_sale').text((price + total_member_point).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원")
				$('.sum_p_orderprice').text((actual_price - total_member_point).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원")
			}
			/* 실제 내야할 금액이 포인트 보다 작다면 전체 사용시 지불해야할 금액만큼 포인트 사용*/
			else if($('.actual_order_price').val() <= ${authInfo.mPoint}){
				$('.use_point').val(actual_price_fmt)
				$('.sum_p_sale').text($('.sum_p_price').text())
				$('.sum_p_orderprice').text("0원")
				$('#member_point').text(after_total_member_point_fmt)
			}
			
		}else{
			
			$('.use_point').val(0)
			$('.sum_p_sale').text(price_fmt)
			$('.sum_p_orderprice').text(actual_price_fmt_one)
			
			/* 포인트 계산 */
			$('#member_point').text(total_member_point_fmt)
		}
		
	})
		
	/* 회원정보 set하기 버튼*/
	$("input:radio[name = 'set_member_order_info']").on("click",function(){
		if($("input:radio[name = 'set_member_order_info']").is(":checked") == true){
			console.log(222)
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
<h1 class="order_menu_title ">현재 주문 상품 내역</h1>
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
        		<div class="load_row_data"></div>
    		</div>
    		
		<!-- 구매자 정보 -->    
    	<div class="order_member_info">
    		<h1 class="order_menu_title order_menu_title_margin order_mem">구매자 정보</h1>
			  <input type="radio" name = "set_member_order_info" /><span style="font-size: 15px; color: black;">기존 회원 정보로 주문</span>&nbsp;&nbsp; 
			  <input type="radio" name = "set_member_order_info"/> <span style="font-size: 15px; color: black;">신규 정보로 주문</span>
					<p>
						<input type="text" placeholder="이름">
					</p>
					<p>
						<input type="text" placeholder="전화번호">
						- <input type="text">
						- <input type="text">
					</p>
					<p>
						<input type="email" placeholder="이메일">
					</p>
					
		
    	
    	<!-- 수령자 정보 -->
    		<h1 class="order_menu_title order_menu_title_margin">수령자 정보</h1>
    		<p>
				<input type="text" placeholder="수령인">
			</p>
			<p>
				<input type="text" placeholder="전화번호">
				- <input type="text">
				- <input type="text">
			</p>
			<p>
				<select name="div_selectbox" id = 'div_selectbox'>
					<option value="">배송 시 요청사항을 선택해주세요</option>
					<option value="부재 시 경비실에 맡겨 주세요">부재 시 경비실에 맡겨 주세요</option>
					<option value="부재 시 택배함에 넣어주세요">부재 시 택배함에 넣어주세요</option>
					<option value="부재 시 집앞에 놔주세요">부재 시 집앞에 놔주세요</option>
					<option value="배송전 연락 바랍니다">배송전 연락 바랍니다</option>			
					<option value="파손의 위험이 있는 물건입니다. 배송 시 주위해주세요">파손의 위험이 있는 물건입니다. 배송 시 주위해주세요</option>			
					<option value="etc">직접 입력</option>
				</select>
					<br>
					<textarea id="etc_textarea" name="etc_textarea" placeholder="최대 30자까지 입력 가능합니다."></textarea>
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
    	<h1 class="order_menu_title order_menu_title_margin">결제 정보</h1>
            <table id="payment_information">
            	<thead>
            		<tr>
            			<td class="payment_information_p_price">상품금액</td>
            			<td class="payment_information_sign"></td>
            			<td class="payment_information_p_price">할인금액</td>
            			<td>
            				<input class = "actual_order_price" type="hidden" value='sum_order_price'>
            			</td>
            			<td class="payment_information_p_orderprice">결제예정금액</td>
            		</tr>
            	</thead>
            	<tbody>
            		<tr>
            			<td class="sum_p_price" >
            				<input class = "sum_price" type="hidden" value='sum_price'>
            			</td>
            			<td class="payment_information_sign">-</td>
            			<td class="sum_p_sale"></td>
            			<td class="payment_information_sign">=</td>
            			<td class="sum_p_orderprice"></td>
            		</tr>
            	</tbody>
            </table>
            <div class="payInfo">
	            <p>적립금 사용 : 
	            	<input type="text" class="use_point" value="0"> P<input type="checkbox" name="check_point" class="check_point" >
	            	<span>모두사용</span>
	            	<span style="font-size: 14px; color: #444444;">  사용가능한 포인트 : </span> 
	            	<span id="member_point" style="font-size: 14px; color: #444444;"></span>
	            </p>
	            <p>결제 방법 </p>
	            <p>무통장 입금 : <span>국민은행 계좌번호  940***-**-******  예금주 : ***</span></p>
            </div>
            <div class="order_btns_group">
            <input class = 'order_btns' type="submit" value="주문하기">
            <input class = 'order_btns' type="submit" value="취소하기">
            </div>
</form> 
        
<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</div>
</body>
</html>