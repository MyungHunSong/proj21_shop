<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>QNA페이지</title>
<link rel="stylesheet" href="/proj21_shop/resources/qna/css/qna_qna.css">
<style type="text/css">
.showReply{
	display: none;
}
#contentArea{
	
	width: 800px;
	height: 30px;
}

#contentArea button{
	margin-left:10px;
}
</style>
<script type="text/javascript">
$(function(){
	var contextPath = "${contextPath}";
	var page=${page};
	var perPageNum=${perPageNum};
	var searchType ="${searchType}";
	var keyword = "${keyword}";
	
	$.get(
			contextPath + "/api/qna/"+ page +"/" + perPageNum + "/" + searchType + "/" + keyword,
	
	function(json){
		var dateLength = json.length;
			if(dateLength >= 1){
				var sCont = "";
				console.log(json[0].qGroup)
				
				for(i = 0; i<dateLength; i++){
					if(json[i].qStep == 0){
							sCont += "<tr>";
							sCont += "<td class = 'clickOption'>"+json[i].qOp + "</td>"; 
							sCont += "<input type = 'hidden' value = "+ json[i].qIndex +">";
							sCont += "<input type = 'hidden' value="+ json[i].qGroup +" >"
							sCont += "<td>" + json[i].qMember + "</td>";
							sCont += "<td>" + json[i].qOption + "</td>";
							sCont += "<td>" + json[i].qTitle + "</td>";
							sCont += "<td>" + json[i].qDate + "</td>";
							sCont += "<td>" + json[i].qHit + "</td>";
							sCont += "</tr>";
							
							sCont += "<tr class = 'clickContent'>";
							sCont += "<td>내용:</td>";	
							sCont += ""
							sCont += "<td colspan ='5'><img src='/proj21_shop/resources/banner/headerR.jpg' style = 'width : 30px;'/><span>"
							+json[i].qFile  +"</span>"+ json[i].qContent +
							 "<c:if test = '${!empty admin}' ><a class= 'clickReply'> [답글 달기]</td></c:if>";
							sCont += "</tr>"
						
					}else if(json[i].qStep == 1){
						sCont += "<tr class='showReply'>";
						sCont += "<input type = 'hidden' value = "+ json[i].qIndex +">";
						sCont += "<td>→답변:</td> " 
						sCont += "<td colspan='4'> " +json[i].qContent+ "<td>";
						sCont += " <td colspan ='1'><button type = 'button' class = 'deleteContent' style='display:none'>삭제</button></td>";
						sCont += "</tr>";						
					}
					
					sCont += "<tr class ='clickReplyTd' type='hidden' >";	
					sCont += "<td colspan='6' float='left'>관리자<p><label value="+ json[i].qMember +">" + "</label></p><br>"
									+ "<textarea id='contentArea' name='contentArea'></textarea><br>"
									+"<button type = 'button' class = 'addContent'>등록</button>"
									+"<button type = 'button' class = 'modifyContent'>수정</button></td>";
					sCont += "</tr>";			
				}
			
				$("#load").append(sCont);
			}
			// 답글 삭제.
			$('.deleteContent').on('click', function(){
				var idx = $(this).parent().prev().prev().prev().prev().val();
				console.log(idx);
				
				var deleteItem = {
				"qIndex":idx		
				};
				
				$.ajax({
					url:contextPath + "/api/qna/" + idx,
					type:"DELETE",
					contentType:"application/json; charset=utf-8",
					datatype:"json",
					data:JSON.stringify(deleteItem),
					success:function(){
						alert("삭제 했습니다.")
						window.location.href = contextPath + "/listPaging?page="+page + "&pagePageNum="+ perPageNum + "&searchType=" + searchType + "&keyword=";
					},
					error:function(){
						alert("삭제할 권한이 없습니다.")
					}
					
				});
			});
			
			
			// 답글 수정.
			$('.modifyContent').on('click', function(){
				/* var idx = $(this).parent().parent().prev().prev().children().next().next().val(); */
				var idx = $(this).parent().parent().next().children().val();
				console.log(idx);
				console.log($("textarea[name='contentArea']:visible").val())
				
				var modifyItem = {
						"qIndex": idx,
						"qContent": $("textarea[name='contentArea']:visible").val()
				};
				
			 	$.ajax({
					url:contextPath + "/api/qna/" + idx,
					type:"POST",
					contentType:"application/json; charset=utf-8",
					datatype:"json",
					data:JSON.stringify(modifyItem),
					success:function(modifyItem){
						alert("수정  했습니다.");
						window.location.href = contextPath + "/listPaging?page="+page + "&pagePageNum="+ perPageNum + "&searchType=" + searchType + "&keyword=";
					},
					error:function(){
						alert("수정 불가.");
					}
				}); 
			});
			
			// 조회수 ajax 구현 & 상세내용 보기. -시작-
			$('.clickOption').on('click',function(){
					var idx = $(this).next().val()
					var group = $(this).next().next().val()
					
					console.log($('.clickOption').parent().next().next().next().removeClass('active'))
								
					if($(this).parent().next().hasClass('active')){
						$('.clickOption').parent().next().removeClass('active')
						$('.showReply').parent().next().next().next().removeClass('active')
						
					
						$.ajax({
							url:contextPath +"/api/qna/" + page +"/" + perPageNum + "/" + searchType + "/" + keyword,
							type:"GET",
							contentType:"application/json; charset=utf-8",
							datatype:"json",
							data:JSON.stringify(page),
							success:function(){
								window.location.href = contextPath + "/listPaging?page="+page + "&pagePageNum="+ perPageNum + "&searchType=" + searchType + "&keyword=";
							},
							error:function(){
								alert("조회할 페이지를 찾지 못했습니다.")
							}
						});	
					}else{
						$(this).parent().next().addClass('active')	
						$(this).parent().next().next().next().addClass('active')							
						$.ajax({
							url : contextPath +"/api/qna/" + idx,
							type:"PATCH",
							contentType:"application/json; charset=utf-8",
							datatype:"json",
							data:JSON.stringify(idx),
							success:function(){
								contextPath + "/api/qna/"+ page +"/" + perPageNum + "/" + searchType
							},
							error:function(){
								alert("조회수 초과.")
							}
						});
					}
			})
			// 조회수 ajax 구현 -끝-
			
			// 답글 인서트.
			$(".clickReply").on('click', function(){
					var idx = $(this).parent().parent().prev().children().next().val();
					var group = $(this).parent().parent().prev().children().next().next().val();
					
					
					console.log(idx);
					console.log(group)
					if($(this).parent().parent().next().hasClass('active')){
						$(this).parent().parent(). next().removeClass('active');
						
					}else{
						$(this).parent().parent().next().addClass('active');					
					}
			});
			
			// -- 답글달기 인서트 기능 -- 
			$(".addContent").on('click', function(){
				console.log($("textarea[name='contentArea']:visible").val())
				var group = $(this).parent().parent().prev().prev().children().next().next().val();
				
				console.log(group)
				
				var insertItem = {
					    "qTitle": "null",
					    "qMember": "admin",
					    "qContent": $("textarea[name='contentArea']:visible").val(),
					    "qGroup": group,
					    "qStep": 1
					  }
				
					$.ajax({
							url:contextPath +"/api/qna/",
							type:"POST",
							contentType:"application/json; charset=utf-8",
							datatype:"json",
							data:JSON.stringify(insertItem),
							success:function(){
								alert('완료')
								window.location.href = contextPath + "/listPaging?page="+page + "&pagePageNum="+ perPageNum + "&searchType=" + searchType + "&keyword=";
							},
							error:function(){
								alert("실패")
							}
					});
			});
			
		});
	
});
</script>
</head>
<body>
	<!-- Q&A 시작 -->
		<div id="qna_board">
			<jsp:include page="/WEB-INF/view/qna/qna_list.jsp"></jsp:include>
			<table class="qna_table">
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

			<!-- 페이징 -->
			<div class="div_pagenation">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
				<!--  	<li><a href="/proj21_shop/listPaging?page=${pageMaker.startPage - 1}">이전</a></li> -->
						<!-- (uri을 이용한)검색조건 수정. -->
				<li><a href="/proj21_shop/listPaging${pageMaker.makeSearch(pageMaker.startPage - 1)}">[이전]</a></li> 
				</c:if>

				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li <c:out value="${pageMaker.cri.page == idx}"/>>
							<%-- <a href="/proj21_shop/listPaging?page=${idx}" id="go_other">${idx}</a></li> --%>
							<!-- 검색조건 수정. -->
						<a href="/proj21_shop/listPaging${pageMaker.makeSearch(idx)}" class ="go_other">${idx}</a>
				</c:forEach>
				
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li>
							<!-- <a href="/proj21_shop/listPaging?page=${pageMaker.endPage + 1}">[다음]</a> -->
							<!-- 검색조건 수정. -->
						<a href="/proj21_shop/listPaging${pageMaker.makeSearch(pageMaker.endPage+1)}">[다음]</a> 
					</li>
				</c:if>
			</ul>
			<!-- 로그인 시만 가능하다 로그인 안했다? 그럼 로그인 페이지로. -->
			</div>
			<!-- 페이징 끝 -->
		</div>
		<!-- Q&A 끝 -->
</body>
</html>