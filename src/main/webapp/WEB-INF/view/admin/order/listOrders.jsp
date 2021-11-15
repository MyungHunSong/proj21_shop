<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="orderList" value="${viewMap.orderList }" />
<c:set var="section" value="${viewMap.section }" />
<c:set var="pageNum" value="${viewMap.pageNum }" />
<c:set var="totOrders" value="${viewMap.totOrders }" />
<c:set var="totWaitingDelivery" value="${viewMap.totWaitingDelivery }" />
<c:set var="totOnDelivery" value="${viewMap.totOnDelivery }" />
<c:set var="totDoneDelivery" value="${viewMap.totDoneDelivery }" />
<c:set var="selectedTotal" value="${viewMap.selectedTotal }" />
<c:set var="totWaitingRefundDelivery" value="${viewMap.totWaitingRefundDelivery }" />
<c:set var="totDoneRefundDelivery" value="${viewMap.totDoneRefundDelivery }" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문정보 리스트</title>

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
	
	function select_deliveryStatus(orderProNum,orderCode,orderMemberId,orderProQuantity,proNum,orderValue){
		var deliveryStatus=document.getElementById(orderCode+"select_deliveryStatus").value;
		$.ajax({
			url:"${contextPath}/admin/order/listOrders",
			type:"post",
			data:{"change_deliveryStatus" : deliveryStatus, "change_orderProNum" : orderProNum, "change_orderMemberId" : orderMemberId,
				"change_orderCode" : orderCode, "change_orderProQuantity" : orderProQuantity, "change_proNum" : proNum, "change_orderValue" : orderValue},
				
			success:function(data){
				alert("배송상태 수정을 완료했습니다.");
				location.href='${contextPath}/admin/order/listOrders';
			},
			error:function(data){
				console.log(data)
				alert(data)
				alert("error");
			}
		});
	}
</script>
<style>
@media ( min-width : 767.98px) {
	.card {
		margin-left: 300px;
		margin-right: 50px;
	}
}
</style>
<style>
table {
	border-spacing: 30px;
}

tr {
	text-align: center;
}

th {
	padding: 5px 10px 5px 10px;
	background-color: #1f262d;
}

td {
	padding: 5px 10px 5px 10px;
	word-break: normal;
}

ul {
	margin: 0px;
	padding: 0px 10px 0px 15px;
}

li {
	margin: 0;
	padding-right: 10px;
	border: 0;
	float: left;
}

a {
	text-decoration: none;
	color: #000000;
}

#chartContainer {
	display: block;
	padding: 0px;
}

.pleft {
	text-align: left;
}

