<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		var contextPath = "${contextPath}";
		var memberId = "${memberId}";
		var orderProNum = "${orderProNum}";
		var orderCode = "${orderCode}";
		var sCont = "";


		$.get(
						contextPath + "/api/detailorder/" + memberId + "/"+orderProNum,
						function(json) {
							console.log(json);
							var dataLength = json[0].productDTO.length;
							for(i = 0; i < dataLength; i++){
							sCont += "<tr>";
							sCont += "<td>" + json[0].orderProNum + "-" + json[0].productDTO[i].orderCode[0].orderCode + "</td>";
							sCont += "<td><a href='productDetail?proNum="+ json[0].productDTO[i].proNum + "'><img src='" + contextPath +"/resources/product/images/" + json[0].productDTO[i].proImgfileName + "' width = '80' height='60'></a></td>";
							sCont += "<td>" + comma(json[0].productDTO[i].proPrice * json[0].productDTO[i].orderCode[0].orderProQuantity * (100-json[0].productDTO[i].proSalesrate) * 0.01 * 0.01) +"P"+ "</td>";
							sCont += "<td>" + comma(json[0].productDTO[i].proPrice * json[0].productDTO[i].orderCode[0].orderProQuantity * (100-json[0].productDTO[i].proSalesrate) * 0.01)  + "원</td>";
							sCont += "<td>" + json[0].productDTO[i].orderCode[0].orderProQuantity+ "</td>";
							sCont += "<td>" + json[0].deliveryStatus+ "</td>";
							sCont += "<td>" + json[0].orderDate+ "</td>";
							/* 후기 작성하는 페이지로 이동 */
							sCont += "<td><div class = 'btnItems'><a class='button' href='detailreview?memberId=" + memberId +"&proNum=" + json[0].productDTO[i].proNum + "'>후기작성</a>"
							/* 반품 요청하는 버튼 */
							sCont += "<a class='button' href='requestRefund?orderProNum="+json[0].orderProNum+"&orderCode="+json[0].productDTO[i].orderCode[0].orderCode+"&memberId="+memberId+"''>반품요청</a></div></td>";
							
							}
							
							$("#load").append(sCont);

							var sConts = "";

							sConts = "";
							sConts += "<tr>";
							sConts += "<th scope='cols'>이름</th>";
							sConts += "<td>" + json[0].orderMemberName + "</td>";
							sConts += "</tr>";
							sConts += "<tr>";
							sConts += "<th scope='cols'>연락처</th>";
							sConts += "<td>" + json[0].receiverTel1 + "/"
									+ json[0].receiverTel2 + "</td>";
							sConts += "</tr>";
							sConts += "<tr>";
							sConts += "<th scope=cols'>배송지 주소</th>";
							sConts += "<td>" + "(" + json[0].deliveryAddr1
									+ ") " + json[0].deliveryAddr2 + " "
									+ json[0].deliveryAddr3 + "</td>";
							sConts += "</tr>";
							sConts += "<tr>";
							sConts += "<th scope='cols'>배송 메시지</th>";
							sConts += "<td>" + json[0].requestToDelivery + "</td>";
							sConts += "</tr>";
							$("#delivery").prepend(sConts);

							sCon = "";
							var orderPrice = 0;
							var newPrice = 0;
							var sum= 0;
							/*원래 제품 할인되는 금액*/
							var discount = 0;
							/*최종 할인 금액 = 원래 제품 할인되는 금액 + 제품구매시 사용한 포인트*/
							var finalDiscount = 0;
							sCon += "<tr>";
							sCon += "<th scope='cols'>상품합계</th>";
						 	for(i = 0; i < dataLength; i++){
						 		/*console.log(parseInt(json[0].proName[i].proPrice)
						 				+parseInt(json[0].proName[i].proPrice)) */
							sum += json[0].productDTO[i].proPrice * json[0].productDTO[i].orderCode[0].orderProQuantity * (100-json[0].productDTO[i].proSalesrate) * 0.01;
							}
						 	for(i = 0; i < dataLength; i++){
						 		discount += json[0].productDTO[i].proPrice * json[0].productDTO[i].orderCode[0].orderProQuantity * json[0].productDTO[i].proSalesrate * 0.01;
						 	} 
						 	finalDiscount = json[0].orderDiscount
						 	for(i = 0; i < json[0].productDTO.length ; i++){
						 		orderPrice += json[0].productDTO[i].proPrice * json[0].productDTO[i].orderCode[0].orderProQuantity 
						 		newPrice += json[0].productDTO[i].proPrice * json[0].productDTO[i].orderCode[0].orderProQuantity * (100-json[0].productDTO[i].proSalesrate) * 0.01
						 	}	
						 	
						 	var finalPrice = orderPrice-finalDiscount
						 	var usePoint = finalDiscount - discount
							sCon += "<td>" + comma(orderPrice) + "원</td>";
							sCon += "</tr>";
							sCon += "<tr>";
							sCon += "<th scope='cols'>할인합계</th>";
							sCon += "<td>" + comma(finalDiscount) + "원 <span class = 'discountItem'>사용한 포인트/제품 할인 금액 "+ comma(usePoint) +"P/"+ comma(discount) +"원</span></td>";
							sCon += "</tr>";
							sCon += "<tr>";
							sCon += "<th scope='cols'>최종 결제 금액</th>";
							sCon += "<td>" + comma(finalPrice) + "원</td>";
							sCon += "</tr>";
							sCon += "<tr>";
							sCon += "<th scope='cols'>예상적립금<br><span class = 'pointEx'>기존 할인된 제품 가격의 1%</span> </th>";
							sCon += "<td>"+ comma(newPrice * 0.01) + "P</td>";
							sCon += "</tr>";
							
							$("#pay").prepend(sCon);
							
							/*숫자 3자리수 표시*/
							function comma(price){
								return price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
							}
						})
						
						
	})
</script>
<link rel="stylesheet" href="${contextPath }/resources/order/css/myOrderDetail.css" />
<link rel="stylesheet" href="${contextPath }/resources/main/css/main.css">
</head>
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
	</div>
	<div class="container">
	<h2>상세주문내역</h2>
	<table class="type11">
		<thead>
			<tr>
				<th>주문번호</th>
				<th>상품정보</th>
				<th>포인트 적립</th>
				<th>주문금액</th>
				<th>주문수량</th>
				<th>주문상태</th>
				<th>주문일</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody id="load"></tbody>
	</table>
	<div class="test">
		<img alt="주문안내" src="${contextPath }/images/orderInfo.jpg">
		<h2>배송지 정보</h2>
	</div>
		<table class="type04" id="delivery"></table>
			<h2>최종 결제 정보</h2>
			<table class="type04" id="pay"></table>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
	</div>
</body>
</html>