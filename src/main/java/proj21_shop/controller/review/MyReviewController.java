package proj21_shop.controller.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import proj21_shop.service.review.MyReviewService;

@RestController
@RequestMapping("/api")
public class MyReviewController {
	
	@Autowired
	private MyReviewService service;
	
	@GetMapping("/myreview/{memberId}")
	public ResponseEntity<Object> myreview(@RequestParam(value = "memberId", required = false) String memberId){
		return ResponseEntity.ok(service.selectReviewByMember(memberId));
	}
	
	
}
