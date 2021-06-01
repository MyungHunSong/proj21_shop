<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" href="/proj21_shop/resources/main/css/main.css">
<link rel="stylesheet" href="/proj21_shop/resources/qna/css/qna_main.css">
<link rel="stylesheet" href="/proj21_shop/resources/qna/css/qna_faq.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
/* tab을 쓰기위한것 */
	$(function(){
			$(".btn li").click(function(){
				$(this).addClass("active");
				$(this).siblings().removeClass("active");
				
				$(".tabs div").removeClass("active");
				$(".tabs div").eq($(this).index()).addClass("active");
			});
		});
</script>
</head>
<body>
	<div class = "container">
		<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
		
		<!-- FAQ, QNA 페이지 -->
		<section class="faq&qna">
			<ul class="btn">
				<li class="active">FAQ</li>
				<li>Q&A</li>		
			</ul>			
			<div class="tabs">
				<div class="active">
					<section>
					배송
					상품 구매후 주소 변경을 하려면 어떻게 해야 하나요?
					휴일에 상품을 받을수 있나요?
					</section>
					
					<section>
					교환/반품/환불
					환불을 신청했는데 환불 기간은 얼마나 소요되나요?
					구매한 상품을 취소/교환/반품하려면 어떻게 해야 하나요?
					</section>
					
					<section>
					구매(결제)
					고객센터에서 전화상으로 본인 확인 후 대리 결제가 가능한가요?
					무통장입금 주문 후, 입금하였는데 취소 문자를 받았습니다.
					실시간 계좌이체 이용 가능 시간은 어떻게 되나요?
					실시간 계좌이체 한도는 얼마인가요? 법인게좌로 가능한가요?
					</section>
				</div>
				<div>Q&A</div>
			</div>
		</section>
		<!-- FAQ,QNA 페이즈 끝 -->
		
		<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
	</div>
</body>
</html>