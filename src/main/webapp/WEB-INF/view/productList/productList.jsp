<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>옷 목록화면</title>
<link rel="stylesheet" href="/proj21_shop/resources/main/css/main.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() {
	var contextPath = "${contextPath}";
	$.get(contextPath + "/api/productlist", 
	function(json) {
		var dataLength = json.length;
		if (dataLength >= 1) {
			console.log(json[1].proNum[0].proNum)
			var sCont = "";
			for (i = 0; i < dataLength; i++) {
				sCont += "<tr>";
				sCont += "<td>"+ json[i].proNum[0].proNum + "</td>";
				sCont += "<td>"+ json[i].proNum[0].proPrice + "</td>";
				sCont += "<td><img src="+contextPath+"/resources/product/images/"+json[i].proImagefilename+"></td>";
				sCont += "</tr>";
			}
			$("#load:last-child").append(sCont);
			
		}
	});
});
</script>
</head>
<body>
<div class="container">
<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>

		<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>가격</th>
				<th>사진이름</th>
			</tr>
		</thead>
		<tbody id="load"></tbody>
	</table>




<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</div>
</body>
</html>