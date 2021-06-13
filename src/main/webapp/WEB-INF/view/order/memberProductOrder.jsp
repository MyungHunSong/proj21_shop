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
										sCont +=       			"<input type='hidden' name='p_price' id='p_price1' class='p_price' value="+((100-json[i].cartProNum.proSalesrate)*json[i].cartProNum.proPrice)/100+"/>"
										sCont +=					"<input type='text' name='p_num"+i+"' id='p_num"+i+"' size='2' maxlength='4' class='p_num' value="+json[i].cartProQuantity+" onkeyup='javascript:basket.changePNum("+i+");' readonly>"
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
								$(".load_row_data").append(sCont);
								
					}
					$('.sum_p_num').text("상품개수 : "+sumNum+"개")
					$('.sum_p_orderprice').text((sumOrderPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원"))
					$('.sum_p_sale').text((sumSale.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원"))
					$('.sum_p_price').text((sumPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원"))
		})
		/* 계산하기 */
	
	}
	
	/* 요청사항 직접입력 클릭시 */
	$("#div_selectbox").on("click",function(){
		console.log($(this.val))
	})
	
	
	
});
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
					<textarea id="etc_textarea" name="etc_textarea"  placeholder="최대 50자까지 입력 가능합니다."></textarea>
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
            
            <div class="bigtext right-align sumcount" class="sum_p_num">상품개수: 0개</div>
    
            <table>
            	<thead>
            		<tr>
            			<td>상품금액</td>
            			<td>할인금액</td>
            			<td>결제예정금액</td>
            		</tr>
            	</thead>
            	<tbody>
            		<tr>
            			<td class="sum_p_price" ></td>
            			<td class="sum_p_sale"></td>
            			<td class="sum_p_orderprice"></td>
            		</tr>
            	</tbody>
            </table>
</form> 
        
<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</div>
</body>
</html>