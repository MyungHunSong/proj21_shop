<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
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
		
	$(function(){
		$(".title").click(function(){
			$(this).addClass("slide");
			$(this).siblings(".title").removeClass("slide")
			
			$(this).siblings(".desc").stop().slideUp();
			$(this).next().stop().slideDown();
		});
	});
	
	$(function(){
		var contextPath = "${contextPath}";
		$.get(contextPath + "/api/qna",
				function(json){
			var dateLength = json.length;
			console.log(json[0].qOption)
			
				if(dateLength >= 1){
					var sCont = "";
					for(i = 0; i<dateLength; i++){
						sCont += "<tr>";
						sCont += "<td>" + json[i].qOp + "</td>";
						sCont += "<td>" + json[i].qMember + "</td>";
						sCont += "<td>" + json[i].qOption + "</td>";
						sCont += "<td>" + json[i].qTitle + "</td>";
						sCont += "<td>" + json[i].qDate + "</td>";
						sCont += "<td>" + json[i].qHit + "</td>";		
						sCont += "</tr>";
					}
					$("#load:last-child").append(sCont);
				}
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
				<article>				
					<h3 class="faqh3">배송</h3>
					<!-- slide가 faq 질문 누르면 밑으로 슬라이드 되는것 -->
					<!-- title, slide, desc, slide 등등은 FAQ 전용 딴것에 쓰지말것 -->
					<section class = "title slide" >상품 구매후 주소 변경을 하려면 어떻게 해야 하나요?</section>
						<p class = "desc slide">
							물품이 도착하지 않으셨다면 하단에 보이시는 전화 번호로(02-444-4444)로 전화주시면
							바뀐 주소로 수정해 드리겟습니다. 
						</p>
						
					<section class ="title">휴일에 상품을 받을수 있나요?</section> 
						<p class = "desc">
							택배사의 경우 휴일은 근무하지 않기 때문에 휴일에는 배송되지 않습니다.
							 단, 토요일은 일부 택배 사에 한해 배송되는 점 참고해주십시오.
						</p>			
						
					<h3 class="faqh3">교환/반품/환불</h3>
					<section class ="title">환불을 신청했는데 환불 기간은 얼마나 소요되나요?</section>
						<p class = "desc">
							취소완료가 되면 카드는 바로 결제취소가 이뤄지며, 카드사 홈페이지에서는 일반적으로 2~5일 이 후 반영됩니다.
							 실시간 계좌이체의 경우는 환불계좌가 확인되는 때로부터 평일 기준 3~7일 이내 환불됩니다.
						</p>
						
					<section class ="title">구매한 상품을 취소/교환/반품하려면 어떻게 해야 하나요?</section>
						<p class = "desc">
							구매 후 또는 결제 완료 이후 구매의사가 변한 경우에는 취소가 가능합니다.
							다만 상품준비중 단계는 이미 배송 예약까지 완료된 상태로 이 경우는 반품절차에 의해서만 가능하오니 이 점 참고해주십시오.
						</p>
							
					<h3 class="faqh3">구매(결제)</h3>
					<section class ="title">고객센터에서 전화상으로 본인 확인 후 대리 결제가 가능한가요?</section>
						<p class = "desc">
							네 가능합니다.
						</p>
					<section class ="title">무통장입금 주문 후, 입금하였는데 취소 문자를 받았습니다.</section>
						<p class = "desc">
						 	담당센터(02-444-4444)로 문의 해주시기 바랍니다.
						</p>
					<section class ="title">실시간 계좌이체 이용 가능 시간은 어떻게 되나요?</section>
						<p class = "desc">
							은행의 업무상 저희 쇼핑몰은 국민:00:30 ~ 23:30으로 이 시간대 까지는 가능합니다.
						</p>
					<section class ="title">실시간 계좌이체 한도는 얼마인가요? 법인게좌로 가능한가요?</section>
						<p class = "desc">
							실시간계좌이체 1회 이체한도는 200만 원입니다.  
							실시간계좌이체는 해당 은행의 정책과 고객님 등급에 따라 1회 및 1일 이체한도가 제한될 수 있으니 이용에 참고해 주세요.
						</p>	
					</article>
				</div>
				<!-- faq 끄트머리. -->
				
				<!-- Q&A 시작 -->
				<div id="qna_board">
				Q&A
				<table>
					<tr>
						<td>번호</td>
						<td>작성자</td>
						<td>문의사항</td>
						<td>제목</td>
						<td>날짜</td>
						<td>조회수</td>
					</tr>
					<tbody id='load'>
					</tbody>
				</table>
				</div>
				
				<!-- Q&A 종료-->
			</div>
		</section>
		<!-- FAQ,QNA 페이즈 끝 -->
		
		<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
	</div>
</body>
</html>