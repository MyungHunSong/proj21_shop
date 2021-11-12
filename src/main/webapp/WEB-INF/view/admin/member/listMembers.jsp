<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 사용할 객체 나열 -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="membersList" value="${membersMap.membersList }" />
<c:set var="totMembers" value="${membersMap.totMembers }" />
<c:set var="allMen" value="${membersMap.allMen }" />
<c:set var="allWomen" value="${membersMap.allWomen }" />

<c:set var="memberTotalBuy" value="${membersMap.memberTotalBuy }" />
<c:set var="memberTotalOrder" value="${membersMap.memberTotalOrder }" />
<c:set var="memberGender" value="${membersMap.memberGender }" />
<c:set var="keyword" value="${membersMap.keyword }" />

<c:set var="selectedMembers" value="${membersMap.selectedMembers }" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
@media ( min-width : 767.98px) {
	.card {
		margin-left: 300px;
		margin-right: 50px;
	}
}
</style>
<style type="text/css">
table {
	border-spacing: 30px;
}
tr {
	text-align: center;
}
th {
	padding: 5px 20px 5px 20px;
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
</style>
<title>회원정보 리스트</title>
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
<script>
	function member_search() {
		var memberTotalBuy = $('#memberTotalBuy').val();
		var memberTotalOrder = $('#memberTotalOrder').val();
		var memberGender = $('input:radio[name=memberGender]:checked').val();
		var keyword = $('#memberName').val();
		
		console.log(memberTotalBuy)
		console.log(memberTotalOrder)
		console.log(memberGender)
		console.log(keyword)
		
		$('#container').load('${contextPath}/admin/member/listMembers' ,{
			memberTotalBuy : memberTotalBuy,
			memberTotalOrder : memberTotalOrder,
			memberGender : memberGender,
			keyword : keyword
		});
	}
</script>
</head>
<body>
<section>
<div class="container-fluid">
	<div class="row">
	<!-- column -->
    	<div class="col-12">
	        <div class="card">
	            <div class="comment-widgets scrollable">
	            <br><br>
    <!--membersList  -->
	<h2>회원 목록</h2>
	<hr>
	<section>
	
	<!-- 어디 모델 -> 컨트롤러를 타고 왔나. -->
	<!-- Controller 경로 : proj21_shop.controller.admin.member/AdminMemberController -->
		<div id="listOrdersByStatus">
			<ul class="smallul">
				<li>회원&nbsp;<a href="${contextPath }/admin/member/listMembers">${totMembers }</a> 건|</li>
				<li>남성회원&nbsp;<a href="${contextPath }/admin/member/listMembers">${allWomen }</a>건 |</li>
				<li>여성회원&nbsp;<a href="${contextPath }/admin/member/listMembers">${allMen }</a>건 |</li>
			</ul>
		</div>
	</section>
	
	<br><br>
	
	<!-- Controller 경로:proj21_shop.controller.admin.member/AdminMemberControlle   -->
	<form action="${contextPath }/admin/membmer/listMembers" method="post" id="frm_search">
		<table>
			<tr>
				<td colspan="2">회원 검색&nbsp;&nbsp;</td>
				<td colspan="5" class="pleft">
					회원 이름 : <input type="text" name="memberName" placeholder="회원 이름을 입력하세요" id="memberName" />				
				 </td>
			</tr>
			<!-- Controller 경로 :  proj21_shop.controller.admin.member/AdminMemberController  -->
			<tr>
				<td colspan="2">회원성별 구분&nbsp;&nbsp;</td>
				<td colspan="5" class="pleft">
					<input type="radio" value="" name="memberGender" checked >전체
					<input type="radio" value="1" name="memberGender" >남성
					<input type="radio" value="0" name="memberGender" >여성
				</td>
			</tr>
			<tr>
			
				<td colspan="2">회원 분류&nbsp;&nbsp;</td>
				<td colspan="5" class="pleft">
					
					<select id="memberTotalBuy" name="memberTotalBuy">
						<option value="" selected>--총 결제금액 분류 선택--</option>
						<option value="total_buy_desc">결제금액 많은 순</option>
						<option value="total_buy_asc">결제금액 적은 순</option>
					</select>
					
					<select id="memberTotalOrder" name="memberTotalOrder">
						<option value="" selected>--총 결제횟수 분류 선택--</option>
						<option value="total_order_desc">결제횟수 많은 순</option>
						<option value="total_order_asc">결제횟수 적은 순</option>
					</select>
					
				 </td>
			</tr>
			<tr>
				<td colspan="7">
					<input type="button" value="검색" onClick="member_search()" />&nbsp;&nbsp;<input type="reset" value="초기화" />
					
				</td>
			</tr>
		</table>
	</form>
	<hr>
	
	<form>
			
	<table style="border-color: #ddd #ddd #848484 #ddd; width: 100%; border: 1; text-align: center;">
		<tr style="text-align: center; color: white;">
			<th>회원 아이디</th>
			<th>회원 이름</th>
			<th>회원 성별</th>
			<th>총 결제금액</th>
			<th>총 결제횟수</th>
			<th>회원 가입날짜</th>
		</tr>
		
		<c:choose>
			<c:when test="${membersList ==null}">   <!-- 등록된 회원이 없을때  -->
				<h1>등록된 회원이 없습니다.</h1> 
			</c:when>
			<c:when test="${membersList !=null}"> <!-- 등록된 회원이 있을때 -->
				<c:forEach var="member" items="${membersList }">
					<tr style="text-align: center;">
						<td><a href="${contextPath }/admin/member/viewMember?memberId=${member.memberId}" style="">${member.memberId }</a></td>
						<td><a href="${contextPath }/admin/member/viewMember?memberId=${member.memberId}">${member.memberName }</a></td>
						<td>${member.memberGender }</td>
						<td><fmt:formatNumber value="${member.memberTotalBuy }" type="number" /> 원</td>
						<td>${member.memberTotalOrder } 회</td>
						<td>${member.memberCreDate }</td>
					</tr> 
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<br>
	</form>
   </div>
  </div>
    <!-- column -->
    </div>
            <!-- ============================================================== -->
            <!-- Recent comment and chats -->
            <!-- ============================================================== -->
    </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
           
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
	</div>
</section>
</body>
</html>