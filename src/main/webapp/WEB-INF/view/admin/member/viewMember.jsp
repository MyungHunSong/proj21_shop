<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="member" value="${viewMap.member }" />
<c:set var="averageOrder" value="${viewMap.averageOrder }" />
<c:set var="onDelivery" value="${viewMap.onDelivery }" />
<c:set var="onCart" value="${viewMap.onCart }" />
<c:set var="onRefund" value="${viewMap.onRefund }" />
<c:set var="cartList" value="${viewMap.cartList }" />
<c:set var="orderList" value="${viewMap.orderList }" />
<c:set var="refundList" value="${viewMap.refundList }" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 정보 수정</title>
<style>
@media ( min-width : 767.98px) {
	.card {
		margin-left: 300px;
		margin-right: 50px;
	}
}
</style>
<style>
.infotable {
	border-top: 1px solid #ccc;
	border-collapse: collapse;
	border-spacing: 1px;
	line-height: 1.5;
	padding: 0 0 0 50px;
}

.infotable td {
	width: 150px;
	padding: 5px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	border-top: 1px solid #ccc;
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
	text-align: center;
}

#chartContainer {
	/*     padding : 0 0 0 30px;  */
	
}

a#linkline {
	text-decoration: none;
	color: #FE2E2E;
}

a:hover {
	color: #FE2E2E;
}
</style>
<script src="${contextPath}/resources/admin/assets/libs/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="${contextPath}/resources/admin/assets/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="${contextPath}/resources/admin/assets/extra-libs/sparkline/sparkline.js"></script>
<!--Wave Effects -->
<script src="${contextPath}/resources/admin/dist/js/waves.js"></script>
<!--Menu sidebar -->
<script src="${contextPath}/resources/admin/dist/js/sidebarmenu.js"></script>
<!--Custom JavaScript -->
<script src="${contextPath}/resources/admin/dist/js/custom.min.js"></script>
<!--This page JavaScript -->
<!-- <script src="dist/js/pages/dashboards/dashboard1.js"></script> -->
<!-- Charts js Files -->
<script src="${contextPath}/resources/admin/assets/libs/flot/excanvas.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.pie.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.time.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.stack.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.crosshair.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
<script src="${contextPath}/resources/admin/dist/js/pages/chart/chart-page-init.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
<script>
window.onload = function () {
var options = {
   exportEnabled: true,
   animationEnabled: true,
   title:{
      text: "${member.memberName} 님 사이트 이용현황"
   },
   subtitles: [{
      text: ""
   }],
   
   axisY: {
      title: "방문수",
      titleFontColor: "#4F81BC",
      lineColor: "#4F81BC",
      labelFontColor: "#4F81BC",
      tickColor: "#4F81BC",
      includeZero: false
   },
   axisY2: {
      title: "평균 주문가격",
      titleFontColor: "#C0504E",
      lineColor: "#C0504E",
      labelFontColor: "#C0504E",
      tickColor: "#C0504E",
      includeZero: false
   },
   toolTip: {
      shared: true
   },
   legend: {
      cursor: "pointer",
      itemclick: toggleDataSeries
   },
   data: [{
      type: "spline",
      name: "방문수",
      showInLegend: true,
      xValueFormatString: "MMM YYYY",
      yValueFormatString: "#,##0 회",
      dataPoints: [
         { x: new Date(2019, 0, 1),  y: 5 },
         { x: new Date(2019, 1, 1), y: 8 },
         { x: new Date(2019, 2, 1), y: 3 },
         { x: new Date(2019, 3, 1),  y: 1 },
         { x: new Date(2019, 4, 1),  y: 5 },
         { x: new Date(2019, 5, 1),  y: 7 },
         { x: new Date(2019, 6, 1), y: 2 },
         { x: new Date(2019, 7, 1), y: 8 },
         { x: new Date(2019, 8, 1),  y: 14 },
         { x: new Date(2019, 9, 1),  y: 2 },
         { x: new Date(2019, 10, 1),  y: ${member.memberTotalLogin} },
         { x: new Date(2019, 11, 1), y:  0 }
      ]
   },
   {
      type: "spline",
      name: "평균 주문가격",
      axisYType: "secondary",
      showInLegend: true,
      xValueFormatString: "MMM YYYY",
      yValueFormatString: "#,##0.#원",
      dataPoints: [
         { x: new Date(2019, 0, 1),  y: 390340.5 },
         { x: new Date(2019, 1, 1), y: 200150 },
         { x: new Date(2019, 2, 1), y: 473420 },
         { x: new Date(2019, 3, 1),  y: 50000 },
         { x: new Date(2019, 4, 1),  y: 302340 },
         { x: new Date(2019, 5, 1),  y: 290340 },
         { x: new Date(2019, 6, 1), y: 604870 },
         { x: new Date(2019, 7, 1), y: 825230 },
         { x: new Date(2019, 8, 1),  y: 1000000 },
         { x: new Date(2019, 9, 1),  y: 2000000 },
         { x: new Date(2019, 10, 1),  y: ${averageOrder} },
         { x: new Date(2019, 11, 1), y: 0 }
      ]
   }]
};
$("#chartContainer").CanvasJSChart(options);
function toggleDataSeries(e) {
   if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
      e.dataSeries.visible = false;
   } else {
      e.dataSeries.visible = true;
   }
   e.chart.render();
}
}
</script>
<script>
</script>
</head>
<body>
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="comment-widgets scrollable">
						<br> <br>
						<center>
							<h2>회원 목록</h2>
							<hr>
							<form id="frm_search" action="${contextPath }/admin/member/searchMember" method="post">
								<table>
									<tr id="search">
										<td>회원</td>
										<td colspan="5"><input type="text" placeholder="이름 혹은 아이디" width="150" name="memberSearch" /></td>
										<td><input type="button" onClick="document.getElementById('frm_search').submit();" value="검색" /></td>
									</tr>
								</table>

							</form>
						</center>
						<br> <br>

						<center>
							<table border="1" class="infotable">

								<tr>
									<td colspan="6">활동 정보</td>
								</tr>
								<tr>
									<td>이름</td>
									<td>${member.memberName }</td>
									<td>아이디</td>
									<td>${member.memberId }</td>
									<td>적립금</td>
									<td><a href="#"><fmt:formatNumber value="${member.memberPoint}" pattern="#,###" /></a>원</td>
								</tr>


								<tr>
									<td>방문수</td>
									<td><fmt:formatNumber value="${member.memberTotalLogin}" pattern="#,###" />회</td>
									<td>누적 구매액</td>
									<td><fmt:formatNumber value="${member.memberTotalBuy}" pattern="#,###" />원</td>
									<td>누적 주문수</td>
									<td><a href="#"><fmt:formatNumber value="${member.memberTotalOrder}" pattern="#,###" /></a>회 (평균:<fmt:formatNumber value="${averageOrder}" pattern="#,###" />원)</td>
								</tr>
							</table>
						</center>
						<br> <br>

						<center>
							<div id="chartContainer" style="height: 370px; width: 50%;"></div>
						</center>

						<br>
						<hr>
						<center>
							<table>
								<caption>
									<Strong>고객 데이터</Strong>
								</caption>

								<tr>
									<td colspan="2">배송중인 상품</td>
									<td><a href="${contextPath }/admin/order/listOrders">${onDelivery} <c:if test="${onDelivery ==null }">0</c:if>
									</a>건</td>
								</tr>
								<tr><td>=============== </td></tr>
								<tr>
									<td colspan="2">반품대기중인 상품</td>
									<td><a href="${contextPath }/admin/member/viewMember?memberId=${member.memberId}">${onRefund} <c:if test="${onRefund ==null }">0</c:if>
									</a>건</td>
								</tr>
								<tr><td>=============== </td></tr>
								<tr>
									<td colspan="2">장바구니에 담은 상품</td>
									<td><a href="${contextPath }/admin/member/viewMember?memberId=${member.memberId}">${onCart} <c:if test="${onCart ==null }">0</c:if>
									</a>건</td>
								</tr>
							</table>
							<br> <br>
							<!--배송 중인 상품  -->
							<c:choose>
								<c:when test="${orderList !=null }">
										
											<br><h3>배송중 or 배송 준비중인 상품</h3><br>
										
									<table>
										<tr style="text-align: center;">
											<td width="100px">이미지</td>
											<td width="100px">상품명</td>
											<td width="100px">상품 정보</td>
											<td width="100px">주문자</td>
											<td width="100px">주문 가격</td>
											<td width="100px">결제 일자</td>
											<td width="100px">배송 상태</td>
										</tr>

										<c:forEach var="order" items="${orderList }">
											<tr style="text-align: center;">
												<td width="100px;"><a href="${contextPath}/product/productdetail?proNum=${order.pro.proNum}"> <img width="70px" height="105px"
														src="${contextPath}/thumbnails?proNum=${order.pro.proNum}&fileName=${order.pro.proImgfileName}"></a></td>
												<td>${order.pro.proName }</td>
												<td><c:if test="${order.pro.proColor == 1}">white /</c:if> <c:if test="${order.pro.proColor == 2}">ivory /</c:if> <c:if test="${order.pro.proColor == 3}">gray /</c:if>
													<c:if test="${order.pro.proColor == 4}">pink /</c:if> <c:if test="${order.pro.proColor == 5}">yellow /</c:if> <c:if test="${order.pro.proColor == 6}">mint /</c:if> <c:if
														test="${order.pro.proColor == 7}">green /</c:if> <c:if test="${order.pro.proColor == 8}">purple /</c:if> <c:if test="${order.pro.proColor == 9}">navy /</c:if> <c:if
														test="${order.pro.proColor == 11}">black /</c:if> <c:if test="${order.pro.proColor == 12}">brown /</c:if> <c:if test="${order.pro.proColor == 13}">orange /</c:if> <c:if
														test="${order.pro.proColor == 14}">blue /</c:if> <c:if test="${order.pro.proColor == 15}">red /</c:if> <c:if test="${order.pro.proColor == 16}">basic /</c:if> <c:if
														test="${order.pro.proSize == 1}">XS </c:if> <c:if test="${order.pro.proSize == 2}">S </c:if> <c:if test="${order.pro.proSize == 3}">M </c:if> <c:if
														test="${order.pro.proSize == 4}">L </c:if> <c:if test="${order.pro.proSize == 5}">XL </c:if></td>
												<td>${order.orderMemberName }</td>
												<td><fmt:formatNumber value="${order.orderPrice }" pattern="#,###" />원</td>
												<td>${order.orderDate }</td>
												<td>${order.deliveryStatus}</td>
											</tr>
											<c:set var="final_total_price" value="${order.orderPrice }" />
										</c:forEach>
										<tr>
											<td colspan="8" align="right"><strong>배송중인 상품 총 주문 가격 : <fmt:formatNumber value="${final_total_price }" pattern="#,###" />원</strong></td>
										</tr>
									</table>
								</c:when>
								<c:otherwise>
								<br>
									<h3>배송중인 상품이 없습니다.</h3>
								<br>
								</c:otherwise>
							</c:choose>
							<!-- 반품대기중인 상품  -->
							<c:choose>
								<c:when test="${refundList !=null }">
											<br><h3>반품대기중인 상품</h3><br>
									<table>
										<tr style="text-align: center;">
											<td width="100px">이미지</td>
											<td width="100px">상품명</td>
											<td width="100px">상품 정보</td>
											<td width="100px">주문자</td>
											<td width="100px">주문 가격</td>
											<td width="100px">결제 수단</td>
											<td width="100px">결제 일자</td>
											<td width="100px">배송 상태</td>
										</tr>

										<c:forEach var="refund" items="${refundList }">
											<tr style="text-align: center;">
												<td width="100px;"><a href="${contextPath}/product/productdetail.do?pro_code=${refund.pro_code}"> <img width="70px" height="105px"
														src="${contextPath}/thumbnails.do?pro_code=${refund.pro_code}&fileName=${refund.pro_imagefilename}"></a></td>
												<td>${refund.proName }</td>
												<td>${refund.proColor}/${refund.proSize }</td>
												<td>${refund.order_memberName }</td>
												<td><fmt:formatNumber value="${refund.orderPrice}" pattern="#,###" />원</td>
												<td>${refund.orderDate }</td>
												<td>${refund.deliveryStatus}</td>
											</tr>
											<c:set var="final_total_refund_price" value="${refund.orderPrice}" />
										</c:forEach>
										<tr>
											<td colspan="8" align="right"><strong>반품대기중인 상품 총 주문 가격 : <fmt:formatNumber value="${final_total_refund_price}" pattern="#,###" /></strong></td>
										</tr>
									</table>
								</c:when>
								<c:otherwise>
								<br>
									<h3>반품 대기 중인 상품이 없습니다.</h3>
								<br>	
								</c:otherwise>
							</c:choose>

							<!--장바구니에 담은 상품 -->
							<c:choose>
								<c:when test="${cartList !=null }">
											<br><h3>장바구니에 담은 상품</h3><br>
									<table>
										<tr style="text-align: center;">
											<th width="100px;">이미지</th>
											<th width="100px;">상품명</th>
											<th width="100px;">상품 정보</th>
											<th width="100px;">판매가</th>
											<th width="100px;">수량</th>
											<th width="100px;">합계</th>
										</tr>
										<c:forEach var="cart" items="${cartList }">
											<tr style="text-align: center;">
												<td width="100px;"><a href="${contextPath}/product/productdetail?proNum=${cart.cartProNum.proNum}"> <img width="70px" height="105px"
														src="${contextPath}/thumbnails?proNum=${cart.cartProNum.proNum}&fileName=${cart.cartProNum.proImgfileName}"></a></td>
												<td width="100px;">${cart.cartProNum.proName }</td>
												<td width="100px">${cart.cartProNum.proSize }/${cart.cartProNum.proColor }</td>
												<td width="100px"><fmt:formatNumber value="${cart.cartProNum.proPrice}" pattern="#,###" />원</td>
												<td width="100px;">${cart.cartProQuantity}</td>
												<td width="100px;"><fmt:formatNumber value="${cart.cartProNum.proPrice * cart.cartProQuantity}" pattern="#,###" />원</td>
											</tr>

										</c:forEach>
									</table>
								</c:when>
								<c:otherwise>
								<br>
									<h3>장바구니에 담긴 상품이없습니다.</h3>
								<br>
								</c:otherwise>


							</c:choose>


						</center>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>