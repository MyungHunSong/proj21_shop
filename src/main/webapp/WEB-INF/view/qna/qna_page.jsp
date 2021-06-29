<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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



.tableTitle{
	padding: 10px;
	margin-top: 15px;
	background-color: black;
}
.tableTitle td{
	color: white;
}
<!-- 메인 테이블-->
.mainTable{
	box-sizing: box;
}

.mainTable td{
	background-color: #f4f4f4;
	border-bottom: 1px solid #ccc;
	cursor: pointer;
}
<!-- 상세정보 테이블-->
.clickContent{
	width: 40px;
	height: 30px;
	
}
.clickContent #detailContent{
	text-align: center;
}
.clickContent td{
	background-color: #E1F6FA;
	text-align: left;
	border-bottom: 1px solid #ccc;
}

.showReply{
	box-sizing: box;
}
.showReply #classReply{
}
.showReply td{
	background-color: #E1F6FA;
	text-align: left;
	cursor: pointer;
}

div.topQna{
	width: 1000px;
	height: 800px;
	margin: auto;
}
</style>
<script type="text/javascript">
$(function(){
	var contextPath = "${contextPath}";
	var page=${page};
	var perPageNum=${perPageNum};
	var searchType ="${searchType}";
	var keyword = "${keyword}";
	
	// 회원 이름.
	var memberName = "${authInfo.name}";
	console.log(memberName)
	
	$.get(
			contextPath + "/api/qna/"+ page +"/" + perPageNum + "/" + searchType + "/" + keyword,
	
	function(json){
		var dateLength = json.length;
			if(dateLength >= 1){
				var sCont = "";
				console.log(json[0].qGroup)
				
				for(i = 0; i<dateLength; i++){
					if(json[i].qStep == 0){
							sCont += "<tr class='mainTable'>";
							sCont += "<td class = 'clickOption'>"+json[i].qOp + "</td>"; 
							sCont += "<input type = 'hidden' value = "+ json[i].qIndex +">";
							sCont += "<input type = 'hidden' value="+ json[i].qGroup +">";						
							sCont += "<td class = 'clickOption'>" + json[i].qMember + "</td>";
							sCont += "<td class = 'clickOption'>" + json[i].qOption + "</td>";
							sCont += "<td class = 'clickOption'>" + json[i].qTitle + "</td>";
							sCont += "<td class = 'clickOption'>" + json[i].qDate + "</td>";
							sCont += "<td class = 'qHit'>" + json[i].qHit + "</td>";
							sCont += "</tr>";
								
								sCont += "<tr class = 'clickContent'>";
								sCont += "<td id='detailContent'>내용:</td>";	
							if("${authInfo.id}" == "admin"){	
								sCont += "<td colspan ='5'>" + json[i].qContent + "<a class= 'clickReply'> [답글 달기]</a></td>";
							}else if("${authInfo.id}" != "admin"){
								sCont += "<td colspan ='4'><img src=' "+contextPath+"/resources/qna/upload/" + json[i].qFile +"' width = 50px;/><span>"
								+"</span>"+ json[i].qContent + "</td>";
							}
							if(memberName == json[i].qMember){
								sCont += "<td colspan='1'><button class='modifyMyQna'>수정</button><button class='deleteMyQna'>삭제</button></td>"
							}
							sCont += "</tr>"
						
					}else if(json[i].qStep == 1){
							sCont += "<tr class='showReply'>";
							sCont += "<input type = 'hidden' value = "+ json[i].qIndex +">";
							sCont += "<td id = 'classReply' coslpan='1'>→답변</td> " 
							sCont += "<td colspan='5'> " +json[i].qContent+ "<td>";
						if("${authInfo.id}" == "admin"){
							sCont += " <td colspan><button type = 'button' class = 'deleteContent' >삭제</button></td>";
						}
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
			
			// 삭제하기
			$('.deleteMyQna').on('click', function(){
				var idx = $(this).parent().parent().prev().children().next().val();
				var group = $(this).parent().parent().prev().children().next().next().val();
				
				deleteItem ={
						"qIndex" : idx,
						"qGroup":group
				}
				console.log(deleteItem)
				$.ajax({
					url : contextPath + "/api/qnaDelete",
					type:"DELETE",
					contentType:"application/json; charset=utf-8",
					datatype:"json",
					data:JSON.stringify(deleteItem),
					success:function(){
						alert("삭제 했습니다.");
						window.location.href = contextPath + "/listPaging?page="+page + "&pagePageNum="+ perPageNum + "&searchType=" + searchType + "&keyword=";
					},
					error:function(){
						alert("삭제 실패.")
					}
				});
			});
				
			// 내가쓴글 수정하기 누르면 수정 페이지로.
			$('.modifyMyQna').on('click', function(){								 
				var idx = $(this).parent().parent().prev().children().next().val();			 
				$.ajax({
					url: contextPath + "/api/qnainsert/"+ idx,
					type:"GET",
					contentType:"application/json; charset=utf-8",
					datatype:"json",
					data:JSON.stringify(),
					success:function(){
						// 팝업창 열기
						var popup = window.open('http://localhost:8080/proj21_shop/qnaModify?idx=' + idx, '수정팝업',
								'width=520px, height = 520px')	
						location.reload();		
					}	
				});		 		
			});
			
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
					},
					error:function(){
						alert("수정 불가.");
					}
				}); 
			});
			
			// 조회수 ajax 구현 & 상세내용 보기. -시작-
			$('.clickOption').on('click',function(){
					var idx = $(this).next().val();		
					var group = $(this).next().next().val();
					
					var cnt = parseInt($(this).next().next().next().next().next().next().next().text())
					$(this).next().next().next().next().next().next().next().text(cnt + 1)
					
					if($(this).parent().next().hasClass('active')){
						
					$(this).next().next().next().next().next().next().next().text(cnt)
						$('.clickOption').parent().next().removeClass('active');
						$('.showReply').parent().next().next().next().removeClass('active');
						$(this).parent().next().next().removeClass('active');
						$(this).parent().next().next().next().removeClass('active');
						
						$.ajax({
							url:contextPath +"/api/qna/" + page +"/" + perPageNum + "/" + searchType + "/" + keyword,
							type:"GET",
							contentType:"application/json; charset=utf-8",
							datatype:"json",
							data:JSON.stringify(page),
							success:function(){
								
							},
							error:function(){
								alert("조회할 페이지를 찾지 못했습니다.")
							}
						});	
					}else{
						
						$(this).parent().next().addClass('active');
						$(this).parent().next().next().next().addClass('active');
						$(this).parent().next().next().removeClass('active');
						
						$.ajax({
							url : contextPath +"/api/qna/" + idx,
							type:"PATCH",
							contentType:"application/json; charset=utf-8",
							datatype:"json",
							data:JSON.stringify(idx),
							success:function(){
								
							},
							error:function(){
							}
						});
					}
			})
			// 조회수 ajax 구현 -끝-
			
			// 답글 달기.
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
									location.reload();	
								
								
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
	<div class = "topQna">
		<div id="qna_board">
			<jsp:include page="/WEB-INF/view/qna/qna_list.jsp"></jsp:include>
			<table class="qna_table">
				<tr class = "tableTitle">
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
						<!-- (uri을 이용한)검색조건 수정. -->
				<li><a href="/proj21_shop/listPaging${pageMaker.makeSearch(pageMaker.startPage - 1)}">[이전]</a></li> 
				</c:if>

				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li <c:out value="${pageMaker.cri.page == idx}"/>>
							<!-- 검색조건 수정. -->
						<a href="/proj21_shop/listPaging${pageMaker.makeSearch(idx)}" class ="go_other">${idx}</a>
				</c:forEach>
				
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li>
							<!-- 검색조건 수정. -->
						<a href="/proj21_shop/listPaging${pageMaker.makeSearch(pageMaker.endPage+1)}">[다음]</a> 
					</li>
				</c:if>
			</ul>
			</div>
			<!-- 페이징 끝 -->
		</div>
	</div>
		<!-- Q&A 끝 -->
</body>
</html>