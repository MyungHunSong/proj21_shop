package proj21_shop.controller.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
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
	
	@GetMapping("/selectReviewByProNum/{proNum}")
	public ResponseEntity<Object> selectReviewByProNum(@PathVariable int proNum){
		return ResponseEntity.ok(service.selectReviewByProNum(proNum));
	}
	
	@GetMapping("/selectReviewReply/{reviewNo}")
	public ResponseEntity<Object> selectReviewReply(@PathVariable int reviewNo){
		return ResponseEntity.ok(service.selectReviewReply(reviewNo));
	}
	
	@PostMapping("/insertReviewReply")
	public ResponseEntity<Object> insertReviewReply(@RequestBody ReviewReplyDTO reviewReply){
		return ResponseEntity.ok(service.insertReviewReply(reviewReply));
	}
	
	@PatchMapping("/updateReviewReply/{reviewReplyNo}")
	public ResponseEntity<Object> updateReviewReply(@PathVariable int reviewReplyNo, @RequestBody ReviewReplyDTO reviewReply){
		return ResponseEntity.ok(service.updateReviewReply(reviewReply));
	}
	
	@DeleteMapping("/deleteReviewReply/{reviewReplyNo}")
	public ResponseEntity<Object> deleteReviewReply(@PathVariable int reviewReplyNo){
		return ResponseEntity.ok(service.deleteReviewReply(reviewReplyNo));
	}
	
}
