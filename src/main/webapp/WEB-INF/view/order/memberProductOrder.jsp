<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />     
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/proj21_shop/resources/main/css/main.css">
<link rel="stylesheet" href="${contextPath }/resources/order/css/memberProductCart.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>상품 구매 페이지</title>
</head>
<body>
<div class="container">
<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>

	<form name="orderform" id="orderform" method="post" class="orderform" action="/Page" onsubmit="return false;">
            <input type="hidden" name="cmd" value="order">
            <div class="basketdiv" id="basket">
                <div class="row head">
                    <div class="subdiv">
                        <div class="check">번호</div>
                        <div class="img">이미지</div>
                        <div class="pname">상품명(사이즈)</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">적립금</div>
                        <div class="num">수량</div>
                        <div class="sum">가격</div>
                    </div>
                    <div class="subdiv">
                    </div>
                    <div class="split"></div>
                </div>
        	<div class="load_row_data">
            </div>
    		</div>

            <div class="right-align basketrowcmd">
            </div>
    
            <div class="bigtext right-align sumcount" id="sum_p_num">상품개수: 0개</div>
            <div class="bigtext right-align box summoney" id="sum_p_price">합계금액: 0원</div>
    
            <div id="goorder">
                <div class="clear"></div>
                <div class="buttongroup center-align cmd">
                    <a class = "orderBtn">선택한 상품 주문</a>
                </div>
            </div>
        </form>
        
<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</div>
</body>
</html>