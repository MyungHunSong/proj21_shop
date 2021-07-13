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
<link rel="stylesheet" href="${contextPath}/resources/qna/css/qna_qna.css">
<style type="text/css">
.showReply{
	display: none;
}
#contentArea{
	margin-left:10px;
	width: 800px;
	height: 100px;
}

#contentArea button{
	margin-left:10px;
}

.tableTitle{
	padding: 10px;
	margin-top: 15px;
	background-color: black;
	font-size: 25px;
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
	font-size: 15px;
	font-weight: bold;
}
.clickContent td{
	/* background-color: #E1F6FA; */
	text-align: left;
	border-bottom: 1px solid #ccc;
}

.showReply{
	box-sizing: box;
}
.showReply #classReply{
	text-align: center;
	font-size: 15px;
	font-weight: bold;
}
.showReply td{
	background-color: #E1F6FA;
	text-align: left;
	cursor: pointer;
}

<!-- 답글 달기의 등록 수정 -->
.clickReplyTd button{
	size: 30px;
}

<!-- 수정 삭제 버튼 바뀌기-->
td button{
	margin: auto;
}

.modifyMyQna{
	border: 1px solid;
	background-color: white;
	color:#ccc;
	cursor: pointer;
	size: 10px;
}

.deleteMyQna{
	margin-left:10px;
	border: 1px solid;
	background-color: white;
	color:#ccc;
	cursor: pointer;
	size: 10px;
}

button.hover1 :hover {
	color: #048ef;
}
button.hover2 :hover {
	color: #048ef;
}
<!-- 수정 삭제 버튼 바뀌기-->

