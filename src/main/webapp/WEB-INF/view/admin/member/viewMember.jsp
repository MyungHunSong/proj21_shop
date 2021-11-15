<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- Controller ��� : proj21_shop.controller.admin.member/AdminMemberController -->
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
<title>ȸ�� ���� ����</title>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

<!-- �׷��� function Cnavas Js -->
<script>
window.onload = function () {
var options = {
   exportEnabled: true,
   animationEnabled: true,
   title:{
      text: "${member.memberName} �� ����Ʈ �̿���Ȳ"
   },
   subtitles: [{
      text: ""
   }],
   
   axisY: {
      title: "�湮��",
      titleFontColor: "#4F81BC",
      lineColor: "#4F81BC",
      labelFontColor: "#4F81BC",
      tickColor: "#4F81BC",
      includeZero: false
   },
   axisY2: {
      title: "��� �ֹ�����",
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
      name: "�湮��",
      showInLegend: true,
      xValueFormatString: "MMM YYYY",
      yValueFormatString: "#,##0 ȸ",
      dataPoints: [
         { x: new Date(2020, 8,  1),  y: 5 },
         { x: new Date(2020, 9,  1),  y: 8 },
         { x: new Date(2020, 10, 1),  y: 3 },
         { x: new Date(2020, 11, 1),  y: 1 },
         { x: new Date(2020, 12, 1),  y: 5 },
         { x: new Date(2021, 1, 1),   y: 7 },
         { x: new Date(2021, 2, 1),   y: 2 },
         { x: new Date(2021, 3, 1),   y: 8 },
         { x: new Date(2021, 4, 1),   y: 14 },
         { x: new Date(2021, 5, 1),   y: 2 },
         { x: new Date(2021, 6, 1),   y: ${member.memberTotalLogin} }
      ]
   },
   {
      type: "spline",
      name: "��� �ֹ�����",
      axisYType: "secondary",
      showInLegend: true,
      xValueFormatString: "MMM YYYY",
      yValueFormatString: "#,##0.#��",
      dataPoints: [
         { x: new Date(2020, 8,  1),  y: 90340 },
         { x: new Date(2020, 9,  1),  y: 100150 },
         { x: new Date(2020, 10, 1),  y: 43420 },
         { x: new Date(2020, 11, 1),  y: 50000 },
         { x: new Date(2020, 12, 1),  y: 102340 },
         { x: new Date(2021, 1, 1),  y: 290340 },
         { x: new Date(2021, 2, 1),  y: 204870 },
         { x: new Date(2021, 3, 1),  y: 125230 },
         { x: new Date(2021, 4, 1),  y: 400000 },
         { x: new Date(2021, 5, 1),  y: 200000 },
         { x: new Date(2021, 6, 1), y: ${averageOrder} },
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
							<h2>ȸ�� �� ����</h2>
							<hr>
							<form id="frm_search" action="${contextPath }/admin/member/searchMember" method="post">
								<table>
									<tr id="search">
										<td>ȸ��</td>
										<td colspan="5"><input type="text" placeholder="�̸� Ȥ�� ���̵�" width="150" name="memberSearch" /></td>
										<td><input type="button" onClick="document.getElementById('frm_search').submit();" value="�˻�" /></td>
									</tr>
								</table>

							</form>
						</center>
						<br> <br>

						<center>
							<table border="1" class="infotable">

								<tr>
									<td colspan="6">Ȱ�� ����</td>
								</tr>
								<tr>
									<td>�̸�</td>
									<td>${member.memberName }</td>
									<td>���̵�</td>
									<td>${member.memberId }</td>
									<td>������</td>
									<td>
										<!-- fmt:formatNumber => ���� ���ϴ� ������� ���ڸ� ��¹� -->
										<a href="#">
											<fmt:formatNumber value="${member.memberPoint}" pattern="#,###" />
										</a><b> P</b></td>
								</tr>


								<tr>
									<td>�湮��</td>
									<td><fmt:formatNumber value="${member.memberTotalLogin}" pattern="#,###" />ȸ</td>
									<td>���� ���ž�</td>
									<td><fmt:formatNumber value="${member.memberTotalBuy}" pattern="#,###" />��</td>
									<td>���� �ֹ���</td>
									<td>
										<a href="#">
											<fmt:formatNumber value="${member.memberTotalOrder}" pattern="#,###" />
										</a>ȸ (���:<fmt:formatNumber value="${averageOrder}" pattern="#,###" />��)
									</td>
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
									<Strong>�� ������</Strong>
								</caption>

								<tr>
									<td colspan="2">������� ��ǰ</td>
									<td><a href="${contextPath }/admin/order/listOrders">${onDelivery} <c:if test="${onDelivery ==null }">0</c:if>
									</a>��</td>
								</tr>
								<tr>
									<td>===============</td>
								</tr>
								<tr>
									<td colspan="2">��ǰ������� ��ǰ</td>
									<td><a href="${contextPath }/admin/member/viewMember?memberId=${member.memberId}">${onRefund} <c:if test="${onRefund ==null }">0</c:if>
									</a>��</td>
								</tr>
								<tr>
									<td>===============</td>
								</tr>
								<tr>
									<td colspan="2">��ٱ��Ͽ� ���� ��ǰ</td>
									<td><a href="${contextPath }/admin/member/viewMember?memberId=${member.memberId}">${onCart} <c:if test="${onCart ==null }">0</c:if>
									</a>��</td>
								</tr>
							</table>
							<br> <br>
							<!--��� ���� ��ǰ  -->
							<c:choose>
								<c:when test="${orderList !=null }">

									<br>
										<h3>����� or ��� �غ����� ��ǰ</h3>
									<br>
									
									<table>
										<tr style="text-align: center;">
											<td width="100px">�̹���</td>
											<td width="100px">��ǰ��</td>
											<td width="100px">��ǰ ����</td>
											<td width="100px">�ֹ���</td>
											<td width="100px">���� ����</td>
											<td width="100px">�ֹ� �� ����</td>
											<td width="100px">���� ����</td>
											<td width="100px">��� ����</td>
										</tr>
										<c:set var="final_total_price" value="0" />
										
										<!-- forEach ���� ����� orderList�����´�. -->
										<c:forEach var="order" items="${orderList }">
										
										<!-- Controller �Ϸ� : proj21_shop.controller.product -->
											<tr style="text-align: center;">
												<td width="100px;"><a href="${contextPath}/productDetail?proNum=${order.pro.proNum}"> <img width="70px" height="105px"
														src="${contextPath}/thumbnails?proNum=${order.pro.proNum}&fileName=${order.pro.proImgfileName}"></a></td>
												<td>${order.pro.proName }</td>
												<td><c:if test="${order.pro.proColor == 1}">white /</c:if> <c:if test="${order.pro.proColor == 2}">ivory /</c:if> <c:if test="${order.pro.proColor == 3}">gray /</c:if> 
													<c:if test="${order.pro.proColor == 4}">pink /</c:if> <c:if test="${order.pro.proColor == 5}">yellow /</c:if> <c:if test="${order.pro.proColor == 6}">mint /</c:if> 
													<c:if test="${order.pro.proColor == 7}">green /</c:if> <c:if test="${order.pro.proColor == 8}">purple /</c:if> <c:if test="${order.pro.proColor == 9}">navy /</c:if> 
													<c:if test="${order.pro.proColor == 11}">black /</c:if> <c:if test="${order.pro.proColor == 12}">brown /</c:if> <c:if test="${order.pro.proColor == 13}">orange /</c:if> 
													<c:if test="${order.pro.proColor == 14}">blue /</c:if> <c:if test="${order.pro.proColor == 15}">red /</c:if> <c:if test="${order.pro.proColor == 16}">basic /</c:if> 
													
													<c:if test="${order.pro.proSize == 1}">XS </c:if> <c:if test="${order.pro.proSize == 2}">S </c:if> <c:if test="${order.pro.proSize == 3}">M </c:if> 
													<c:if test="${order.pro.proSize == 4}">L </c:if> <c:if test="${order.pro.proSize == 5}">XL </c:if>
												</td>
												<td>${order.orderMemberName }</td>
												<td><fmt:formatNumber value="${order.orderValue*order.orderProQuantity }" pattern="#,###" />��</td>
												<td><fmt:formatNumber value="${order.orderPrice }" pattern="#,###" /> ��</td>
												<c:set var="price" value="${order.orderPrice }" />
												<c:set var="final_total_price" value="${final_total_price+price }" />
												<td>${order.orderDate }</td>
												<td>${order.deliveryStatus}</td>
											</tr>
										</c:forEach>
										<tr>
											<td colspan="8" align="right"><strong>������� ��ǰ �� �ֹ� ���� : <fmt:formatNumber value="${final_total_price }" pattern="#,###" />��
											</strong></td>
										</tr>
									</table>
								</c:when>
								<c:otherwise>
									<br>
									<h3>������� ��ǰ�� �����ϴ�.</h3>
									<br>
								</c:otherwise>
							</c:choose>
							<!-- ��ǰ������� ��ǰ  -->
							<c:choose>
								<c:when test="${refundList !=null }">
									<br>
									<h3>��ǰ������� ��ǰ</h3>
									<br>
									<table>
										<tr style="text-align: center;">
											<td width="100px">�̹���</td>
											<td width="100px">��ǰ��</td>
											<td width="100px">��ǰ ����</td>
											<td width="100px">�ֹ���</td>

											<td width="100px">����</td>
											<td width="100px">���� ����</td>

											<td width="100px">���� ����</td>
											<td width="100px">��� ����</td>
										</tr>

										<c:set var="final_total_refund_price" value="0" />
										<c:forEach var="refund" items="${refundList }">
											<tr style="text-align: center;">
												<td width="100px;"><a href="${contextPath}/productDetail?proNum=${refund.pro.proNum}"> <img width="70px" height="105px"
														src="${contextPath}/thumbnails?proNum=${refund.pro.proNum}&fileName=${refund.pro.proImgfileName}"></a></td>
												<td>${refund.pro.proName }</td>
												<td><c:if test="${refund.pro.proColor == 1}">white /</c:if> <c:if test="${refund.pro.proColor == 2}">ivory /</c:if> <c:if test="${refund.pro.proColor == 3}">gray /</c:if> <c:if
														test="${refund.pro.proColor == 4}">pink /</c:if> <c:if test="${refund.pro.proColor == 5}">yellow /</c:if> <c:if test="${refund.pro.proColor == 6}">mint /</c:if> <c:if
														test="${refund.pro.proColor == 7}">green /</c:if> <c:if test="${refund.pro.proColor == 8}">purple /</c:if> <c:if test="${refund.pro.proColor == 9}">navy /</c:if> <c:if
														test="${refund.pro.proColor == 11}">black /</c:if> <c:if test="${refund.pro.proColor == 12}">brown /</c:if> <c:if test="${refund.pro.proColor == 13}">orange /</c:if> <c:if
														test="${refund.pro.proColor == 14}">blue /</c:if> <c:if test="${refund.pro.proColor == 15}">red /</c:if> <c:if test="${refund.pro.proColor == 16}">basic /</c:if> <c:if
														test="${refund.pro.proSize == 1}">XS </c:if> <c:if test="${refund.pro.proSize == 2}">S </c:if> <c:if test="${refund.pro.proSize == 3}">M </c:if> <c:if test="${refund.pro.proSize == 4}">L </c:if>
													<c:if test="${refund.pro.proSize == 5}">XL </c:if></td>
												<td>${refund.orderMemberName }</td>
												<td>${refund.orderProQuantity }</td>
												<td><fmt:formatNumber value="${refund.orderPrice }" pattern="#,###" /> �� <c:set var="price" value="${refund.orderPrice }" /> <c:set var="final_total_refund_price"
														value="${final_total_refund_price+price }" /></td>
												<td>${refund.orderDate }</td>
												<td>${refund.deliveryStatus}</td>
											</tr>
										</c:forEach>
										<tr>
											<td colspan="8" align="right"><strong>��ǰ������� ��ǰ �� �ֹ� ���� : <fmt:formatNumber value="${final_total_refund_price}" pattern="#,###" /> ��
											</strong></td>
										</tr>
									</table>
								</c:when>
								<c:otherwise>
									<br>
									<h3>��ǰ ��� ���� ��ǰ�� �����ϴ�.</h3>
									<br>
								</c:otherwise>
							</c:choose>

							<!--��ٱ��Ͽ� ���� ��ǰ -->
							<c:choose>
								<c:when test="${cartList !=null }">

									<br>
									<h3>��ٱ��Ͽ� ���� ��ǰ</h3>
									<br>
									<table>

										<tr style="text-align: center;">
											<th width="100px;">�̹���</th>
											<th width="100px;">��ǰ��</th>
											<th width="100px;">��ǰ ����</th>
											<th width="100px;">���� ����</th>
											<th width="100px;">����</th>
											<th width="100px;">�հ�</th>
										</tr>
										<c:forEach var="cart" items="${cartList }">
											<tr style="text-align: center;">
												<td width="100px;">
													<a href="${contextPath}/productDetail?proNum=${cart.cartProNum.proNum}"> 
														<img width="70px" height="105px" src="${contextPath}/thumbnails?proNum=${cart.cartProNum.proNum}&fileName=${cart.cartProNum.proImgfileName}">
													</a>
												</td>
												<td width="100px;">${cart.cartProNum.proName }</td>
												<td width="100px">
												${cart.cartProNum.proColor}
												<c:if test="${cart.cartProNum.proColor == 1}">white /</c:if> <c:if test="${cart.cartProNum.proColor == 2}">ivory /</c:if> 
												<c:if test="${cart.cartProNum.proColor == 3}">gray /</c:if> <c:if test="${cart.cartProNum.proColor == 4}">pink /</c:if> <c:if test="${cart.cartProNum.proColor == 5}">yellow /</c:if> 
												<c:if test="${cart.cartProNum.proColor == 6}">mint /</c:if> <c:if test="${cart.cartProNum.proColor == 7}">green /</c:if> <c:if test="${cart.cartProNum.proColor == 8}">purple /</c:if> 
												<c:if test="${cart.cartProNum.proColor == 9}">navy /</c:if> <c:if test="${cart.cartProNum.proColor == 11}">black /</c:if> <c:if test="${cart.cartProNum.proColor == 12}">brown /</c:if> 
												<c:if test="${cart.cartProNum.proColor == 13}">orange /</c:if> <c:if test="${cart.cartProNum.proColor == 14}">blue /</c:if> <c:if test="${cart.cartProNum.proColor == 15}">red /</c:if> 
												<c:if test="${cart.cartProNum.proColor == 16}">basic /</c:if> 

												<c:if test="${cart.cartProNum.proSize == 1}">XS </c:if> 
												<c:if test="${cart.cartProNum.proSize == 2}">S </c:if> 
												<c:if test="${cart.cartProNum.proSize == 3}">M </c:if> 
												<c:if test="${cart.cartProNum.proSize == 4}">L </c:if>
												<c:if test="${cart.cartProNum.proSize == 5}">XL </c:if></td>
                        
												<td width="100px;"><fmt:formatNumber value="${cart.cartProNum.proPrice - (cart.cartProNum.proPrice*cart.cartProNum.proSalesrate*0.01)}" pattern="#,###" />��</td>
												<td width="100px;">${cart.cartProQuantity}</td>
												<td width="100px;"><fmt:formatNumber value="${(cart.cartProNum.proPrice - (cart.cartProNum.proPrice*cart.cartProNum.proSalesrate*0.01))*cart.cartProQuantity}" pattern="#,###" />��</td>
											</tr>

										</c:forEach>
									</table>
								</c:when>
								<c:otherwise>
									<br>
									<h3>��ٱ��Ͽ� ��� ��ǰ�̾����ϴ�.</h3>
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