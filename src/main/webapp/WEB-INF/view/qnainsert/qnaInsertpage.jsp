<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/proj21_shop/resources/main/css/main.css">
<link rel="stylesheet"
	href="/proj21_shop/resources/qna/css/qnaInsertpage.css">
<title>글쓰기 작성</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		  $("input[name='imgFile']").hide();
		  $('#preview').click(function(){
			  
			  $("input[name='imgFile']").click();
		  });
		
	});


	function readURL(input, id){
		
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				if(id=='main'){
					$('#preview').attr('src', e.target.result);
					console.log($('#preview').attr('src', e.target.result))
				}else{
					$('#preview' + id).attr('src', e.target.result)
				}
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
		<div class="InsertMain">
			<div id="QNA">
				<h3>Q&A</h3>
				<ul>
					<li>제품 사용, 오염, 전용 박스 손상, 라벨 제거, 사음품 밑 부속 사용/분실 시, 교환/ 환불이 불가능
						합니다.</li>
					<li>교환을 원하시는 상품(사이즈)의 재고가 부족 시, 교환이 불가합니다.</li>
				</ul>
			</div>
			<div class="QnaInsert">
				<h3>문의 작성</h3>
				<section id="QnaSec">
					<div>
						<label>문의 유형</label> <select name="searchType" id="searchType">
							<option>제품문의</option>
							<option>환불문의</option>
							<option>포인트 º 적립금</option>
							<option>회원관련</option>
							<option>주문결제</option>
							<option>기타</option>
						</select>
					</div>
					<div>
						<label>주문 번호</label> <input type="text">
						<button>조회</button>
						<br>
					</div>
					<div>	
							<label>작성자</label><input type="text"><br>
					</div>
					<div>
						<c:if test ="${!empty authInfo}">
							<label>휴대전화</label><input type="text" ><br>
						</c:if>
					</div>
					<div>
						<c:if test ="${!empty authInfo}">
							<label>이메일</label><input type="text" ><br>
						</c:if>
					</div>
					<div>
						<label>제목</label><input type="text"><br>
					</div>
					<div>
						<label>문의내용</label>
						<textarea rows="10" cols="40"></textarea>
						<br>
					</div>
					<div>
						
						<div>
						>사진 추가
							<input type="file" id="main" name="imgFile" onchange="readURL(this, this.id);">
						</div>
						<div id="image_list">
							<img id="preview" src="/proj21_shop/resources/qna/images/fileimg.jpg" width="100" height="100">
						</div>
					</div>
					<button>작성하기</button>
				</section>
			</div>
		</div>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
	</div>
</body>
</html>