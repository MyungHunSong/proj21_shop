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
							sCont += "<td><img src='" + contextPath +"/resources/product/images/" + json[0].productDTO[i].proImgfileName + "' width = '80' height='60'></td>";
							sCont += "<td>" + json[0].productDTO[i].proPrice * json[0].productDTO[i].orderCode[0].orderProQuantity * (100-json[0].productDTO[i].proSalesrate) * 0.01 * 0.01 +"p"+ "</td>";
							sCont += "<td>" + json[0].productDTO[i].proPrice * json[0].productDTO[i].orderCode[0].orderProQuantity * (100-json[0].productDTO[i].proSalesrate) * 0.01  + "</td>";
							sCont += "<td>" + json[0].productDTO[i].orderCode[0].orderProQuantity+ "</td>";
							sCont += "<td>" + json[0].deliveryStatus+ "</td>";
							sCont += "<td>" + json[0].orderDate+ "</td>";

							sCont += "<td><a href='detailreview?memberId=" + memberId +"&proNum=" + json[0].productDTO[i].proNum + "'>후기작성 하러가기</a><br><a href='requestRefund?orderProNum="+json[0].orderProNum+"&orderCode="+json[0].productDTO[i].orderCode[0].orderCode+"&memberId="+memberId+"'>반품 요청</a></td>";

							
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
							var price = 0;
							var sum= 0;
							var discount = 0;
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
						 	for(i = 0; i < json[0].productDTO.length ; i++){
						 		price += json[0].productDTO[i].proPrice * json[0].productDTO[i].orderCode[0].orderProQuantity
						 	}	
						 	
							sCon += "<td>" + price + "</td>";
							sCon += "</tr>";
							sCon += "<tr>";
							sCon += "<th scope='cols'>할인합계</th>";
							sCon += "<td>" + discount + "</td>";
							sCon += "</tr>";
							sCon += "<tr>";
							sCon += "<th scope='cols'>최종 결제 금액</th>";
							sCon += "<td>" + sum + "</td>";
							sCon += "</tr>";
							sCon += "<tr>";
							sCon += "<th scope='cols'>예상적립금 </th>";
							sCon += "<td>"+ sum * 0.01 + "p</td>";
							sCon += "</tr>";
							
							$("#pay").prepend(sCon);
							
						})
	})
</script>
<link rel="stylesheet" href="/proj21_shop/resources/main/css/main.css">
<link rel="stylesheet"
	href="/proj21_shop/resources/order/css/myOrderDetail.css" />
</head>
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
	</div>
	<div class="test1">
	<h2>상세주문내역</h2>
	<table class="type11">
		<thead>
			<tr>
				<th scope="cols">주문번호</th>
				<th scope="cols">상품정보</th>
				<th scope="cols">포인트 적립</th>
				<th scope="cols">주문금액</th>
				<th scope="cols">주문수량</th>
				<th scope="cols">주문상태</th>
				<th scope="cols">주문일</th>
				<th scope="cols">비고</th>
			</tr>
		</thead>
		<tbody id="load"></tbody>
	</table>
	<div class="test">
		<img alt="주문안내" src="/proj21_shop/images/orderInfo.jpg">
		<h3>배송지 정보</h3>
	</div>
		<table class="type04" id="delivery"></table>
			<h3>최종 결제 정보</h3>
			<table class="type04" id="pay"></table>
	</div>
	<div class="container">
		<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
	</div>
</body>
</html>