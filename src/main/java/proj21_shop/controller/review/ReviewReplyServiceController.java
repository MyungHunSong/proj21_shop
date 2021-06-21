package proj21_shop.controller.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_shop.dto.review.ReviewReplyDTO;
import proj21_shop.service.review.ReviewReplyService;

@RestController
@RequestMapping("/api")
public class ReviewReplyServiceController {

	@Autowired
	private ReviewReplyService service;
	
	@GetMapping("/selectMaxReRepNum")
	public ResponseEntity<Object> selectMaxReRepNum(){
		return ResponseEntity.ok(service.selectMaxReRepNum());
	}
	
	/* 후기 목록 */
	@GetMapping("/selectReviewByProNum/{proNum}")
	public ResponseEntity<Object> selectReviewByProNum(@PathVariable int proNum){
		return ResponseEntity.ok(service.selectReviewByProNum(proNum));
	}
	
	/* 후기하나에 댓글 목록 */
	@GetMapping("/selectReviewReply/{reviewNo}")
	public ResponseEntity<Object> selectReviewReply(@PathVariable int reviewNo){
		return ResponseEntity.ok(service.selectReviewReply(reviewNo));
	}
	
	/* 댓글 추가 */
	@PostMapping("/insertReviewReply")
	public ResponseEntity<Object> insertReviewReply(@RequestBody ReviewReplyDTO reviewReply){
		return ResponseEntity.ok(service.insertReviewReply(reviewReply));
	}
	
	/* 댓글 수정 */
	@PatchMapping("/updateReviewReply/{reviewReplyNo}")
	public ResponseEntity<Object> updateReviewReply(@PathVariable int reviewReplyNo, @RequestBody ReviewReplyDTO reviewReply){
		return ResponseEntity.ok(service.updateReviewReply(reviewReply));
	}
	
	/* 댓글 삭제 */
	@PostMapping("/deleteReviewReply")
	public ResponseEntity<Object> deleteReviewReply(@RequestBody ReviewReplyDTO reviewReply){
		System.out.println(reviewReply);
		return ResponseEntity.ok(service.deleteReviewReply(reviewReply));
	}
	
}
