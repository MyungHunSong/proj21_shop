<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/proj21_shop/resources/main/css/main.css">
<link rel="stylesheet" href="${contextPath }/resources/order/css/memberOrderProduct.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	
	
	
});
</script>
<title>상품 구매 페이지</title>
</head>
<body>
<div class="container">
<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
	<h2 class="order_menu_title">현재 주문 상품 내역</h2>
	<form name="orderform" id="orderform" method="post" class="orderform" action="/Page" onsubmit="return false;">
            <input type="hidden" name="cmd" value="order">
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
                    <div class="subdiv">
                    </div>
                    <div class="split"></div>
               </div>
        	<div class="load_row_data">
            </div>
    		</div>
            <div class="right-align basketrowcmd">
            </div>
    	<h2 class="order_menu_title">주문자 정보</h2>

    	<h2 class="order_menu_title">배송 정보</h2>
    	
    	<h2 class="order_menu_title">결제 정보</h2>
            
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