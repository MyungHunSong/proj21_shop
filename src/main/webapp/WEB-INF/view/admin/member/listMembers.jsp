<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="membersList" value="${membersMap.membersList }" />
<c:set var="totMembers" value="${membersMap.totMembers }" />
<c:set var="allMen" value="${membersMap.allMen }" />
<c:set var="allWomen" value="${membersMap.allWomen }" />

<c:set var="order_total_buy" value="${membersMap.order_total_buy }" />
<c:set var="order_total_order" value="${membersMap.order_total_order }" />
<c:set var="member_gender" value="${membersMap.member_gender }" />
<c:set var="keyword" value="${membersMap.keyword }" />

<c:set var="selectedMembers" value="${membersMap.selectedMembers }" />

<!DOCTYPE html>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${contextPath}/resources/admin/dist/js/custom.min.js"></script>
<script src="${contextPath}/resources/admin/dist/js/sidebarmenu.js"></script>
<script>
	function member_search() {

		var order_total_buy = $('#order_total_buy').val();
		var order_total_order = $('#order_total_order').val();
		var member_gender = $('input:radio[name=member_gender]:checked').val();
		var keyword = $('#member_name').val();

		$('#container').load('${contextPath}/admin/member/listMembers', {
			order_total_buy : order_total_buy,
			order_total_order : order_total_order,
			member_gender : member_gender,
			keyword : keyword
		});

	}
</script>
</head>
<body>
<section>
<div class="container-fluid">
${memberList }
${totMembers }
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
		<div id="listOrdersByStatus">
			<ul class="smallul">
				<li>회원&nbsp;<a href="${contextPath }/admin/member/listMembers">${allMember }</a> 건|</li>
				<li>남성회원&nbsp;<a href="${contextPath }/admin/member/listMembers">${allMen }</a>건 |</li>
				<li>여성회원&nbsp;<a href="${contextPath }/admin/member/listMembers">${allWomen }</a>건 |</li>
			</ul>
		</div>
	</section>
	<br><br>
	<form action="${contextPath }/admin/membmer/listMembers" method="post" id="frm_search">
		<table>
			<tr>
				<td colspan="2">회원 검색&nbsp;&nbsp;</td>
				<td colspan="5" class="pleft">
					회원 이름 : <input type="text" name="member_name" placeholder="회원 이름을 입력하세요" id="member_name" />				
				 </td>
			</tr>
			<tr>
				<td colspan="2">회원성별 구분&nbsp;&nbsp;</td>
				<td colspan="5" class="pleft">
					<input type="radio" value="all" name="member_gender" checked >전체
					<input type="radio" value="남자" name="member_gender" >남성
					<input type="radio" value="여자" name="member_gender" >여성
				 </td>
			</tr>
			<tr>
				<td colspan="2">회원 분류&nbsp;&nbsp;</td>
				<td colspan="5" class="pleft">
					
					<select id="order_total_buy" name="order_total_buy">
						<option value="" selected>--총 결제금액 분류 선택--</option>
						<option value="total_buy_desc">결제금액 많은 순</option>
						<option value="total_buy_asc">결제금액 적은 순</option>
					</select>
					
					<select id="order_total_order" name="order_total_order">
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
						<td><a href="${contextPath }/admin/member/viewMember?member_code=${member.member_code}" style="">${member.member_id }</a></td>
						<td><a href="${contextPath }/admin/member/viewMember?member_code=${member.member_code}">${member.member_name }</a></td>
						<td>${member.member_gender }</td>
						<td><fmt:formatNumber value="${member.member_total_buy }" type="number" /> 원</td>
						<td>${member.member_total_order } 회</td>
						<td>${member.member_lately_date }</td>
						<td>${member.member_cre_date }</td>
					</tr> 
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<br>
	 	<c:if test="${totMembers !=null}">
		<c:choose>
			<c:when test="${selectedMembers >200 }">
		<c:forEach var="page" begin="1" end="20" step="1">
			<c:if test="${section >1 && page==1 }"> <!--페이지번호가 1일때 pre나오게 하기 -->
				<a href="${contextPath }/admin/member/listMembers?section=${section-1}&pageNum=${(section-1)*20+1}">%nbsp; pre </a>
			</c:if>
				<a href="${contextPath }/admin/member/listMembers?section=${section}&pageNum=${page}">${(section-1)*20+page }</a>
			<c:if test="${page==10} }"><!--페이지수가 10일때 다음으로 next나오게 하기  -->
				<a href="${contextPath }/admin/member/listMembers?section=${section+1}&pageNum=${section*20+1}">&nbsp; next</a>
			</c:if>	
			
		</c:forEach>
		</c:when>
		<c:when test="${selectedMembers==200 }">
			<c:forEach var="page" begin="1" end="20" step="1">
				<a href="#">${page }</a>
			</c:forEach>
		</c:when>
		
		<c:when test="${selectedMembers <200 }">
			<c:forEach var="page" begin="1" end="${selectedMembers/20+1 }" step="1">
				<c:choose>
					<c:when test="${page==pageNum }">
						<a class="sel-page" href="${contextPath }/admin/member/listMembers?
						section=${section}
						&pageNum=${page}
						&order_lately_date=${order_lately_date}
						&order_total_buy=${order_total_buy}
						&order_total_order=${order_total_order}
						&member_gender=${member_gender}
						&keyword=${keyword}"
						>${page }</a>
					</c:when>
					<c:otherwise>
						<a class="no-uline" href="${contextPath }/admin/member/listMembers?
						section=${section}
						&pageNum=${page}
						&order_lately_date=${order_lately_date}
						&order_total_buy=${order_total_buy}
						&order_total_order=${order_total_order}
						&member_gender=${member_gender}
						&keyword=${keyword}">${page }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:when>
	</c:choose>
	</c:if>
                    
       
	  
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