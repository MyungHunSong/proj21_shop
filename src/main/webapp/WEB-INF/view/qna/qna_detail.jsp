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
<title>상세내용 & 답글페이지</title>
<script type="text/javascript">
	$(function(){
		var contextPath = "${contextPath}";
		var idx = ${qIndex};
		var q
		
		$.get(
				contextPath + "/api/qna_detail/" + idx,
					function(json){
					var sCont = "";
						
						
					 	sCont += "<p>" + "${qDetail.qContent}  " + "${qDetail.qFile}  "+ "${qDetail.qDate}  " + "</p>";
						
					 	
				
					$("#load").append(sCont);
		});
	});
</script>
</head>
<body>
	<div id='load'></div>
</body>
</html>