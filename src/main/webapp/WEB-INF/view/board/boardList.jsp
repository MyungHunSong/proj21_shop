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
	var contextPath = "${contextPath}";
	var memberId = "${memberId}";
	
	/* QNA 내용 보는 팝업 띄우기 */
	function upModel(qMember, qIndex) {
		console.log(qMember)
		console.log(qIndex)
		
		var popupX = (window.screen.width / 2) - 300;
		var popupY = (window.screen.height / 2) - 225;
		window.open(contextPath+"/qnacontent?qMember="+qMember+"&qIndex="+ qIndex
				,'QNA CONTENT', 'status=no, height=450, width=600, left=' + popupX + ', top=' + popupY);
	}
	
	
	$(function() {
		
		var proNum = "${proNum}";
		console.log(proNum);
		
		$.get(contextPath + "/api/myreview/" + memberId, function(json) {
			console.log(json)
			
			var dataLength = json.length;
			if (dataLength >= 1) {
				var sCont = "";
				for (i = 0; i < dataLength; i++) {
					var proNum = json[i].proNum+""
					sCont += "<tr>";
					//제품 이름 클릭하면 제품 상세 페이지로 이동 
					sCont += "<td><a href='productDetail?proNum="+ proNum.substring(0,3) + "'>" + json[i].proName.proName + "</a></td>";
					//후기 이미지가 없을 때 noImage 띄우기
					if(json[i].reviewImagefilename2 == null || json[i].reviewImagefilename2 == ""){
						json[i].reviewImagefilename2 = 'noimage.jpg'
					}
					if(json[i].reviewImagefilename1 == null || json[i].reviewImagefilename1 == ""){
						json[i].reviewImagefilename1 = 'noimage.jpg'
					}
					sCont += "<td><img src="+contextPath+"/resources/review/images/" + json[i].reviewImagefilename1 + " width='70' height='60' ><img src=" + contextPath + "/resources/review/images/" + json[i].reviewImagefilename2 + " width='70' height='60'></td>";	
					sCont += "<td>" + json[i].reviewContent + "</td>";
					sCont += "<td>" + json[i].reviewStar + "</td>";
					sCont += "<td>" + json[i].reviewDate + "</td>";
					//후기 수정 하는 페이지로 이동
					sCont += "<td><a href='detailreview?memberId=" + memberId +"&proNum=" + proNum + "'>후기 수정</a></td>";
					sCont += "<tr>";
				}

				$("#load").append(sCont);
			}
		})
		
		
		
		$.get(contextPath + "/api/myqna/" + memberId, function(json) {
			console.log(json)
			var dataLength = json.length;
			console.log(json);
			if (dataLength >= 1) {
				var sCont = "";
				for (i = 0; i < dataLength; i++) {
					sCont += "<tr>";
					sCont += "<td>" + json[i].qIndex + "</td>";
					sCont += "<td><img src="+contextPath+"/resources/qna/images/" + json[i].qFile + " width='70' height='60' ></div></td>";
					if(json[i].qFile == null || json[i].qFile == ""){
						json[i].qFile = 'noimage.jpg'
					}
				    sCont += "<td><input class = 'bringContent' type='button' value=" + json[i].qTitle + "></td>";
				   	//sCont += "<input type='hidden' value=" +json[i].qIndex +  ">"
					sCont += "<td>" + json[i].qMember + "</div></td>";
					sCont += "<td>" + json[i].qDate + "</td>";
					sCont += "<td> <a href='#' style='cursor:pointer;' class='updateMyQna'>Q&A 수정 </a><input type='hidden' value=" +json[i].qIndex +  "></td>";

					sCont += "</tr>";
					
					
				}
				$("#loadtable").append(sCont);
			}
			
			/* QNA 버튼 눌렀을 때 팝업 띄우기 위해 넘겨줘야 할 값 정의하고 함수로 팝업 띄우기  */
			$('.bringContent').on('click',function(){
				var qMember = $(this).parent().next().text()
				var qIndex = $(this).parent().prev().prev().text()
				upModel(qMember,qIndex)

			})
			// QNA 수정페이지 팝업창.
			$('.updateMyQna').on('click', function(){
				var idx = $(this).next().val();
				var popupX = (window.screen.width / 2) - 400;
				var popupY = (window.screen.height / 2) - 325;
				
				
				console.log(idx)
				$.ajax({
					url: contextPath + "/api/qnainsert/"+ idx,
					type:"GET",
					contentType:"application/json; charset=utf-8",
					datatype:"json",
					data:JSON.stringify(),
					success:function(){						
						
						// 팝업창 열기
						var popup = window.open('http://localhost:8080${contextPath}/qnaUpdate?idx=' + idx, '수정팝업',
								'width=520px, height = 520px','status=no,left=' + popupX + ', top=' + popupY)		
					}	
				});		 		
			});	
		
		})
		
	})
</script>
<link rel="stylesheet" href="${contextPath }/resources/board/css/boardList.css" />
<link rel="stylesheet" href="${contextPath }/resources/main/css/main.css">
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
		<section id="boardArea">
			<div class="asd">
				<h3>내가 쓴 후기</h3>
				<table class="type11">
					  <colgroup>
					    <col width="15%"/>
					    <col width="15%"/>
					    <col width="30%"/>
					    <col width="10%"/>
					    <col width="20%"/>
					  </colgroup>
					<thead>
						<tr>
							<th>제품정보</th>
							<th>착샷</th>
							<th>후기내용</th>
							<th>별점</th>
							<th>작성일</th>
							<th id="modify">수정</th>
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
							<th id="modify">수정</th>
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