<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<html>
<head>
<style>
@media ( min-width : 767.98px) {
	.card {
		margin-left: 300px;
		margin-right: 50px;
	}
}
</style>
<script
	src="${contextPath}/resources/admin/assets/libs/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script
	src="${contextPath}/resources/admin/assets/libs/popper.js/dist/umd/popper.min.js"></script>
<script
	src="${contextPath}/resources/admin/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script
	src="${contextPath}/resources/admin/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script
	src="${contextPath}/resources/admin/assets/extra-libs/sparkline/sparkline.js"></script>
<!--Wave Effects -->
<script src="${contextPath}/resources/admin/dist/js/waves.js"></script>
<!--Menu sidebar -->
<script src="${contextPath}/resources/admin/dist/js/sidebarmenu.js"></script>
<!--Custom JavaScript -->
<script src="${contextPath}/resources/admin/dist/js/custom.min.js"></script>
<!--This page JavaScript -->
<!-- <script src="dist/js/pages/dashboards/dashboard1.js"></script> -->
<!-- Charts js Files -->
<script
	src="${contextPath}/resources/admin/assets/libs/flot/excanvas.js"></script>
<script
	src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.js"></script>
<script
	src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.pie.js"></script>
<script
	src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.time.js"></script>
<script
	src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.stack.js"></script>
<script
	src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.crosshair.js"></script>
<script
	src="${contextPath}/resources/admin/assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
<script
	src="${contextPath}/resources/admin/dist/js/pages/chart/chart-page-init.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>새 상품 등록</title>
<style>
table {
	min-width: 100%;
	margin-top: 5%;
	/* margin-left: 20%; */
}

td {
	min-width: 150px;
	margin-bottom: 10px;
}

select {
	width: 298px; /* 원하는 너비설정 */
	padding: .4em .3em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%; /* 네이티브 화살표 대체 */
	border: 1px solid #999;
	border-radius: 0px; /* iOS 둥근모서리 제거 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

input {
	padding: .4em .3em;
	border: 1px solid #999;
	border-radius: 0px;
}

.b {
	min-width: 150px;
}

</style>
</head>
<script>
	function readURL(input, id) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				if (id == 'main') {
					$('#preview').attr('src', e.target.result);
				} else {
					$("#preview" + id).attr('src', e.target.result);
				}
			}

			reader.readAsDataURL(input.files[0]);
		}
	}
	var cnt = 1;
	function fn_addFile() {
		var state = cnt + 1;

		$("#detail_list").append(
				"디테일이미지 " + cnt + " : <input type='file' name= " + state
						+ " id='" + cnt
						+ "' onchange='readURL(this,this.id);' />" + "<br>");
		if (cnt % 2 != 0) {
			$("#image_list")
					.append(
							"<img src='#' width=200 height=200 id='preview"+cnt+"'> <br>");
		} else {
			$("#image_list").append(
					"<img src='#' width=200 height=200 id='preview"+cnt+"'>");
		}
		cnt++;
	}

	function backToList(obj) {
		obj.action = "${contextPath}/admin/product/listProducts";
		obj.submit();
	}

	/* pro_category_detail */
</script>
<script type="text/javascript">
	$(
			function() {

				$("#proNum").on(
						"click",
						function() {
							var category = $('#proCategory').val()
									+ $('#proColor').val()
									+ $('#proSize').val()
							$('#proNum').val(category)
						})
			})
</script>
<body>
	<div class="container-fluid">

		<div class="row">
			<!-- column -->
			<div class="col-12">
				<div class="card">

					<!--membersList  -->
					<form action="${contextPath }/admin/product/addNewProduct"
						method="post" enctype="multipart/form-data" id="frm_register">
						<center>
							<br> <br>
							<center>
								<h2>새 상품 등록창</h2>
							</center>
							<table style="min-width: 50%;">
								<tr>
									<td>상품 카테고리</td>
									<td><select name="proCategory" id="proCategory">
											<option value="1">반팔</option>
											<option value="2">긴팔</option>
											<option value="3">슬립리스</option>
											<option value="4">후드</option>
											<option value="5">셔츠</option>
											<option value="6">스웻셔츠</option>
									</select></td>
								</tr>
								<tr>
									<td>상품 이름</td>
									<td class="b"><input type="text" name="proName" size="39" />
									</td>
								</tr>
								<tr>
									<td>상품 구분</td>
									<td class="b"><select name="proStatus">
											<option value="신상" selected>신상</option>
											<option value="최고">최고</option>
											<option value="세일">세일</option>
											<option value="추천">추천</option>
											<option value="품절">품절</option>
									</select></td>
								</tr>
								<tr>
									<td>상품 가격</td>
									<td class="b"><input type="text" name="proPrice"
										id="proPrice" size="39" /></td>
								</tr>
								<tr>
									<td>상품 할인율</td>
									<td class="b"><input type="text" name="proSalesrate"
										id="proSalesrate" size="39" /> %</td>
								</tr>

								<tr>
									<td>상품 색상</td>
									<td class="b"><select name="proColor" id="proColor">
											<!-- 색상추가 일치시키기 -->
											<option value="01" selected>화이트</option>
											<option value="02">아이보리</option>
											<option value="03">그레이</option>
											<option value="04">핑크</option>
											<option value="05">옐로우</option>
											<option value="06">민트</option>
											<option value="07">그린</option>
											<option value="08">퍼플</option>
											<option value="09">네이비</option>
											<option value="11">블랙</option>
											<option value="12">브라운</option>
											<option value="13">오랜지</option>
											<option value="14">블루</option>
											<option value="15">레드</option>
											<option value="16">베이지</option>
									</select></td>
								</tr>
								<tr>
									<td>상품 사이즈</td>
									<td class="b"><select name="proSize" id="proSize">
											<option value="1">XS</option>
											<option value="2">S</option>
											<option value="3" selected>M</option>
											<option value="4">L</option>
											<option value="5">XL</option>

									</select></td>



								</tr>

								<tr>
									<td>판매 재고</td>
									<td class="b"><input type="text" name="proQuantity"
										size="39" /> 개</td>
								</tr>

								<tr>
									<td>상품 설명</td>
									<td class="b"><textarea rows="8" cols="39"
											name="proContent"></textarea></td>
								</tr>
								<tr>
									<td>메인 이미지 추가</td>
									<td class="b"><input type="file" value="메인 이미지 등록"
										id="main" name="1" onchange="readURL(this,this.id);" /> <input
										type="button" value="디테일 이미지 추가" onClick="fn_addFile()" /></td>
								</tr>
								<tr>
									<td>상품 이미지 등록</td>
									<td colspan="2">
										<div id="detail_list"></div>
										<div id="image_list">
											<img id="preview" src="#" width=200 height=200 />
										</div>

									</td>
								</tr>
								<tr>
									<td>상품 코드</td>
									<td class="b"><input type="text" id="proNum" name="proNum"
										size="39" readonly="readonly" placeholder="클릭하여 제품 번호 생성" /></td>
								</tr>
								<tr>
									<td colspan="4"><input type="submit" class="register"
										value="상품 등록하기" /> <input type="button" value="목록창으로 돌아가기"
										onClick="backToList(this.form)" /></td>
								</tr>
							</table>
						</center>
					</form>

					<!-- </div> -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>