<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타일 후기 작성</title>
<script src = "https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$(".stars .fa").click(function(){
		$(this).addClass("active");
		$(this).prevAll().addClass("active");
		$(this).nextAll().removeClass("active");
		
		var starRate = $(this).index() + 1;
		/* $('.print').text(starRate); */
		var notice = ['별로에요', '보통이에요', '그냥 그래요', '맘에 들어요', '아주 좋아요'];
		$('.print').html('<img src="images/star-lv' +starRate + '.png">' + notice[starRate-1]);
		
	/* 	if(starRate == 1){
			$('.print').html('<img src="images/star-lv1.png">' + '별로에요');
		}else if(starRate == 2){
			$('.print').html('<img src="images/star-lv2.png">' + '보통 이에요');
		}else if(starRate == 3){
			$('.print').html('<img src="images/star-lv3.png">' + '그냥 그래요');
		}else if(starRate == 4){
			$('.print').html('<img src="images/star-lv4.png">' + '맘에 들어요');
		}else{
			$('.print').html('<img src="images/star-lv5.png">' + '아주 좋아요');
		} */
	})
});
</script>
<link rel = "stylesheet" href="css/review/review.css"/>
</head>
<body>
	<h2>스타일 후기 작성</h2>
	<img src="images/product.jpg" width="60" height="60" alt="">제품명<br>
	<div class="star-rating">
		<div class="stars">
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
		</div>
		<div class="print">별점을 매겨주세요</div>
	</div>
	<textarea rows="5" cols="50" name= "review" id="review" placeholder="상품에 대한 평가를 20자 이상 작성해 주세요"></textarea><br>
	<input name="BOARD_FILE" type="file" id="BOARD_FILE"/><br>
	<input name="BOARD_FILE" type="file" id="BOARD_FILE"/><br>
	<input type="submit" value="등록" id="reviewButton"/><br>
</body>
</html>