<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세</title>
<link rel="stylesheet" href="/proj21_shop/resources/main/css/main.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		var contextPath = "${contextPath}";
		var memberId = "${memberId}"

		$
				.get(
						contextPath + "/api/mydetailorder/" + memberId,
						function(json) {
							console.log(json);
							var dataLength = json.length;
							if (dataLength >= 1) {
								var sCont = "";
								for (i = 0; i < dataLength; i++) {
									sCont += "<tr>";
									sCont += "<td>" + json[i].orderProNum;
									sCont += "<td><img src='" + contextPath +"/resources/product/images/" + json[i].productImageDTO.proImagefilename + "' width = '80' height='60'></td>";
									sCont += "<td>" + json[i].orderPrice * 0.01;
									sCont += "<td>" + json[i].orderPrice;
									sCont += "<td>" + json[i].orderProQuantity;
									sCont += "<td>" + json[i].deliveryStatus;
									sCont += "<td>" + json[i].orderDate;
									sCont += "<td>" + "후기작성 하러가기";
								}
							}

							$("#load").append(sCont);

						})
	})
</script>
<link rel="stylesheet"
	href="/proj21_shop/resources/order/css/myOrderDetail.css" />
</head>
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
		<section id="orderArea">
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
						<th scope="cols">후기</th>
					</tr>
				</thead>
				<tbody id="load"></tbody>
			</table>
			<div class="test">
				<img alt="주문안내" src="/proj21_shop/images/orderInfo.jpg">
			</div>
			<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
		</section>
	</div>

</body>
</html>