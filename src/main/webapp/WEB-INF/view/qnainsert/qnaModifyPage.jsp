<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>    
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>수정 페이지</title>
<link rel="stylesheet" href="/proj21_shop/resources/qna/css/qna_qna.css">
<link rel="stylesheet" href="/proj21_shop/resources/main/css/main.css">
<link rel="stylesheet" href="/proj21_shop/resources/qna/css/qnaModifyPage.css">
<script type="text/javascript">
$(function(){
	var contextPath = "${contextPath}";
	
	$("input[name='uploadFile']").hide();	
	
	$('#preview').click(function(){
		  
	 	$("input[name='uploadFile']").click();
	  });
	
// 수정하기.
 $(".modifyQna").on("click", function(){
    var idx = ${idx};
    var title = $("input[name=Title]:visible").val();
    var option = $("select[name=searchType]:visible").val();		 	
    var content = $("textarea[name='Content']:visible").val();
    if("${authInfo.id}" != "admin" && "${authInfo.name}" != "관리자"){
      var file = document.getElementById("addPoto").files[0].name;
    }
	
    modifyItem = {
        "qIndex" : idx,
        "qTitle" : title,
        "qOption" : option,
        "qContent" : content,
        "qFile" : file
    };
	
    $.ajax({
      url: '/proj21_shop/api/qnainsert/' + idx,
      type:'PATCH',
      contentType:"application/json; charset=utf-8",
      datatype:"json",
      data:JSON.stringify(modifyItem),
      success:function(){
        alert("수정 완료")
        // 새로고침 
        opener.parent.location= contextPath + "/listPaging?page="+1 + "&pagePageNum="+ 10 + "&searchType=a&keyword=";
        // 팝업창 닫기 (완료후)
        window.open("about:blank", "_self").close();
      }
    });
	//
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
		  url: '/proj21_shop/api/uploadAjaxAction',
		  processData : false,
		  contentType : false,
		  data : formData,
		  type : 'POST',
		  dataType : 'json'
	  });
	});
 
//-- 서버로 전송할 첨부파일을 서버에 전송하는 코드.
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
});


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
 
</script>
</head>
<body>
	<div class = 'container'>
		<div class = "QNAmodify">
			<h3>나의 글 수정</h3>
			<section id="QnaSec">
					<div id = 'main1'>
						<label>문의 유형 </label> <select name="searchType" id="searchType">
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
				<c:if test ="${!empty authInfo && authInfo.id ne admin}">
						<div id = 'main2'>	
							<label>작성자</label><input type="text" value="${authInfo.name}"  readonly="readonly"  style="background-color: #e2e2e2"><br>
						</div>
				</c:if>
					
				<c:if test ="${!empty authInfo}">
						<div id = 'main3'>
							<label>이메일</label><input type="text" value="${authInfo.email}" readonly="readonly" style="background-color: #e2e2e2"><br>						
						</div>
				</c:if>
					<div id = 'main4'>
						<label>제목</label><input type="text" name="Title" value="${qnaDto.qTitle}"><br>
					</div>
				<c:if test="${authInfo.id ne 'admin'}">
					<div id = 'main5'>
						<label>문의내용</label>
						<textarea rows="10" cols="40"  name="Content" ></textarea>
						<br>
					</div>
				</c:if>				
				<c:if test="${authInfo.id eq 'admin'}">
					<div id = 'main5'>
						<label>공지내용</label>
						<textarea rows="10" cols="40" name="Content" ></textarea>
						<br>
					</div>
				</c:if>
					
				<c:if test="${authInfo.id ne 'admin'}">	
					<div id = 'main6'>
						<div>
						사진 추가
							<input type="file" name="uploadFile"  id="addPoto" onchange="readURL(this, this.id)" multiple="multiple">
						</div>
						<div id="image_list">
							<img id="preview" src="/proj21_shop/resources/qna/images/fileimg.jpg" width="100" height="100">
						</div>
					</div>
				</c:if>	
				</section>
		</div>
		<button class ="modifyQna" >수정</button>
	</div>
</body>
</html>