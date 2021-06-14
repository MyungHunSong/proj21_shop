package proj21_shop.controller.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import proj21_shop.service.review.MyReviewService;

@RestController
@RequestMapping("/api")
public class MyReviewController {

	@Autowired
	private MyReviewService service;

	// @PathVariable => 경로를 변수화 해주는 어노테이션.
	@GetMapping("/myreview/{memberId}")
	public ResponseEntity<Object> myreview(@PathVariable String memberId) {
		return ResponseEntity.ok(service.selectReviewByMember(memberId));
	}
	
	@GetMapping("/myqna/{memberId}")
	public ResponseEntity<Object> myqna(@PathVariable String memberId){
		return ResponseEntity.ok(service.selectQnaByMember(memberId));
	}
	
	@GetMapping("/detailreview/{memberId}")
	public ResponseEntity<Object> mydetailreview(@PathVariable String memberId){
		return ResponseEntity.ok(service.selectDetailReviewByMember(memberId));
	}
	
} 