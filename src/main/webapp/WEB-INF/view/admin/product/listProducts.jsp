<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 리스트</title>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!--membersMap으로 가져와서 변수명 간단하게 새로 지정  -->
<c:set var="productsList" value="${productsMap.productsList}" />
<c:set var="modelList" value="${productsMap.modelList}" />
<c:set var="totProducts" value="${productsMap.totProducts}" />
<c:set var="bestProducts" value="${productsMap.bestProducts}" />
<c:set var="newProducts" value="${productsMap.newProducts}" />
<c:set var="steadyProducts" value="${productsMap.steadyProducts}" />
<c:set var="offProducts" value="${productsMap.offProducts}" />
<c:set var="outProducts" value="${productsMap.outProducts}" />
<c:set var="section" value="${productsMap.section}" />
<c:set var="pageNum" value="${productsMap.pageNum}" />
<c:set var="keyword" value="${productsMap.keyword}" />
<c:set var="proCategory" value="${productsMap.proCategory}" />
<c:set var="orderPrice" value="${productsMap.orderPrice}" />
<c:set var="orderSalesRate" value="${productsMap.orderSalesRate}" />
<c:set var="orderHits" value="${productsMap.orderHits}" />
<c:set var="proStatus" value="${productsMap.proStatus}" />
<c:set var="orderedTotal" value="${productsMap.orderedTotal}" />
<c:set var="selectedProducts" value="${productsMap.selectedProducts}" />


<script src="${contextPath}/resources/admin/assets/libs/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="${contextPath}/resources/admin/assets/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="${contextPath}/resources/admin/assets/extra-libs/sparkline/sparkline.js"></script>
<!--Wave Effects -->
<script src="${contextPath}/resources/admin/dist/js/waves.js"></script>
<!--Menu sidebar -->
<script src="${contextPath}/resources/admin/dist/js/sidebarmenu.js"></script>
<!--Custom JavaScript -->
<script src="${contextPath}/resources/admin/dist/js/custom.min.js"></script>
<!--This page JavaScript -->
<!-- <script src="dist/js/pages/dashboards/dashboard1.js"></script> -->
<!-- Charts js Files -->
<script src="${contextPath}/resources/admin/assets/libs/flot/excanvas.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.pie.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.time.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.stack.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.crosshair.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
<script src="${contextPath}/resources/admin/dist/js/pages/chart/chart-page-init.js"></script>

