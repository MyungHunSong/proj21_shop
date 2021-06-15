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
				for(i = 0; i<dateLength; i++){
					sCont += "<tr>";
					/* sCont += "<td><a  id = 'detailClick' href='/proj21_shop/qna_detail?qIndex="+ json[i].qIndex +" '>" + json[i].qOp + "</a></td>"; */
					sCont += "<td class = 'clickOption'>"+json[i].qOp + "</td>"; 
					sCont += "<input type = 'hidden' value = "+ json[i].qIndex +">"; 
					/* sCont += "<td>" + +json[i].qOp + "</td>"; */
					sCont += "<td>" + json[i].qMember + "</td>";
					sCont += "<td>" + json[i].qOption + "</td>";
					sCont += "<td>" + json[i].qTitle + "</td>";
					sCont += "<td>" + json[i].qDate + "</td>";
					sCont += "<td>" + json[i].qHit + "</td>";		
					sCont += "</tr>";
					sCont += "<tr class = 'clickContent'>";
					sCont += "<td>content</td>";	
					sCont += "<td colspan = '5' ><img src='/proj21_shop/resources/banner/headerR.jpg' style = 'width : 30px;'/><span>	"+ json[i].qContent+"</span>"+json[i].qDate+"</td>";	
					sCont += "</tr>";
				}
				$("#load").append(sCont);
			}
			$('.clickOption').on('click',function(){
					var idx = $(this).next().val()
					console.log(idx)
					if($(this).parent().next().hasClass('active')){
						$('.clickOption').parent().next().removeClass('active')	
					}else{
						$(this).parent().next().addClass('active')	
					}
			})
		});
		
		
/* 		$('.clickOption').on("click",
		
		});
 */	
		$('#go_other').on
		("click",
				function(json){
				var idx = {
					"page":{
						"page":parseInt(${page})
					}			
			}
			 $.ajax({
			 	url:contextPath+"/api/qna/",
			 	type:"GET",
			 	contentType:"application/json; charset=utf-8",
			 	datatype:"json",
			 	cache:false,
			 	data:JSON.stringify(idx),
			 	success:function(res){
			 		 window.location.href= contextPath +"/api/qna/"+ page +"/" + perPageNum + "/" + searchType + "/" + keyword
			 		 // "/api/qna/"+ 
			 	}
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
						<a href="/proj21_shop/listPaging${pageMaker.makeSearch(idx)}" id="go_other">${idx}</a>
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