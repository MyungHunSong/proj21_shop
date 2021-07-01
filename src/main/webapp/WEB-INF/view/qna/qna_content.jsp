<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 내용</title>
<link rel="stylesheet" href="${contextPath }/resources/qna/css/qna_content.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function exit(){
	   self.close();
	}
	$(function(){
		var contextPath = "${contextPath}";
		var qMember = "${qMember}";
		var qIndex = "${qIndex}";
		$.get(contextPath + "/api/myqnacontent/" + "/" + qMember + "/" + qIndex, function(json){
			console.log(json);
			var sCont = "";
			sCont += "<h4>문의제목 : " + json[0].qTitle + "</h4>" ;
			sCont += "<textarea id='reviewContent' cols='45' rows='10' readonly>"+json[0].qContent+"</textarea><br>";
			$("#load").append(sCont);

		})

	})
</script>
</head>
<body>
	<h1>Q&A 내용</h1>
	<div id = "load"></div>
	<input type= 'button' onclick='exit()' value='취소' id="button">
</body>
</html>