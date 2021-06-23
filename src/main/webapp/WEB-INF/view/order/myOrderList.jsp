<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
   $(function() {
      var contextPath = "${contextPath}";
      var memberId = "${memberId}";
      var sCont = "";
      $.get(contextPath + "/api/myorder/" + memberId, function(json) {
         var dataLengths = json.length;
         if (dataLengths >= 1) {
            for (j = 0; j < dataLengths; j++) {
            	console.log(json);
               var dataLength = json[j].productDTO.length;
               console.log(json[j].productDTO.length)
               
               if (dataLength >= 1) {
                  
                  for (i = 0; i < dataLength; i++) {
                     sCont += "<tr>";
                     sCont += "<td><a href='detailorder?memberId="
                           + json[j].memberId + "&orderProNum=" + json[j].orderProNum + "&proNum="
                           + json[j].productDTO[i].proNum + "'>"
                           + json[j].orderProNum + "</a>"
                           
                     sCont += "<td>" + json[j].productDTO[i].proName +"</td>";
                     sCont += "<td>" + json[j].orderDate+"</td>";
                     sCont += "<td>" + json[j].orderProQuantity+"</td>";
                     sCont += "<td>" + json[j].orderPrice+"</td>";
                     sCont += "<td>" + json[j].deliveryStatus+"</td>";
                     sCont += "<tr>";
                     
                  }
                  
               }
               
            }
            console.log(sCont)
            $("#load").append(sCont);
         }
         
      })
   })
</script>
<link rel="stylesheet"
   href="/proj21_shop/resources/order/css/myOrderList.css" />
</head>
<body>
   <div class="container">
      <jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
      <jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
      <section id="orderArea">
         <h3>나의 주문내역</h3>
         <div class="asd">
         <table class="type11">
            <thead>
               <tr>
                  <th scope="cols">주문번호</th>
                  <th scope="cols">제품정보</th>
                  <th scope="cols">주문일자</th>
                  <th scope="cols">주문수량</th>
                  <th scope="cols">주문금액</th>
                  <th scope="cols">주문상태</th>
               </tr>
            </thead>
            <tbody id="load"></tbody>
         </table>
         </div>
      </section>
      <jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
   </div>
</body>
</html>