<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/main/css/main.css">
<link rel="stylesheet"
	href="${contextPath}/resources/qna/css/qnaInsertpage.css">
<title>글쓰기 작성</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

	function readURL(input, id){
		
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				if(id=='addPoto'){
					$('#preview').attr('src', e.target.result);
					console.log($('#preview').attr('src', e.target.result))
				}else{
					$('#preview' + id).attr('src', e.target.result)
				}
			}
			reader.readAsDataURL(input.files[0]);
		}
	}


	$(function(){
			$("input[name='uploadFile']").hide();
			var contextPath = "${contextPath}";
	 	
		 	 $('#preview').click(function(){
		  
		 	$("input[name='uploadFile']").click();
		  });
		 	 
		 	// 작성하기.
		   $(".insertQna").on('click', function(){
			  	var title = $("input[name=Title]:visible").val();
			 	var option = $("select[name=searchType]:visible").val();
			 	var member = "${authInfo.id}"
			 	var content = $("textarea[name='Content']:visible").val();
			 	
			 	if("${authInfo.id}" != "admin" && "${authInfo.name}" != "관리자"){
			 		var file = document.getElementById("addPoto").files[0].name;
			 	}
			 	var insertItem = {
			 			"qTitle": title,
			 			"qOption":option,
			 			"qMember":member,
			 			"qContent":content,
			 			"qFile":file
			 	};
			 	$.ajax({
			 		url: contextPath+'/api/qnainsert/',
			 		type:'POST',
			 		contentType:"application/json; charset=utf-8",
			 		datatype:"json",
			 		data:JSON.stringify(insertItem),
			 		success:function(){
			 			alert('글을 올렸습니다.')
			 			 window.location.href = contextPath + "/listPaging?page="+1 + "&pagePageNum="+ 10 + "&searchType=a&keyword=";
			 		},
			 		error:function(){
			 			alert("실패");
			 		}	
			 	});							  
			});	
		 	// 취소하기.
		 	$(".canselQna").on('click', function(){
		 		var result = confirm('쓰시던 작업을 취소 하시 겠습니까?.')
		 		
		 		if(result){
		 			window.location.href = contextPath + "/listPaging?page="+1 + "&pagePageNum="+ 10 + "&searchType=a&keyword=";
		 			
		 		}else{
		 			location.replace()
		 		}
		 	});
		   
		   $("input[type='file']").on("change", function(e){
				 let formData = new FormData();
				 let fileInput = $('input[name="uploadFile"]');
				 let fileList = fileInput[0].files;
				 let fileObj = fileList[0];
				 
				if(!fileCheck(fileObj.name, fileObj.size)){
					return false;
				}
				formData.append("uploadFile", fileObj);
				
				 $.ajax({
					  url:	contextPath + '/api/uploadAjaxAction',
					  processData : false,
					  contentType : false,
					  data : formData,
					  type : 'POST',
					  dataType : 'json'
				  });
			 });
			  
			  // -- 서버로 전송할 첨부파일을 서버에 전송하는 코드.
			  let regex = new RegExp("(.*.?)\.(jpg|png)$");
			  let maxSize = 1048576;
			  
			  function fileCheck(fileName, fileSize){
				  if(fileSize >= maxSize){
					  alret("파일 사이즈 초과");
					  return false;
				  }
				  if(!regex.test(fileName)){
					  alert("해당 종류의 파일은 업로드할 수 없습니다.")
					  return false;
				  }
				  return true;
			  } 
			  
			  // 조회 페이지.
			  $('.goMyOrder').on('click', function(){				
				  var memberId = "${authInfo.id}"; 
				  console.log(memberId)
		 				 
				   $. ajax({
					  url: contextPath +  "/api/qnaMyOrder/${authInfo.id}",
				 		type:'GET',
				 		contentType:"application/json; charset=utf-8",
				 		datatype:"json",
				 		data:JSON.stringify(memberId),
				 		success:function(){
				 			var popup = window.open('http://localhost:8080${contextPath}/qnaMyOrder?=${authInfo.id}', '조회',
							  'width=620px, height = 450px')						
				 		},
				 		error:function(){
				 			alert("조회할 상품 내역이 없습니다.")
				 		}
				  });	 			
			  });
	});
	
</script>
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
		<div class="InsertMain">
			<div id="QNA">
				<h3 style="text-align: left; font-size: 30px;">Q&A</h3>
				<ul style="text-align: left;">
					<li style="color: red;">제품 사용, 오염, 전용 박스 손상, 라벨 제거, 사은품 밑 부속 사용/분실 시, 교환/환불이 불가능 합니다.</li>
					<li style="color: red;">교환을 원하시는 상품(사이즈)의 재고가 부족 시, 교환이 불가합니다.</li>
				</ul>
			</div>
			<div class="QnaInsert">
				<h3>문의 작성</h3>
				<section id="QnaSec">
					<div id = "main1">
						<label>문의 유형 </label>
					    <select name="searchType" id="searchType">
							<option>문의유형 선택</option>
						<c:if test="${authInfo.id eq 'admin'}">
							<option value ="공지">공지</option>
						</c:if>
						<c:if test="${authInfo.id ne 'admin'}">
							<option value="제품문의">제품문의</option>
							<option value="환불문의">환불문의</option>
							<option value="포인트 º 적립금">포인트 º 적립금</option>
							<option value="회원관련">회원관련</option>
							<option value="주문결제">주문결제</option>
							<option value="기타">기타</option>
						</c:if>
						</select>						
					</div>
				<c:if test="${authInfo.id ne 'admin'}">
					<div id = "main2">
						<label>주문 번호</label>
						<input type="text" class = "MyOrder" name = "MyOrder" readonly="readonly">
						<button class="goMyOrder">조회</button>
						<br>
					</div>
				</c:if>
				<c:if test ="${!empty authInfo && authInfo.id ne admin}">
						<div id = "main3">	
							<label>작성자</label><input type="text" value="${authInfo.id}"  readonly="readonly"  style="background-color: #e2e2e2"><br>
						</div>
				</c:if>
					
				<c:if test ="${!empty authInfo}">
						<div id = "main4">
							<label>이메일</label><input type="text" value="${authInfo.email}" readonly="readonly" style="background-color: #e2e2e2"><br>						
						</div>
				</c:if>
					
					<div id = "main5">
						<label>제목</label><input type="text" name="Title"><br>
					</div>
				<c:if test="${authInfo.id ne 'admin'}">
					<div id = "main6">
						<label>문의 내용</label>
            
						<textarea rows="10" cols="40"  name="Content"></textarea>

						<br>
					</div>
				</c:if>
				
				<c:if test="${authInfo.id eq 'admin'}">
					<div id = "main6">
						<label>공지내용</label>

						<textarea rows="10" cols="40" name="Content"></textarea>

						<br>
					</div>
				</c:if>
					
				<c:if test="${authInfo.id ne 'admin'}">	
					<div id = "main7">
						<div>
						사진 추가
							<input type="file" name="uploadFile"  id="addPoto" onchange="readURL(this, this.id)" multiple="multiple">
						</div>
						<div id="image_list">
							<img id="preview" src="${contextPath}/resources/qna/images/fileimg.jpg" width="100" height="100" style="cursor: pointer;">
						</div>
					</div>
				</c:if>					
				</section>
			</div>
				<div id="insertNcancle">
					<button class = "insertQna">작성하기</button><button class="canselQna">취소하기</button>
				</div>
		</div>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
	</div>
</body>
</html>