<script>
	$(document).ready(function() {

		$("input[id='search_option']").click(function() {

			var proName = $('#proName').val();
			var proStatus = $('input:radio[name=proStatus]:checked').val();
			var proCategory = $('#select1').val();
			var orderPrice = $('#select2').val();
			var orderSalesRate = $('#select3').val();
			var orderHits = $('#select4').val();

			$('#container').load('${contextPath}/admin/product/listProducts', {
				proName : proName,
				proCategory : proCategory,
				orderPrice : orderPrice,
				orderSalesRate : orderSalesRate,
				orderHits : orderHits,
				proStatus : proStatus
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
					url : "${contextPath}/admin/product/deleteProducts",
					traditional : true,
					data : {
						"_delete_val" : delete_val
					}, //수정요망
					success : function(data, textStatus) {
						alert("상품을 삭제했습니다");
						location.href = "${contextPath}/admin/product/listProducts";
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
	function upModel(proNum, proCategory, proColor, proSize) {
		var popupX = (window.screen.width / 2) - 300;
		var popupY = (window.screen.height / 2) - 225;
		window.open('${contextPath}/admin/product/upModelForm?proNum=' + proNum + '&proCategory=' + proCategory + '&proColor=' + proColor + '&proSize='
				+ proSize, '모델 추가하기', 'status=no, height=450, width=600, left=' + popupX + ', top=' + popupY);

	}
</script>

<style>
@media ( min-width : 767.98px) {
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
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">
				<div class="card">
					<br>
					<br>
					<center>
						<h2>상품 목록</h2>
					</center>
					<hr>

					<div id="listProductsByStatus">
						<ul class="smallul">
							<li>전체&nbsp;${totProducts }건&nbsp;&nbsp;|</li>
							<li>신제품&nbsp;${newProducts }건&nbsp;&nbsp;|</li>
							<li>베스트셀러&nbsp;${bestProducts }건&nbsp;&nbsp;|</li>
							<li>스테디셀러&nbsp;${steadyProducts }건&nbsp;&nbsp;|</li>
							<li>할인중&nbsp;${offProducts }건&nbsp;&nbsp;|</li>
							<li>품절&nbsp;${outProducts }건</li>
						</ul>
					</div>
					<br>
					<br>
					<br>
					<form action="${contextPath }/admin/product/listProducts" method="post" id="frm_search">
						<table style="width: 100%;">
							<tr>
								<td colspan="2">상품검색&nbsp;&nbsp;</td>
								<td colspan="5" class="pleft">상품명 : <input type="text" name="proName" placeholder="상품이름을 입력하세요" id="proName" />
								</td>
							</tr>

							<tr>
								<td colspan="2">상품구분&nbsp;&nbsp;</td>
								<td colspan="5" class="pleft"><input type="radio" value="" name="proStatus" checked>전체 <input type="radio" value="신상" name="proStatus">신제품 <input type="radio" value="최고"
									name="proStatus">베스트셀러 <input type="radio" value="추천" name="proStatus">스테디셀러 <input type="radio" value="세일" name="proStatus">할인중 <input type="radio" value="품절"
									name="proStatus">품절</td>
							</tr>

							<tr>
								<td colspan="2">상품분류&nbsp;&nbsp;</td>
								<td colspan="5" class="pleft"><select name="proCategory" id="select1" name="proCategory">
										<option value="" selected>--대분류 선택--</option>
										<option value="1">반팔</option>
										<option value="2">긴팔</option>
										<option value="3">슬립리스</option>
										<option value="4">후드</option>
										<option value="5">셔츠</option>
										<option value="6">스웨트 셔츠</option>
								</select> <select id="select2" name="orderPrice">
										<option value="">--가격분류 선택--</option>
										<option value="price_desc">가격 높은순</option>
										<option value="price_asc">가격 낮은순</option>
								</select> <select id="select3" name="orderSalesRate">
										<option value="" selected>--판매량분류 선택--</option>
										<option value="salesRate_desc">판매량 많은순</option>
										<option value="salesRate_asc">판매량 적은순</option>
								</select> <select id="select4" name="orderHits">
										<option value="">--조회수분류 선택--</option>
										<option value="hits_desc">조회수 많은순</option>
										<option value="hits_asc">조회수 적은순</option>
								</select></td>
							</tr>
							<tr>
								<td colspan="7"><input type="button" value="검색" id="search_option" />&nbsp;&nbsp;<input type="reset" value="초기화" /></td>
							</tr>

						</table>
					</form>

					<hr>

					<form method="post" action="${contextPath }/admin/product/deleteProducts" id="frm_delete">
						<table border="1" style="border-color: #ddd #ddd #848484 #ddd; width: 100%;">
							<tr style="color: white;">
								<th>전체 선택&nbsp;<input type="checkbox" id="ck_all" /></th>
								<th>상품 코드</th>
								<th>상품 분류</th>
								<th>상품 구분</th>
								<th>상품명</th>
								<th>판매가</th>
								<th>판매량</th>
								<th>조회수</th>
								<th colspan="2">모델</th>
								<th>모델 추가</th>
							</tr>

							<c:choose>
								<c:when test="${empty productsList }">
									<h1>등록된 상품이 없습니다.</h1>
								</c:when>

								<c:when test="${ productsList !=null}">
									<c:forEach var="product" items="${productsList}">
										<tr style="text-align: center;">
											<td><input type="checkbox" name="checkRow" value="${product.proNum }" /></td>
											<td><a href="${contextPath }/product/productdetail?proNum=${product.proNum}">${product.proNum }</a></td>
											<td><a href="${contextPath }/product/productdetail?proNum=${product.proNum}">${product.proCategory }</a></td>
											<td><a href="${contextPath }/product/productdetail?proNum=${product.proNum}">${product.proStatus }</a></td>
											<c:choose>
												<c:when test="${product.proNum % 10 == 3}">
													<td style="border-bottom-color: #ffffff;"><img width="180px;" height="270px;" src="${contextPath}/thumbnails?proNum=${product.proNum}&fileName=${product.proImgfileName}"> <br>
														${product.proName }</td>
												</c:when>
												<c:when test="${product.proNum % 10 == 5}">
													<td style="border-bottom-color: black;"></td>
												</c:when>
												<c:otherwise>
													<td style="border-bottom-color: #ffffff;"></td>
												</c:otherwise>
											</c:choose>
											<td><a href="${contextPath }/product/viewDetailProduct?proNum=${product.proNum}"> <fmt:formatNumber value="${product.proPrice }" type="number" var="proPrice" /> ${proPrice }원 <br>
													${product.proSalesrate } % 할인
											</a></td>
											<td><a href="${contextPath }/product/productdetail?proNum=${product.proNum}">${product.proSold }</a></td>
											<td><a href="${contextPath }/product/productdetail?proNum=${product.proNum}">${product.proHits }</a></td>
											<td colspan="2" align="center"><c:choose>
													<c:when test="${empty productsList  }">
														<p>더 이상 등록된 모델이 없습니다</p>
													</c:when>
													<c:when test="${not empty productsList }">
														<ul>
															<li>
																<ul class="smallul">
																	<li><c:if test="${product.proColor == 1}">white /</c:if> <c:if test="${product.proColor == 2}">ivory /</c:if> <c:if test="${product.proColor == 3}">gray /</c:if> <c:if
																			test="${product.proColor == 4}">pink /</c:if> <c:if test="${product.proColor == 5}">yellow /</c:if> <c:if test="${product.proColor == 6}">mint /</c:if> <c:if
																			test="${product.proColor == 7}">green /</c:if> <c:if test="${product.proColor == 8}">purple /</c:if> <c:if test="${product.proColor == 9}">navy /</c:if> <c:if
																			test="${product.proColor == 11}">black /</c:if> <c:if test="${product.proColor == 12}">brown /</c:if> <c:if test="${product.proColor == 13}">orange /</c:if> <c:if
																			test="${product.proColor == 14}">blue /</c:if> <c:if test="${product.proColor == 15}">red /</c:if> <c:if test="${product.proColor == 16}">basic /</c:if></li>
																	<li><c:if test="${product.proSize == 1}">XS /</c:if> <c:if test="${product.proSize == 2}">S /</c:if> <c:if test="${product.proSize == 3}">M /</c:if> <c:if
																			test="${product.proSize == 4}">L /</c:if> <c:if test="${product.proSize == 5}">XL /</c:if></li>
																	<li>${product.proQuantity}개&nbsp;&nbsp;</li>
																</ul>
															</li>
														</ul>
													</c:when>
												</c:choose></td>
											<td><input type="button" value="모델 추가하기" onClick="upModel('${product.proNum}','${product.proCategory }','${product.proColor }','${product.proSize }')" /></td>
										</tr>
									</c:forEach>


								</c:when>
							</c:choose>

							<tr>
								<td colspan="11" style="text-align: left;"><input type="button" value="삭제하기" id="delete" /></td>
							</tr>

						</table>

						<c:if test="${selectedProducts !=null}">
							<c:choose>

								<c:when test="${selectedProducts >200 }">
									<c:forEach var="page" begin="1" end="20" step="1">
										<c:if test="${section >1 && page==1 }">
											<!--페이지번호가 1일때 pre나오게 하기 -->
											<a href="${contextPath }/admin/product/listProducts?section=${section-1}&pageNum=${(section-1)*20+1}">%nbsp; pre </a>
										</c:if>
										<a href="${contextPath }/admin/product/listProducts?section=${section}&pageNum=${page}">${(section-1)*20+page }</a>
										<c:if test="${page==10} }">
											<!--페이지수가 10일때 다음으로 next나오게 하기  -->
											<a href="${contextPath }/admin/product/listProducts?section=${section+1}&pageNum=${section*20+1}">&nbsp; next</a>
										</c:if>
									</c:forEach>
								</c:when>

								<c:when test="${selectedProducts==200 }">
									<c:forEach var="page" begin="1" end="20" step="1">
										<a href="#"> ${page } </a>
									</c:forEach>
								</c:when>

								<c:when test="${selectedProducts <200 }">
									<c:forEach var="page" begin="1" end="${selectedProducts/20+1 }" step="1">
										<c:choose>
											<c:when test="${page==pageNum }">
												<a class="sel-page"
													href="${contextPath }/admin/product/listProducts?
								section=${section}
								&pageNum=${page}
								&proName=${keyword}
								&proCategory=${proCategory}
								&orderPrice=${orderPrice}
								&orderSalesRate=${orderSalesRate}
								&orderHits=${orderHits}
								&proStatus=${proStatus}">
													${page} </a>
											</c:when>
											<c:otherwise>
												<a class="no-uline"
													href="${contextPath }/admin/product/listProducts?
								section=${section}
								&pageNum=${page}
								&proName=${keyword}
								&proCategory=${proCategory}
								&orderPrice=${orderPrice}
								&orderSalesRate=${orderSalesRate}
								&orderHits=${orderHits}
								&proStatus=${proStatus}">
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