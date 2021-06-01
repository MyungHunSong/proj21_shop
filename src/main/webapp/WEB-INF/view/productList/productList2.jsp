<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>옷 목록화면</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	var contextPath = "${contextPath}";
	$.get(contextPath + "/api/members",
	function(json){
		var dataLength = json.length;
		if(dataLength >= 1){
			var sCont = "";
			for(i = 0; i < dataLength; i++){
				sCont += "<div class='item'>";
				sCont += "<img src=" + json[i].proImagefilename + ">";
				sCont += "<div class='detail'>""
				sCont += "<div class='title'>""
				sCont += "<h2><em>"+json[i].proName+"</em></h2>"
				sCont +="<span class='price'>"+json[i].proPrice+"</span>"       
				sCont +="</div>"
				sCont +="<div class='info'>"
				sCont +="<div class='size'>"
		        sCont +="<label>Sizes</label>" 
		        sCont +="<span>XS</span><span>S</span><span>M</span><span>L</span><span>XL</span>"
		        sCont +="</div>"
		        sCont +="<div class='color'>"
		        sCont +="<label>Colors</label>"            
		        sCont +="<span></span><span></span><span></span><span></span><span></span>"           
		        sCont +="</div>"
		        sCont +="<span class='like'></span>"       
		        sCont +="</div>"
		        sCont +="<button class='add-cart'>Add to Cart</button>"
			    sCont +="</div>"
		        sCont +="</div>"
			}
			$("#load:last-child").append(sCont);
		}
	});
});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>








<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</body>
</html>