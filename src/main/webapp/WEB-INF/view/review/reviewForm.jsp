<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 작성</title>
<link rel="stylesheet"
	href="/proj21_shop/resources/review/css/reviewForm.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		var notice = [ '별로에요', '보통이에요', '그냥 그래요', '맘에 들어요',
			'아주 좋아요' ];
		$(".stars .fa").click(
				function() {
					$(this).addClass("active");
					$(this).prevAll().addClass("active");
					$(this).nextAll().removeClass("active");

					var starRate = $(this).index() + 1;
					/* $('.print').text(starRate); */
					
					$('.print').html(
							'<img src="images/star-lv' +starRate + '.png">'
									+ notice[starRate - 1]);
		})
		var contextPath = "${contextPath}";
		var memberId = "${memberId}";
		var proNum = "${proNum}";
		
		$.get(contextPath + "/api/detailreview/" + memberId + "/"+ proNum, 
		function(json){
			
			for(i = 0; i < json.length; i++){
				var proSize = ["none","XS","S","M","L","XL"];
			}
			
			for(i = 1; i < json[0].reviewStar+1; i++){
				$('.s'+i).addClass('active');
				$('.print').html('<img src="images/star-lv' +i + '.png">' + notice[i-1]);
			}
			
			var sCont = "";
				sCont += "<img src='/proj21_shop/resources/product/images/" + json[0].proImagefilename.proImagefilename + "' width = '70' height= '70'>"
				sCont += "<ul>"
				sCont += "<li>" + json[0].proName.proName + "</li>"
				sCont += "<li>" + json[0].proName.proColor +"</li>" 
				sCont += "<li>" + proSize[json[0].proName.proSize] +"</li>" 
				sCont += "</ul>"
				
				$("#load").append(sCont);
			
			var sConts ="";
				sConts += "<textarea id='content' cols='45' rows='10' placeholder='상품에 대한 평가를 20자 이상 작성해 주세요'>"+json[0].reviewContent+"</textarea><br>";
				sConts += "<div class='file'>";
				sConts += "<input type='file' id='imgButton' value=" + json[0].reviewImagefilename1 + "/> <br> <input type='file' id='imgButton' value = " + json[0].reviewImagefilename2 + "/>";
				sConts += "</div><br>";
				sConts += "<input type='submit' value='등록' id='reviewButton' />";
		
				$("#review").prepend(sConts);
		})
			
	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
	<h2>스타일 후기 작성</h2>
	<div class='asd' id = "load"></div>
	<div class="bsd">
		<div class="star-rating">
			<div class="stars">
				<i class="s1 fa fa-star"></i>
				<i class="s2 fa fa-star"></i>
				<i class="s3 fa fa-star"></i>
				<i class="s4 fa fa-star"></i>
				<i class="s5 fa fa-star"></i>
			</div>
			<div class="print"></div>
		</div>
	</div>
		<br>
			<div class="review" id="review">
				<%-- <textarea id="content" cols="45" rows="10"placeholder="상품에 대한 평가를 20자 이상 작성해 주세요"></textarea>
		<br>
			<div class="file">
				<input type="file" id="imgButton" /> <br> <input type="file" id="imgButton" />
			</div>
		<br>
				<input type="submit" value="등록" id="reviewButton" /> --%>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
			</div>
</body>
</html>