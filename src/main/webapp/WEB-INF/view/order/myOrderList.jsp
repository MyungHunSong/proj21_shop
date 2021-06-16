<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		var contextPath = "${contextPath}";
		var memberId = "${memberId}";


		$.get(contextPath + "/api/myorder/" + memberId, function(json) {
			console.log(json);
			
			var dataLength = json.length;
			if (dataLength >= 1) {
				var sCont = "";
				for (i = 0; i < dataLength; i++) {
					sCont += "<tr>";
					sCont += "<td><a href='detailorder?memberId="+ json[i].memberId +"&orderProNum=" + json[i].orderProNum + "'>" + json[i].orderProNum + "</a>";
					sCont += "<td>" + json[i].proName.proName;
					sCont += "<td>" + json[i].orderDate;
					sCont += "<td>" + json[i].orderProQuantity;
					sCont += "<td>" + json[i].orderPrice;
					sCont += "<td>" + json[i].deliveryStatus;
					sCont += "<tr>";
				}
			}
			$("#load").append(sCont);
		})
	})
</script>
<link rel="stylesheet"
	href="/proj21_shop/resources/order/css/myOrderList.css" />
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
		<section id="orderArea">
			<h3>나의 주문내역</h3>
			<table class="type11">
				<thead>
					<tr>
						<th scope="cols">주문번호</th>
						<th scope="cols">제품정보</th>
						<th scope="cols">주문일자</th>
						<th scope="cols">주문수량</th>
						<th scope="cols">주문금액</th>
						<th scope="cols">주문상태</th>
					</tr>
				</thead>
				<tbody id="load"></tbody>
			</table>
		</section>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
	</div>
</body>
</html>