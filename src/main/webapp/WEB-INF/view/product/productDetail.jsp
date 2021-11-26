<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세정보</title>
<link rel="stylesheet" href="${contextPath }/resources/main/css/main.css">
<link rel="stylesheet" href="${contextPath }/resources/product/css/productDetail.css">
<link rel="stylesheet" href="${contextPath }/resources/product/css/star.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
// 제이쿼리 시작
$(function() {
			var contextPath = "${contextPath}";
			var proNum = ${proNum};
			var memberId = "${authInfo.id }";
			var proSize = ["0","XS","S","M","L","XL"];
			var proColor =["0","white", "ivory", "gray", "pink", "yellow", "mint", "green", "purple", "navy", "10", "black", "brown", "orange", "blue", "red", "basic"];
			var num = 0;
			 /*스타일 후기 보기*/
			 var notice = [ '별로에요', '보통이에요', '그냥 그래요', '맘에 들어요','아주 좋아요' ];
			 var  sCont = "";	
			
			/*제품별 후기 검색*/
			$.get(contextPath + "/api/selectReviewByProNum/"+ proNum, 
				function(json){
					if(json.length != 0){
						for(i = 0; i < json.length; i++){
								sCont += "<div class = 'reviewMembers'>"
								sCont += "<hr style='border-radius: 10%; border-style: dashed; color: #ccc'>"
								sCont += "			<h1 class = 'memberId'>ID : " + json[i].memberId +"</h1>" 
								sCont += "		<div class='starRate'>"
								sCont += "			<div class='star-rating'>"
								sCont += "				<div class='stars'>"
								if(json[i].reviewStar != 0){
									for(j = 1; j < json[i].reviewStar+1; j++){
										$('.print').html('<img src="images/star-lv' +j + '.png">' + notice[j-1]);
										sCont += "<i class='s"+j+" fa fa-star active'></i>"	
									}
									for(j = 1; j < 5-json[i].reviewStar+1; j++){
										sCont += "<i class='s"+j+" fa fa-star'></i>"
									}
								}
								sCont += "					<div class='print'></div>"
								sCont += "					</div>"
								sCont += "				</div>"
								sCont += "			</div>"
								sCont += "		<div class = 'reviewList'>"
								sCont += "			<img class = 'prodImg' src='${contextPath}/resources/product/images/" + json[i].proImagefilename.proImagefilename + "' width = '70'>"
								sCont += "				<div class = 'proAndMemInfo'>"
								sCont += "					<span>" + json[i].proName.proName+"</span><br>"
								sCont += "					<span>"+proColor[json[i].proName.proColor] +"/"+proSize[json[i].proName.proSize]+ "</span><br>"
								sCont += "				</div>"
								sCont += "			<div class = 'reivewContent'>"+json[i].reviewContent+"</div><br>";	
								sCont += "			<div class = 'reviewImg'>"
								if(json[i].reviewImagefilename1 == null || json[i].reviewImagefilename1 == ""){
									json[i].reviewImagefilename1 = "noimage.jpg" 
								}
									sCont += "				<img src='${contextPath}/resources/review/images/" + json[i].reviewImagefilename1 + "'>"
								if(json[i].reviewImagefilename2 == null || json[i].reviewImagefilename2 == ""){
									json[i].reviewImagefilename2 = "noimage.jpg" 
								}
									sCont += "			<img src='${contextPath}/resources/review/images/" + json[i].reviewImagefilename2 + "' width = '70'>"
								sCont += "			</div>"
								sCont += "		</div>"
								sCont += "		<div class='replyGroup'>"
								sCont += "			<input type= 'hidden' class = 'rno' name= 'rno' value="+json[i].reviewNum+"/>"
								sCont += "			<input type= 'text' class= 'replyContent' name='replyContent' placeholder='내용을 입력하세요.'>"
								sCont += "	    	<button class = 'commentInsertBtn' name='commentInsertBtn'>댓글</button>"
								sCont += "		</div>"
								
								<!-- (댓글시 보이는 테이블) 리뷰가 1개 이상이면 보일 테이블 -->
								if(json[i].reviewReplys[0].reRepNum != 0){
									for(j = 0; j < json[i].reviewReplys.length; j++){
										sCont += "<div class='commentArea'>"
										sCont += "		<div class='commentUser'>"+json[i].reviewReplys[j].reRepMember+"</div>"
										sCont += "		<div class='commentContentAndBtns'>"
										sCont += "			<div class='commentContent'>"+json[i].reviewReplys[j].reRepContent +"</div>"
										sCont += "			<div class='commentBtns'>"
										sCont += "				<input type= 'hidden' class = 'rrno' name= 'rrno' value="+json[i].reviewReplys[j].reRepNum+"/>"
										sCont += "				<button class='commentBtn updateBtn'>수정</button>"
										sCont += "				<button class='commentBtn deleteBtn'>삭제</button>"
										sCont += "			</div>"
										sCont += "		</div>"
										sCont += "</div>"
									}
								}
								sCont += "</div>"
						 }
						<!-- 아니면 이게 뜨도록 -->
					}else{                                                                                                                                      
							$('.star-rating').text("")
							sCont += "<p class = 'noReview'>후기가 없습니다.</p>" 
					}
					$("#productReview").append(sCont);
					
					
					/* 댓글 등록 버튼 클릭 */
					$('.commentInsertBtn').on("click",function(){
						var pReviewNum = $(this).prev().prev().val();
						
						/*댓글을 달 후기 번호*/
						var useNum = pReviewNum.substring(0,pReviewNum.length-1)
						var replyContent = $(this).prev().val()
						var reRepNum = $(this).parent().parent().children('.updateMem').children().next().children('.commentBtns').children().val()+"";
						var useReRepNum = reRepNum.substring(0,reRepNum.length-1)
						
						var reply = {
							  "reNum" : useNum,
							  "reRepMember" : memberId,
							  "reRepContent" : replyContent
						}
						
						var reviewReply = {
							  "reRepNum"  : useReRepNum,
							  "reRepMember" : memberId,
							  "reRepContent" : replyContent
						}
						
						if($(this).text() == '댓글'){
							insertReviewReply(reply);
							var sCont = "";
							sCont += "<div class='commentArea'>"
							sCont += "		<div class='commentUser'>"+memberId+"</div>"
							sCont += "		<div class='commentContentAndBtns'>"
							sCont += "			<div class='commentContent'>"+replyContent +"</div>"
							sCont += "			<div class='commentBtns'>"
							sCont += "				<input type= 'hidden' class = 'rrno' name= 'rrno' value="+maxNum+"/>"
							sCont += "				<button class='commentBtn updateBtn'>수정</button>"
							sCont += "				<button class='commentBtn deleteBtn'>삭제</button>"
							sCont += "			</div>"
							sCont += "		</div>"
							sCont += "</div>"
							$(this).parent().before(sCont);
							$(this).prev().val('')
							
						}else if($(this).text() == '수정'){
							updateReviewReply(reviewReply)
							
							/*replyContent의 value값*/
							$(this).prev().val()
							
							/*수정 버튼을 누르면 형제중에 updateMem이 생기고 그걸 찾는다.*/
							$(this).parent().parent().children('.updateMem').children().next().children('.commentContent').text($(this).prev().val())
							$(this).text('댓글')
							$(this).prev().val('')
							$(this).parent().parent().children().removeClass('updateMem')
							alert("수정완료하였습니다.")
						}
						
					})
					/* 수정버튼 클릭시 */
					$('.updateBtn').on('click',function(){
						var useNum = $(this).prev().val()
						var reRepNum = useNum.substring(0, useNum.length-1)
						var replyContent = $(this).parent().parent().parent().next().children().next().val()
						var commentInsertBtn = $(this).parent().parent().parent().parent().next().children().next().next().text()
						var id = $(this).parent().parent().prev().text()
						if(id == memberId){
							
							/*댓글 옆 수정버튼을 누르면 댓글버튼이 수정으로 이름이 바뀐다.*/
							$(this).parent().parent().parent().parent().children('.replyGroup').children('.replyContent').next().text('수정')
							
							/*세팅되는 곳 '.replyContent' , ()안은 세팅 할 값*/
							$(this).parent().parent().parent().parent().children('.replyGroup').children('.replyContent').val($(this).parent().prev().text())
							
							/*수정 버튼 누르면 class 생성*/
							$(this).parent().parent().parent().addClass('updateMem')
							
						}else{
							alert('자신의 글만 수정할 수 있습니다.')
						}
					})
					
					/* 삭제버튼 클릭시 */
					$('.deleteBtn').on('click',function(){
						var useNum = $(this).prev().prev().val()
						var reRepNum = useNum.substring(0, useNum.length-1)
						var delItem = {
								"reRepMember" :	memberId,
								"reRepNum" : reRepNum
						}
						deleteReviewReply(delItem)
						var id = $(this).parent().parent().prev().text()
						if(id == memberId){
							$(this).parent().parent().parent().remove()
						}else{
							alert("자신이 쓴 글만 삭제 하실수 있습니다. ")
						}
					})
					
				})
				
				/* 댓글 인서트 */
				function insertReviewReply(reply){
					
					$.ajax({
						url : contextPath + '/api/insertReviewReply',
						type: 'Post' ,
						contentType : "application/json; charset=utf-8",
						datatype : "json",
						data: JSON.stringify(reply),
						success: function(res){
							window.location.reload()
						},
						error:function(request, status, error){
							console.log(request)
							alert(status);
							/* alert("code:"+request.status+"\n"+"message:"
					                  +request.responseText+"\n"+"error:"+error); */
						}
					})
				}//insertReviewReply
				
				/* 댓글 업데이트 */
				function updateReviewReply(reviewReply){
					$.ajax({
						url : contextPath + '/api/updateReviewReply/'+reviewReply.reRepNum,
						type: 'Patch' ,
						contentType : "application/json; charset=utf-8",
						datatype : "json",
						data: JSON.stringify(reviewReply),
						success: function(res){
							console.log(reviewReply)
							/* window.location.reload() */
						},
						error:function(request, status, error){
							console.log(request)
							alert(status);
							alert("code:"+request.status+"\n"+"message:"
					                  +request.responseText+"\n"+"error:"+error); 
						}
					})
				} 
				
				/* 댓글 삭제 */
				function deleteReviewReply(delItem){
					console.log(delItem)
					$.ajax({
						url : contextPath + '/api/deleteReviewReply',
						type: 'Post' ,
						contentType : "application/json; charset=utf-8",
						datatype : "json",
						data: JSON.stringify(delItem),
						success: function(res){
							/* alert(res) */
						},
						error:function(request, status, error){
							/* alert(status); */
							/* alert("code:"+request.status+"\n"+"message:"
					                  +request.responseText+"\n"+"error:"+error); */
						}
					})
				}
				
				
})

</script>
</head>
<body>

<div class="container">
<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/product/productDetailItem.jsp"></jsp:include>
		<section id="productDetailImg"></section>
		<section id="productReview">
			<p class="menuTitle">REVIEW</p>
		</section>
<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</div>
</body>
</html>









