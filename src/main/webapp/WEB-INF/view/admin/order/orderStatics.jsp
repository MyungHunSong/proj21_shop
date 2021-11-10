<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" isELIgnored="false"%>
<!-- 송명훈 추가. jstl사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />

<!-- 그래프 사용 방법 
위치:AdminOrderController. viewmaps-->
<c:set var="totalRevenue" value="${viewMap.totalRevenue }" />
<c:set var="totalOrderCount" value="${viewMap.totalOrderCount }" />
<c:set var="memberMen" value="${viewMap2.memberMen }" />
<c:set var="memberWomen" value="${viewMap2.memberWomen }" />
<c:set var="totalMember" value="${viewMap2.totalMember }" />


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Annual Sales - 2021</title>
<!-- chart -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<script src="${contextPath}/resources/admin/order/css/tether/tether.min.js"></script>
<script src="${contextPath}/resources/admin/order/css/bootstrap/bootstrap4-alpha3.min.js"></script>
<script src="${contextPath}/resources/admin/dist/js/custom.min.js"></script>
<script src="${contextPath}/resources/admin/dist/js/sidebarmenu.js"></script>
<script>
			$(function () {
								
				// CanvasJS column chart to show revenue from Jan 2020 - Dec 2020
				// CanvasJs 사이트에서 스크립문 복사 붙여넣기
				//1. 첫번째 보일 차트
				var revenueColumnChart = new CanvasJS.Chart("revenue-column-chart", {
					animationEnabled: true,
					backgroundColor: "transparent",
					theme: "theme2",
					axisX: {
						labelFontSize: 14,
						valueFormatString: "MMM YYYY"
					},
					axisY: {
						labelFontSize: 14,
						suffix: "원"
					},
					toolTip: {
						borderThickness: 0,
						cornerRadius: 0
					},
					data: [
						{	
							type: "column",
							yValueFormatString: "###,###.##원",
							dataPoints: [
								{ x: new Date("1 Jul 2020"), y: 2458000 },
								{ x: new Date("1 Aug 2020"), y: 3165000 },
								{ x: new Date("1 Sep 2020"), y: 2594150 },
								{ x: new Date("1 Oct 2020"), y: 3511100 },
								{ x: new Date("1 Nov 2020"), y: 3508800 },
								{ x: new Date("1 Dec 2020"), y: 4501700 },
								{ x: new Date("1 Jan 2021"), y: 3168800 },
								{ x: new Date("1 Feb 2021"), y: 4071550 },
								{ x: new Date("1 Mar 2021"), y: 4180200 },
								{ x: new Date("1 Apr 2021"), y: 3106900 },
								{ x: new Date("1 May 2021"), y: 4033800 },
								{ x: new Date("1 Jun 2021"), y: ${totalRevenue} },								
							]
						}
					]
				});
				
				revenueColumnChart.render();
				
				//CanvasJS pie chart to show product wise annual revenue for 2015
				// 피자 모양 차트
				var productsRevenuePieChart = new CanvasJS.Chart("products-revenue-pie-chart", {
					animationEnabled: true,
					theme: "theme2",
					legend: {
						fontSize: 14
					},
					toolTip: {
						borderThickness: 0,
						content: "<span style='\"'color: {color};'\"'>{name}</span>: ${y} (#percent%)",
						cornerRadius: 0
					},
					data: [
						{       
							indexLabelFontColor: "#676464",
							indexLabelFontSize: 14,
							legendMarkerType: "square",
							legendText: "{indexLabel}",
							showInLegend: true,
							startAngle:  90,
							type: "pie",
							dataPoints: [
								{  y: 6289855, name:"반팔", indexLabel: "반팔 - 34%", legendText: "반팔", exploded: true },
								{  y: 2761400, name:"긴팔", indexLabel: "긴팔 - 8%", legendText: "긴팔" },
								{  y: 3681866, name:"슬립리스", indexLabel: "슬립리스 - 10%", legendText: "슬립리스", color: "#8064a1" },
								{  y: 2607989, name:"후드", indexLabel: "후드 - 6%", legendText: "후드" },
								{  y: 2607989, name:"셔츠", indexLabel: "셔츠 - 10%", legendText: "셔츠" },
								{  y: 2607989, name:"스웨트셔츠", indexLabel: "스웨트셔츠 - 5%", legendText: "스웨트셔츠" },
							]
						}
					]
				});
				
				productsRevenuePieChart.render();
				
				//CanvasJS spline chart to show orders from Jan 2015 to Dec 2015
				
				var ordersSplineChart = new CanvasJS.Chart("orders-spline-chart", {
					animationEnabled: true,
					backgroundColor: "transparent",
					theme: "theme2",
					toolTip: {
						borderThickness: 0,
						cornerRadius: 0
					},
					axisX: {
						labelFontSize: 14,
						maximum: new Date("31 Dec 2021"),
						valueFormatString: "MMM YYYY"
					},
					axisY: {
						gridThickness: 0,
						labelFontSize: 14,
						lineThickness: 2
					},
					data: [
						{
							type: "spline",
							dataPoints: [
								{ x: new Date("1 Jul 2020"), y: 173 },
								{ x: new Date("1 Aug 2020"), y: 211 },
								{ x: new Date("1 Sep 2020"), y: 224 },
								{ x: new Date("1 Oct 2020"), y: 138 },
								{ x: new Date("1 Nov 2020"), y: 276 },
								{ x: new Date("1 Dec 2020"), y: 429 },
								{ x: new Date("1 Jan 2021"), y: 160 },
								{ x: new Date("1 Feb 2021"), y: 217 },
								{ x: new Date("1 Mar 2021"), y: 383 },
								{ x: new Date("1 Apr 2021"), y: 334 },
								{ x: new Date("1 May 2021"), y: 312 },
								{ x: new Date("1 Jun 2021"), y: ${totalOrderCount} }
							]
						}
					]
				});

				ordersSplineChart.render();
				
			});
			// 성별 차트 -시작-			
			window.onload = function () {
				var totalVisitors = 50;
				var visitorsData = {
				   
				   "남성": [{
				      color: "#E7823A",
				      name: "남성",
				      type: "column",
				      dataPoints: [
				         { x: new Date("1 Jul 2020"), y: 2 },
				         { x: new Date("1 Aug 2020"), y: 5 },
				         { x: new Date("1 Sep 2020"), y: 8 },
				         { x: new Date("1 Oct 2020"), y: 8 },
				         { x: new Date("1 Nov 2020"), y: 9 },
				         { x: new Date("1 Dec 2020"), y: 10 },
				         { x: new Date("1 Jan 2021"), y: 11 },
				         { x: new Date("1 Feb 2021"), y: 15 },
				         { x: new Date("1 Mar 2021"), y: 17 },
				         { x: new Date("1 Apr 2021"), y: 17 },
				         { x: new Date("1 May 2021"), y: 17 },
				         { x: new Date("1 Jun 2021"), y: ${totalMember} }
				      ]
				   }],
				   "여성": [{
				      color: "#546BC1",
				      name: "여성",
				      type: "column",
				      dataPoints: [
				         { x: new Date("1 Jul 2020"), y: 1 },
				         { x: new Date("1 Aug 2020"), y: 2 },
				         { x: new Date("1 Sep 2020"), y: 4 },
				         { x: new Date("1 Oct 2020"), y: 5 },
				         { x: new Date("1 Nov 2020"), y: 6 },
				         { x: new Date("1 Dec 2020"), y: 8 },
				         { x: new Date("1 Jan 2021"), y: 10 },
				         { x: new Date("1 Feb 2021"), y: 15 },
				         { x: new Date("1 Mar 2021"), y: 17 },
				         { x: new Date("1 Apr 2021"), y: 19 },
				         { x: new Date("1 May 2021"), y: 19 },
				         { x: new Date("1 Jun 2021"), y: ${totalMember} }
				      ]
				   }],
				   "남성 vs 여성": [{
				      click: visitorsChartDrilldownHandler,
				      cursor: "pointer",
				      explodeOnClick: false,
				      innerRadius: "75%",
				      legendMarkerType: "square",
				      name: "남성 vs 여성",
				      radius: "100%",
				      showInLegend: true,
				      startAngle: 90,
				      type: "doughnut",
				      dataPoints: [
				         { y: ${totalMember}, name: "남성", color: "#E7823A" },
				         { y: ${totalMember}, name: "여성", color: "#546BC1" }
				      ]
				   }]
				};
				
				var newVSReturningVisitorsOptions = {
				   animationEnabled: true,
				   theme: "light2",
				   title: {
				      text: "남성 vs 여성"
				   },
				   subtitles: [{
				      text: "Click on Any Segment to Drilldown",
				      backgroundColor: "#2eacd1",
				      fontSize: 16,
				      fontColor: "white",
				      padding: 5
				   }],
				   legend: {
				      fontFamily: "calibri",
				      fontSize: 14,
					      itemTextFormatter: function (e) {
				         return e.dataPoint.name + ": " + Math.round(e.dataPoint.y / totalVisitors * 100) + "%";  
				      }
				   },
				   data: []
				};
				// 성별 차트 -엔딩-
					
				var visitorsDrilldownedChartOptions = {
				   animationEnabled: true,
				   theme: "light2",
				   axisX: {
				      labelFontColor: "#717171",
				      lineColor: "#a2a2a2",
				      tickColor: "#a2a2a2"
				   },
				   axisY: {
				      gridThickness: 0,
				      includeZero: false,
				      labelFontColor: "#717171",
				      lineColor: "#a2a2a2",
				      tickColor: "#a2a2a2",
				      lineThickness: 1
				   },
				   data: []
				};
				
				var chart = new CanvasJS.Chart("chartContainer", newVSReturningVisitorsOptions);
				chart.options.data = visitorsData["남성 vs 여성"];
				chart.render();
				
				function visitorsChartDrilldownHandler(e) {
				   chart = new CanvasJS.Chart("chartContainer", visitorsDrilldownedChartOptions);
				   chart.options.data = visitorsData[e.dataPoint.name];
				   chart.options.title = { text: e.dataPoint.name }
				   chart.render();
				   $("#backButton").toggleClass("invisible");
				}
				
				$("#backButton").click(function() { 
				   $(this).toggleClass("invisible");
				   chart = new CanvasJS.Chart("chartContainer", newVSReturningVisitorsOptions);
				   chart.options.data = visitorsData["남성 vs 여성"];
				   chart.render();
				});
				}

