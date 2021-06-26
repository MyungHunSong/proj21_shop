<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="reviewsList" value="${reviewsMap.listReviews}" />
<c:set var="selectedReviews" value="${reviewsMap.selectedReviews}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${contextPath}/resources/admin/assets/libs/jquery/dist/jquery.min.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="${contextPath}/resources/admin/dist/js/custom.min.js"></script>
<title>회원정보 리스트</title>
<script>
	$(document).ready(function() {

		$("input[id='search_option']").click(function() {
			var memberId = $('#memberId').val();
			var proNum = $('#proNum').val();

			$('#container').load('${contextPath}/admin/review/listReviews', {
				memberId : memberId,
				proNum : proNum
			});
		});

		$("#ck_all").click(function() {
			if ($("#ck_all").prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);
			} else {
				$("input[type=checkbox]").prop("checked", false);
			}
		});
		$("#delete").click(function() {
			var delete_val = [];
			if (confirm("정말 삭제하시겠습니까?")) {
				$("input[name=checkRow]:checked").each(function() {
					delete_val.push($(this).val());
				});

				$.ajax({
					type : "post",
					async : false,
					url : "${contextPath}/admin/review/deleteReviews",
					traditional : true,
					data : {
						"_delete_val" : delete_val
					}, //수정요망
					success : function(data, textStatus) {
						alert("리뷰을 삭제했습니다");
						location.href = "${contextPath}/admin/review/listReviews";
					},
					error : function(data, textStatus) {
						alert("에러");
					},
					complete : function(data, textStatus) {
						//alert("작업을완료 했습니다");
					}
				}); //end ajax	 
			}
		});
	});
</script>
<style>
@media
(
min-width
:
767.98px)
{
.card {
	margin-left: 300px;
	margin-right: 50px;
}
}
</style>
<style>
tr {
	text-align: center;
}

th {
	white-space: nowrap;
	padding: 5px 10px 5px 10px;
	background-color: #1f262d;
}

td {
	padding: 5px 10px 5px 10px;
	word-break: keep-all;
}

ul {
	margin: 0px;
	padding: 0px 10px 0px 15px;
}

li {
	margin: 0;
	padding-right: 10px;
	border: 0;
	float: left;
}

a {
	text-decoration: none;
	color: #000000;
}

#chartContainer {
	display: block;
	padding: 0px;
}

.pleft {
	text-align: left;
}

.smallul {
	list-style: none;
}

#listProductsByStatus {
	padding-left: 25%;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">
				<div class="card">
					<br> <br>
					<center>
						<h2>리뷰 목록</h2>
						<hr>
						<br>
						<form action="${contextPath }/admin/review/listReviews" method="post" id="frm_search">
							<table style="width: 100%;">
								<tr>
									<td colspan="2">&nbsp;&nbsp;</td>
									<td colspan="5" class="pleft">멤버 ID : <input type="text" name="memberId" placeholder="멤버 ID를 입력하세요" id="memberId" />
									</td>
								</tr>
								<tr>
									<td colspan="2">&nbsp;&nbsp;</td>
									<td colspan="5" class="pleft">제품 번호 : <input type="text" name="proNum" placeholder="제품 번호를 입력하세요" id="proNum" />
									</td>
								</tr>

								<tr>
									<td colspan="7"><input type="button" value="검색" id="search_option" />&nbsp;&nbsp; <input type="reset" value="초기화" /></td>
								</tr>

							</table>
						</form>
					</center>
					<hr>
					<form method="post" action="${contextPath }/admin/review/deleteReviews" id="frm_delete">
						<table border="1" style="border-color: #ddd #ddd #848484 #ddd; width: 100%;">
							<tr style="color: white;">
								<th>전체 선택&nbsp;<input type="checkbox" id="ck_all" /></th>
								<th>멤버 ID</th>
								<th>제품 번호</th>
								<th>제품 이름</th>
								<th>리뷰 이미지</th>
								<th>내용</th>
								<th>별점</th>
								<th>리뷰 작성일</th>
							</tr>

							<c:choose>
								<c:when test="${empty reviewsList }">
									<h1>등록된 리뷰가 없습니다.</h1>
								</c:when>

								<c:when test="${ reviewsList !=null}">
									<c:forEach var="reviews" items="${reviewsList}">
										<tr style="text-align: center;">
											<td><input type="checkbox" name="checkRow" value="${reviews.reviewNum }" /></td>
											<td><a href="${contextPath }/productDetail?proNum=${reviews.proNum}">${reviews.memberId }</a></td>
											<td><a href="${contextPath }/productDetail?proNum=${reviews.proNum}">${reviews.proNum }</a></td>
											<td><a href="${contextPath }/productDetail?proNum=${reviews.proNum}">${reviews.proName.proName }</a></td>
											<td><a href="${contextPath }/productDetail?proNum=${reviews.proNum}">${reviews.reviewImagefilename1 }</a> <a href="${contextPath }/productDetail?proNum=${reviews.proNum}">${reviews.reviewImagefilename2 }</a></td>
											<td><a href="${contextPath }/productDetail?proNum=${reviews.proNum}">${reviews.reviewContent }</a></td>
											<td><a href="${contextPath }/productDetail?proNum=${reviews.proNum}">${reviews.reviewStar }</a> 점</td>
											<td><a href="${contextPath }/productDetail?proNum=${reviews.proNum}">${reviews.reviewDate }</a></td>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>
							<tr>
								<td colspan="8" style="text-align: left;"><input type="button" value="삭제하기" id="delete" /></td>
							</tr>
						</table>

						<c:if test="${selectedReviews !=null}">
							<c:choose>
								<c:when test="${selectedReviews > 200 }">
									<c:forEach var="page" begin="1" end="10" step="1">

										<c:if test="${section >1 && page==1 }">
											<!--페이지번호가 1일때 pre나오게 하기 -->
											<a href="${contextPath }/admin/review/listReviews?section=${section-1}&pageNum=${(section-1)*20+1}">%nbsp; pre </a>
										</c:if>

										<a href="${contextPath }/admin/review/listReviews?section=${section}&pageNum=${page}">${(section-1)*20 + page }</a>

										<c:if test="${page==20} }">
											<!--페이지수가 10일때 다음으로 next나오게 하기  -->
											<a href="${contextPath }/admin/review/listReviews?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
										</c:if>
									</c:forEach>
								</c:when>

								<c:when test="${selectedReviews == 200 }">
									<c:forEach var="page" begin="1" end="10" step="1">
										<a href="#"> ${page } </a>
									</c:forEach>
								</c:when>

								<c:when test="${selectedReviews < 200 }">
									<c:forEach var="page" begin="1" end="${selectedReviews/20+1 }" step="1">
										<c:choose>
											<c:when test="${page==pageNum }">
												<a class="sel-page"
													href="${contextPath }/admin/review/listReviews?
													section=1
													&pageNum=${page}
													&memberId=${memberId}
													&proNum=${proNum}">
													${page} </a>
											</c:when>
											<c:otherwise>
												<a class="no-uline"
													href="${contextPath }/admin/review/listReviews?
													section=1
													&pageNum=${page}
													&memberId=${memberId}
													&proNum=${proNum}">
													${page } </a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
							</c:choose>
						</c:if>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>