</style>
<script type="text/javascript">
var keyword = "${keyword}";
$(function(){
	var contextPath = "${contextPath}";
	var page=${page};
	var perPageNum=${perPageNum};
	var searchType ="${searchType}";
	
	
	// 회원 이름.
	var memberName = "${authInfo.name}";
	console.log(memberName)
	// 
	$.get(
			contextPath + "/api/qna/"+ page +"/" + perPageNum + "/" + searchType + "/" + keyword,
	function(json){
		var dateLength = json.length;
		var sCont = "";
		if(dateLength <= 0){	
			 window.location.href = contextPath + "/listPaging?page="+page + "&pagePageNum="+ perPageNum + "&searchType=" + searchType + "&keyword=";
			 alert("조회된 결과가 없습니다.")			
		}else if(dateLength >= 1){
							
				for(i = 0; i<dateLength; i++){
					
					if(json[i].qStep == 0){
						
							sCont += "<tr class='mainTable'>";														
							 if(json[i].qOp == "공지"){
								sCont += "<td class = 'clickOption' style='color:red; background-color:pink;' >"+json[i].qOp + "</td>";
								sCont += "<input type = 'hidden' value = "+ json[i].qIndex +">";
								sCont += "<input type = 'hidden' value="+ json[i].qGroup +">";	
								sCont += "<td class = 'clickOption' style='background-color:pink;'>" + json[i].qMember + "</td>";
								sCont += "<td class = 'clickOption' style='background-color:pink;'>" + json[i].qOption + "</td>";
								sCont += "<td class = 'clickOption' style='background-color:pink;'>" + json[i].qTitle + "</td>";
								sCont += "<td class = 'clickOption' style='background-color:pink;'>" + json[i].qDate + "</td>";
								sCont += "<td class = 'qHit' style='background-color:pink;'>" + json[i].qHit + "</td>";
							}else{
								sCont += "<td class = 'clickOption'>"+json[i].qOp + "</td>";
								sCont += "<input type = 'hidden' value = "+ json[i].qIndex +">";
								sCont += "<input type = 'hidden' value="+ json[i].qGroup +">";						
								sCont += "<td class = 'clickOption'>" + json[i].qMember + "</td>";
								sCont += "<td class = 'clickOption'>" + json[i].qOption + "</td>";
								sCont += "<td class = 'clickOption'>" + json[i].qTitle + "</td>";
								sCont += "<td class = 'clickOption'>" + json[i].qDate + "</td>";
								sCont += "<td class = 'qHit'>" + json[i].qHit + "</td>";
							 } 
							sCont += "</tr>";
								
								sCont += "<tr class = 'clickContent'>";
								sCont += "<td id='detailContent'> content </td><br>";	
							if("${authInfo.id}" == "admin" && "${authInfo.name}" == "관리자"){	
								
								if(json[i].qOption == "공지"){
									sCont += "<td colspan ='4' style='word-wrap:break-word;'>" + json[i].qContent + "</td>";	
								}else{
									sCont += "<td colspan ='4' style='word-wrap:break-word;'>" + json[i].qContent + "<a class= 'clickReply' style='color:red; cursor:pointer;'> [답글 달기]</a></td>";	
								}
							}else if("${authInfo.id}" != "admin" && "${authInfo.name}" != "관리자"){
								if(json[i].qOption == "공지"){
									sCont += "<td colspan ='5'>        "+ json[i].qContent + "</td>";
								}else if("${authInfo.name}" == json[i].qMember){
									console.log(json)
									sCont += "<td colspan ='4'><img src='"+contextPath+"/resources/qna/upload/" + json[i].qFile +"' style='width: 90px; height: 140px;'/><p style='border-top:1px solid gray'>"
									+ json[i].qContent + "</p></td>";		
								}else{
									console.log(json)
									sCont += "<td colspan ='5'><img src='"+contextPath+"/resources/qna/upload/" + json[i].qFile +" ' style='width: 90px; height: 140px; ' /><p style='border-top:1px solid gray'>"
									+ json[i].qContent + "</p></td>";		
								}	
							}
							if(memberName == json[i].qMember){
								sCont += "<td colspan='1'><button   class='modifyMyQna hover1'>수정</button><button class='deleteMyQna hover2'>삭제</button></td>"
							}
							sCont += "</tr>"
						
					}else if(json[i].qStep == 1){
							sCont += "<tr class='showReply'>";
							sCont += "<input type = 'hidden' value = "+ json[i].qIndex +">";
						if("${authInfo.id}" != "admin" && "${authInfo.name}" != "관리자"){
							sCont += "<td id = 'classReply' coslpan='1' >답변</td> " 
							sCont += "<td colspan='4'> " +json[i].qContent+ "<td>";
						}else{
							sCont += "<td id = 'classReply' coslpan='1'>답변</td> " 
							sCont += "<td colspan='3'> " +      json[i].qContent+ "<td>";
							sCont += " <td colspan='1'><button type = 'button' class = 'deleteContent' >삭제</button></td>";
						}
						
							sCont += "</tr>";												
					}
					
					sCont += "<tr class ='clickReplyTd' type='hidden' >";
					sCont += "<td style='font-size: 15px; font-weight: bold; '>관리자</td>"
					sCont += "<td colspan='5' float='left' ><br>"
									+ "<textarea id='contentArea' name='contentArea'></textarea><br>"
									+"<button type = 'submit' class = 'addContent'>등록</button>"
									+"<button type = 'submit' class = 'modifyContent'>수정</button></td>";
					sCont += "</tr>";
					
					
					
				}
				$("#load").append(sCont);
			}
			
			// 삭제하기
			$('.deleteMyQna').on('click', function(){
				var idx = $(this).parent().parent().prev().children().next().val();
				var group = $(this).parent().parent().prev().children().next().next().val();
				
				console.log(group)
				
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
						location.reload();				
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
						var popup = window.open('http://localhost:8080${contextPath}/qnaModify?idx=' + idx, '수정팝업',
								'width=520px, height = 520px')									

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
					console.log(cnt)					
					$(this).next().next().next().next().next().next().next().text(cnt + 1)
					
					if($(this).parent().next().hasClass('active')){
						
					$(this).next().next().next().next().next().next().next().text(cnt)
						$(this).parent().next().removeClass('active');
					
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
				var content= $("textarea[name='contentArea']:visible").val();
				
				console.log(group)
				var insertItem = {
					    "qTitle": "null",
					    "qMember": "admin",
					    "qContent": content,					 
					    "qGroup": group,
					    "qStep": 1
					  }
				if(content == null && content == ""){
					alert("내용을 입력해 주세요")
					return;
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
				<li><a href="${contextPath}/listPaging${pageMaker.makeSearch(pageMaker.startPage - 1)}" class="arrow prev"></a></li> 
				</c:if>

				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li <c:out value="${pageMaker.cri.page == idx}"/>>
							<!-- 검색조건 수정. -->
						<a href="${contextPath}/listPaging${pageMaker.makeSearch(idx)}" class ="go_other">${idx}</a>
				</c:forEach>
				
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li>
						<!-- 검색조건 수정. -->
						<a href="${contextPath}/listPaging${pageMaker.makeSearch(pageMaker.endPage+1)}" class="arrow next"></a> 
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