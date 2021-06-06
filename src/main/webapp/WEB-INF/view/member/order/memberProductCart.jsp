<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />        
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="/proj21_shop/resources/main/css/main.css">
<link rel="stylesheet" href="${contextPath }/resources/member/css/memberProductCart.css">
<script type="text/javascript" src="${contextPath }/resources/member/js/memberProductCart.js"></script>  
<meta charset="UTF-8">
<title>장바구니</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	var contextPath = "${contextPath}";
	var memId = "${memId}";
	$.get(contextPath + "/api/memberProductCart/"+memId,
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
				sCont +=			"<div class='check'><input type='checkbox' name='buy' value='260' onclick='javascript:basket.checkItem();''>&nbsp;</div>"
				sCont +=			"<div class='img'><img src="+contextPath+"/resources/product/images/"+json[i].cartProNum.proImgfileName+" width='60'></div>"
				sCont +=			"<div class='pname'>"
				sCont +=       			"<span>"+json[i].cartProNum.proName+"("+json[i].cartProNum.proSize+")"+"</span>"
				sCont +=  	  		"</div>"
				sCont +=		"</div>"
				sCont +=		"<div class='subdiv'>"
				sCont +=			"<div class='basketprice'><input type='hidden' name='p_price' id='p_price1' class='p_price' value="+((100-json[i].cartProNum.proSalesrate)*json[i].cartProNum.proPrice)/100+">"+(100-json[i].cartProNum.proSalesrate)*json[i].cartProNum.proPrice*0.0001+"P</div>"
				sCont +=			"<div class='num'>"
				sCont +=				"<div class='updown'> "
				sCont +=					"<input type='text' name='p_num"+i+"' id='p_num"+i+"' size='2' maxlength='4' class='p_num' value="+json[i].cartProQuantity+" onkeyup='javascript:basket.changePNum("+i+");'>"
				sCont +=					"<span onclick='javascript:basket.changePNum("+i+");'><i class='fas fa-arrow-alt-circle-up up'></i></span>"
				sCont +=					"<span onclick='javascript:basket.changePNum("+i+");'><i class='fas fa-arrow-alt-circle-down down'></i></span>"
				sCont +=				"</div>"
				sCont +=			"</div>"
				sCont +=			"<div class='sum'>"+(((100-json[i].cartProNum.proSalesrate)*json[i].cartProNum.proPrice*json[i].cartProQuantity)/100).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원</div> "
				sCont +=		"</div>"
				sCont +=		"<div class='subdiv'>"
				sCont +=			"<div class='basketcmd'><a href='javascript:void(0)' class='abutton' onclick='javascript:basket.delItem();''>삭제</a></div> "
				sCont +=		"</div> "
				sCont +=		"<input type = 'hidden' value = "+json[i].cartNum+">"
				sCont +="</div> "

			}
			$(".load_row_data").append(sCont);
			$('#delButton').on("click", function(){
				var data = {cartNum : $('.cartNum').val()};
				console.log(data.cartNum);
				$.ajax({
					url: contextPath + "/api/memberProductCart/"+data.cartNum,
					type: 'Delete',
					success: function(res){
						alert(res);
						window.location.href = contextPath + "/order/cart?memId="+"${param.memId}";
					},
					error:function(request, status, error){
						window.location.href = contextPath+"/order/cart?memId="+"${param.memId}";
					}
				});
			}); 
		}
	});
});
</script>
</head>
<body>
<div class="container">
<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>

<form name="orderform" id="orderform" method="post" class="orderform" action="/Page" onsubmit="return false;">
            <input type="hidden" name="cmd" value="order">
            <div class="basketdiv" id="basket">
                <div class="row head">
                    <div class="subdiv">
                        <div class="check">선택</div>
                        <div class="img">이미지</div>
                        <div class="pname">상품명(사이즈)</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">적립금</div>
                        <div class="num">수량</div>
                        <div class="sum">가격</div>
                    </div>
                    <div class="subdiv">
    
                        <div class="basketcmd">삭제</div>
                    </div>
                    <div class="split"></div>
                </div>
        	<div class="load_row_data">
            </div>
    		</div>

            <div class="right-align basketrowcmd">
                <a href="javascript:void(0)" id="delButton" class="abutton" onclick="javascript:basket.delCheckedItem();">선택상품삭제</a>
                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delAllItem();">장바구니비우기</a>
            </div>
    
            <div class="bigtext right-align sumcount" id="sum_p_num">상품개수: 0개</div>
            <div class="bigtext right-align box summoney" id="sum_p_price">합계금액: 0원</div>
    
            <div id="goorder" class="">
                <div class="clear"></div>
                <div class="buttongroup center-align cmd">
                    <a href="javascript:void(0);">선택한 상품 주문</a>
                </div>
            </div>
        </form>
        
<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</div>
</body>
</html>