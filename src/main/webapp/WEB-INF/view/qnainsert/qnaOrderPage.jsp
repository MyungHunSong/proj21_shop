<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 주문 상세 내역 페이지</title>
<link rel="stylesheet" href="${contextPath}/resources/qna/css/qnaOrderPage.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
#bodySec td{
	border-bottom: 1px solid gray;

}
</style>
<script type="text/javascript">
 $(function() {
    var contextPath = "${contextPath}";
    var memberid = "${authInfo.id}";
    var sCont = "";
    $.get(contextPath + "/api/qnaMyOrder/" + memberid, function(json) {
    	
       var dataLengths = json.length;
       if (dataLengths >= 1) {
          for (j = 0; j < dataLengths; j++) {
          	console.log(json);
             var dataLength = json[j].productDTO.length;
             console.log(json[j].productDTO.length)
             
             if (dataLength >= 1) {
                
                for (i = 0; i < dataLength; i++) {
                   sCont += "<tr id ='bodySec'>";                   
                   sCont += "<td class = 'clickThis' style='cursor: pointer;'>" + json[j].orderProNum + "-" + json[j].productDTO[i].orderCode[0].orderCode + "</td>"
                   sCont += "<input type = 'hidden' value = "+ json[j].productDTO[i].orderCode[0].orderCode+">";
                   sCont += "<td><a >"+json[j].productDTO[i].proName +"</a></td>";                   
                   sCont += "<td><a >"+ json[j].orderDate+"</a></td>";                   
                   sCont += "<td><a>"+ json[j].orderProQuantity+"</a></td>";                   
                   sCont += "<td><a>"+ json[j].orderPrice+"</a></td>";
                   sCont += "<td><a>" + json[j].deliveryStatus+"</a></td>";              
                   sCont += "<tr>";     
                }          
             } 
          }
          console.log(sCont)
          $("#load").append(sCont);
       }
	    $('.clickThis').on('click',function(){
	 	  var orderNum = $(this).next().val();
	 	  console.log(orderNum);
	 	  
	 	  $("input[name=MyOrder]", opener.document).val(orderNum);	 	   
	 	   window.opener.num = orderNum;

	 	  
	 	   window.open("about:blank", "_self").close(); 
	    });
    });     
});

</script>
</head>
<body>
	 <div class="container">
      <section id="orderArea">
         <h3 style="text-align: center;">나의 주문내역</h3>

         <div class="asd">
         <table class="type11" 
         	style="border-spacing: 1px; 
					width: 600px;
					height:200px">
            <thead style="background-color: gray;">
               <tr >
                  <th scope="cols">주문번호</th>
                  <th scope="cols">제품정보</th>
                  <th scope="cols">주문일자</th>
                  <th scope="cols">주문수량</th>
                  <th scope="cols">주문금액</th>
                  <th scope="cols">주문상태</th>
               </tr>
            </thead>
             <tbody id="load" style="background-color: #f4f4f4;"></tbody>
         </table>
         </div>
      </section>
 
   </div>
</body>
</html>