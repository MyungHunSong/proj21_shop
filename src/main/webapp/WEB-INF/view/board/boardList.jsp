<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		var contextPath = "${contextPath}";
		var memberId = "${memberId}";
		var proNum = "${proNum}";
		console.log(proNum);
		$.get(contextPath + "/api/myreview/" + memberId, function(json) {
			var dataLength = json.length;
			if (dataLength >= 1) {
				var sCont = "";
				for (i = 0; i < dataLength; i++) {
					console.log(json)
					sCont += "<tr>";
					sCont += "<td>" + json[i].proName.proName + "</td>";
					sCont += "<td><img src="+contextPath+"/resources/review/images/" + json[i].reviewImagefilename1 + " width='70' height='60' ><img src=" + contextPath + "/resources/review/images/" + json[i].reviewImagefilename2 + " width='70' height='60'></td>";
					sCont += "<td>" + json[i].reviewContent + "</td>";
					sCont += "<td>" + json[i].reviewStar + "</td>";
					sCont += "<td>" + json[i].reviewDate + "</td>";
					sCont += "<td><a href='detailreview?memberId=" + memberId +"&proNum=" + json[i].proNum + "'>후기수정 하러가기</a></td>";
					sCont += "<tr>";
				}

				$("#load").append(sCont);
			}
		})

		$.get(contextPath + "/api/myqna/" + memberId, function(json) {
			var dataLength = json.length;
			if (dataLength >= 1) {
				var sCont = "";
				for (i = 0; i < dataLength; i++) {
					sCont += "<tr>";
					sCont += "<td>" + json[i].qIndex + "</td>";
					sCont += "<td>" + json[i].qFile + "</td>";
					sCont += "<td>" + json[i].qTitle + "</td>";
					sCont += "<td>" + json[i].qMember + "</td>";
					sCont += "<td>" + json[i].qDate + "</td>";
					sCont += "<td> Q&A 수정하러 가기 </td>";
					sCont += "<tr>";
				}
				$("#loadtable").append(sCont);
			}
		})
	})
</script>
<link rel="stylesheet"
	href="/proj21_shop/resources/board/css/boardList.css" />
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
		<section id="boardArea">
			<div class="asd">
			<h3>내가 쓴 후기</h3>
			<table class="type11">
				<thead>
					<tr>
						<th scope="cols">제품정보</th>
						<th scope="cols" >착샷</th>
						<th scope="cols">후기내용</th>
						<th scope="cols">별점</th>
						<th scope="cols">작성일</th>
						<th scope="cols">수정</th>
					</tr>
				</thead>
				<tbody id="load"></tbody>
			</table>
			<h3>내가 쓴 Q&A</h3>
			<table class="type11">
				<thead>
					<tr>
						<th>질문번호</th>
						<th>사진</th>
						<th>문의제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>수정</th>
					</tr>
				</thead>
				<tbody id="loadtable"></tbody>
			</table>
			</div>
		</section>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
	</div>
</body>
</html>