</script>

</head>
<body>
	<div class="page-wrapper">
		<div class="container-fluid">
		<!-- 첫번째 그래프 -->
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-body">
							<h3 class="card-title">
								총 수익 현황 &nbsp; <span class="tag tag-success" id="revenue-tag">
								<fmt:formatNumber value="${totalRevenue+14100000}" type="number" /> 원
								</span>
							</h3>
							<br>
							<div class="card-block">
								<div id="revenue-column-chart" style="height: 400px;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		<!-- 첫번째 그래프 끝 -->
		
		<!-- 두번째 그래프 -->
			<div class="row">
				<div class="col-md-6">
					<div class="card">
						<div class="card-body">
							<h3 class="card-title">상품별 주문 수요</h3>
							<br>
							<div style="height: 400px;" id="products-revenue-pie-chart"></div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card">
						<div class="comment-widgets scrollable">
							<!--membersList  -->
							<center>
								<br>
								<h3 class="card-title">사이트 방문자 성별 비율 차트</h3>
								<br>
								<div id="chartContainer" style="height: 370px; width: 60%;"></div>
								<button class="btn invisible" id="backButton">Back</button>
							</center>
						</div>
					</div>
				</div>
			</div>
		<!-- 두번째 그래프 끝 -->
		
		<!-- 세번째 그래프 -->
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-body">
							<h3 class="card-title">주문수</h3>
							<br>
							<div style="height: 400px;" id="orders-spline-chart"></div>
						</div>
					</div>
				</div>
			</div>
		<!-- 세번째 그래프 끝 -->
		
		<!-- 마지막 영역 -->
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="chat-box scrollable" style="height: 600px;">
							<!--chat Row -->
							<ul class="chat-list">
								<!--chat Row -->
								<li class="chat-item">
									<div class="chat-content">
										<c:choose>
											<c:when test="${authInfo !=null }">
												<div class="box bg-light-info">
													환영합니다 <a href="#" style="color: red;">${authInfo.id }</a>님!
												</div>
											</c:when>
										</c:choose>
									</div>
								</li>
								<!--chat Row -->
								<li class="chat-item">
									<div class="chat-content">
										<h6 class="font-medium">Up street</h6>
										<c:choose>
											<c:when test="${!empty authInfo }">
												<div class="box bg-light-info">
													로그아웃 하시겠어요? <br> <a href="${contextPath }/logout">로그아웃하기</a>
												</div>
											</c:when>
										</c:choose>
									</div>
								</li>

								<li class="chat-item">
									<div class="chat-content">
										<h6 class="font-medium">Up street</h6>
										<div class="box bg-light-info">
											<a href="${contextPath }/main">클라이언트 페이지 바로가기</a>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- 마지막 영역 끝 -->
		</div>
	</div>




</body>

<script src="${contextPath}/resources/admin/dist/js/jquery.ui.touch-punch-improved.js"></script>
<script src="${contextPath}/resources/admin/dist/js/jquery-ui.min.js"></script>

<!-- CDN 사용 -->
<script src="${contextPath}/resources/admin/assets/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>

<!-- Bootstrap tether Core JavaScript -->
<script src="${contextPath}/resources/admin/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->

<!-- Bullet chart -->
<script src="${contextPath}/resources/admin/assets/extra-libs/sparkline/sparkline.js"></script>
<!--Wave Effects -->
<script src="${contextPath}/resources/admin/dist/js/waves.js"></script>
<!--Menu sidebar 사용-->

<!--Custom JavaScript sidebar 애니메이션 효과를 주기 위한 UI 파일 -->
<!-- 날짜 데이터 출력 및 수정 js -->
<script src="${contextPath}/resources/admin/assets/libs/moment/min/moment.min.js"></script>
</html>