.smallul {
	list-style: none;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">
				<div class="card">
					<br> <br>
					<center>
						<h2>주문 목록</h2>
					</center>
					<hr>

					<div id="listOrdersByStatus">
						<ul class="smallul">
							<li>전체&nbsp;<a href="${contextPath }/admin/order/listOrders?total=total">${totOrders }</a>건 |
							</li>
							<li>배송중&nbsp;<a href="${contextPath }/admin/order/listOrders?deliveryStatus=배송중">${totOnDelivery }</a> 건|
							</li>
							<li>배송준비중&nbsp;<a href="${contextPath }/admin/order/listOrders?deliveryStatus=배송준비중">${totWaitingDelivery }</a> 건|
							</li>
							<li>배송완료&nbsp;<a href="${contextPath }/admin/order/listOrders?deliveryStatus=배송완료">${totDoneDelivery }</a>건 |
							</li>
							<li>반품대기중&nbsp;<a href="${contextPath }/admin/order/listOrders?deliveryStatus=반품대기중">${totWaitingRefundDelivery }</a>건 |
							</li>
							<li>반품완료&nbsp;<a href="${contextPath }/admin/order/listOrders?deliveryStatus=반품완료">${totDoneRefundDelivery }</a>건 |
							</li>
						</ul>
					</div>

					<br> <br> <br>
					<form action="${contextPath }/admin/order/listOrders" method="post" id="frm_search">
						<table>
							<tr>
								<td colspan="2">주문검색 &nbsp;&nbsp;</td>
								<td colspan="5" class="pleft">주문자 :
								<input type="text" name="orderMemberName" placeholder="주문자 이름을 입력하세요" id="orderMemberName" />
								</td>
							</tr>

							<tr>
								<td colspan="2">배송상태 구분 &nbsp;&nbsp;</td>
								<td colspan="5" class="pleft">
								<input type="radio" value="" name="deliveryStatus" checked>전체
								<input type="radio" value="배송중" name="deliveryStatus">배송중 
								<input type="radio" value="배송완료" name="deliveryStatus">배송완료
								<input type="radio" value="반품대기중" name="deliveryStatus">반품대기중 
								<input type="radio" value="반품완료" name="deliveryStatus">반품완료
								</td>
							</tr>

							<tr>
								<td colspan="2">주문 분류 &nbsp;&nbsp;</td>
								<td colspan="5" class="pleft"><select id="select1" name="orderPrice">
										<option value="" selected>--가격분류 선택--</option>
										<option value="price_desc">주문가격 높은순</option>
										<option value="price_asc">주문가격 낮은순</option>
								</select>
								</td>
							</tr>
							<tr>
								<td colspan="7"><input type="submit" value="검색" id="search_option" /> &nbsp;&nbsp;<input type="reset" value="초기화" /></td>
							</tr>

						</table>

					</form>
					<hr>

					<form>
						<table border="1" style="border-color: #ddd #ddd #848484 #ddd;" width="100%">
							<tr style="color: white;">
								<th>주문번호</th>
								<th>이미지</th>
								<th>상품명</th>
								<th>상품 정보</th>
								<th>주문자</th>
								<th>주문가격</th>
								<th>결제수단</th>
								<th>결제일자</th>
								<th>배송상태</th>
							</tr>
							<c:choose>
								<c:when test="${ orderList !=null}">
									<c:forEach var="order" items="${orderList }">
										<tr style="text-align: center;">
											<td width="100px">${order.orderProNum }-${order.orderCode }</td>
											<td width="100px"><a href="${contextPath}/productDetail?proNum=${fn:substring(order.pro.proNum,0,3)}"> <img width="70px" height="105px"
													src="${contextPath}/thumbnails?proNum=${order.pro.proNum}&fileName=${order.pro.proImgfileName}"></a></td>
											<td width="100px">${order.pro.proName }</td>
											<td width="100px">
											<li>
											<c:if test="${order.pro.proColor == 1}">white /</c:if> 
											<c:if test="${order.pro.proColor == 2}">ivory /</c:if>
											<c:if test="${order.pro.proColor == 3}">gray /</c:if> 
											<c:if test="${order.pro.proColor == 4}">pink /</c:if>
											<c:if test="${order.pro.proColor == 5}">yellow /</c:if>
											<c:if test="${order.pro.proColor == 6}">mint /</c:if>
											<c:if test="${order.pro.proColor == 7}">green /</c:if>
											<c:if test="${order.pro.proColor == 8}">purple /</c:if>
											<c:if test="${order.pro.proColor == 9}">navy /</c:if>
											<c:if test="${order.pro.proColor == 11}">black /</c:if>
											<c:if test="${order.pro.proColor == 12}">brown /</c:if>
											<c:if test="${order.pro.proColor == 13}">orange /</c:if>
										 	<c:if test="${order.pro.proColor == 14}">blue /</c:if>
											<c:if test="${order.pro.proColor == 15}">red /</c:if> 
											<c:if test="${order.pro.proColor == 16}">beige /</c:if>
											</li><li>    
											<c:if test="${order.pro.proSize == 1}">XS /</c:if>
											<c:if test="${order.pro.proSize == 2}">S /</c:if>
											<c:if test="${order.pro.proSize == 3}">M /</c:if>
											<c:if test="${order.pro.proSize == 4}">L /</c:if>
											<c:if test="${order.pro.proSize == 5}">XL /</c:if>
											</li>						
											<td width="100px">${order.orderMemberName }/${order.orderMemberId }</td>
											
											<td width="150px">
											<%-- <fmt:formatNumber value="${order.orderValue*order.orderProQuantity }" pattern="#,###" />원 --%>
											가격 : ${order.orderValue } | 개수 : ${order.orderProQuantity }
											<br>
											--------------------
											<br>
											상품 가격  / 총 주문 가격
											<br>
											<fmt:formatNumber value="${order.orderValue*order.orderProQuantity }" pattern="#,###" />원 / <fmt:formatNumber value="${order.orderPrice }" pattern="#,###" /> 원
											<c:set var="orderValue" value="${order.orderValue*order.orderProQuantity }"/>
											</td>
											<td width="100px">${order.whichBank} 은행</td>
											<td width="100px">${order.orderDate }</td>
											<td width="100px">
												<select id="${order.orderCode }select_deliveryStatus">
													<option value="${order.deliveryStatus}">${order.deliveryStatus}</option>
													<c:choose>
														<c:when test="${order.deliveryStatus =='배송중'}">
															<option value="배송완료">배송완료</option>
														</c:when>
														<c:when test="${order.deliveryStatus =='반품대기중'}">
															<option value="반품완료">반품완료</option>
														</c:when>
														<c:otherwise>
															<option value="배송중">배송중</option>
														</c:otherwise>
													</c:choose>
												</select>
												<input type="button" value="수정" 
												onclick="select_deliveryStatus(${order.orderProNum},${order.orderCode},'${order.orderMemberId}',${order.orderProQuantity },
												${order.pro.proNum },${orderValue })" />
											</td>
										</tr>
										<c:set var="final_total_price" value="${final_total_price+order.orderPrice* order.orderProQuantity }" />
									</c:forEach>
								</c:when>
								<c:when test="${empty orderList }">
									<tr>
										<td colspan="9"><h1>주문 건이 없습니다.</h1></td>
									</tr>
								</c:when>
							</c:choose>
						</table>
						<c:if test="${selectedTotal !=null}">
							<c:choose>
								<c:when test="${selectedTotal >100 }">

									<c:forEach var="page" begin="1" end="20" step="1">
										<c:if test="${section >1 && page==1 }">
											<!--페이지번호가 1일때 pre나오게 하기 -->
											<a href="${contextPath }/admin/order/listOrders?section=${section-1}&pageNum=${(section-1)*20+1}">%nbsp; pre </a>
										</c:if>
										<a href="${contextPath }/admin/order/listOrders?section=${section}&pageNum=${page}">${(section-1)*20+page }</a>
										<c:if test="${page==10} }">
											<!--페이지수가 10일때 다음으로 next나오게 하기  -->
											<a href="${contextPath }/admin/order/listOrders?section=${section+1}&pageNum=${section*20+1}">&nbsp; next</a>
										</c:if>
									</c:forEach>
									
								</c:when>
								<c:when test="${selectedTotal==100 }">
									<c:forEach var="page" begin="1" end="10" step="1">
										<a href="#">${page }</a>
									</c:forEach>
								</c:when>

								<c:when test="${selectedTotal <100 }">
									<c:forEach var="page" begin="1" end="${selectedTotal/10+1 }" step="1">
										<c:choose>
											<c:when test="${page==pageNum }">
												<a class="sel-page" style="color: red;  font-size: 40px; padding-left: 8px; "
													href="${contextPath }/admin/order/listOrders?
															section=${section}
															&pageNum=${page}
															&orderMemberName=${orderMemberName}
															&deliveryStatus=${deliveryStatus}
															&orderPrice=${orderPrice}">
															${page}
												</a>
											</c:when>
											<c:otherwise>
												<a class="no-uline"  style=" font-size: 20px; padding-left: 5px; "
													href="${contextPath }/admin/order/listOrders?
																			section=${section}
																			&pageNum=${page}
																			&orderMemberName=${orderMemberName}
																			&deliveryStatus=${deliveryStatus}
																			&orderPrice=${orderPrice}">
																			${page}
												</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
							</c:choose>
						</c:if>

					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>