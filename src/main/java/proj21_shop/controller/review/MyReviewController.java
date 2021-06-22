package proj21_shop.controller.review;

import java.net.URI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_shop.dto.order.OrderDTO;
import proj21_shop.dto.review.ReviewDTO;
import proj21_shop.exception.DuplicateReviewException;
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
	public ResponseEntity<Object> myqna(@PathVariable String memberId) {
		return ResponseEntity.ok(service.selectQnaByMember(memberId));
	}

	@GetMapping("/detailreview/{memberId}/{proNum}")
	public ResponseEntity<Object> mydetailreview(@PathVariable String memberId, @PathVariable int proNum) {
		ReviewDTO reviewDTO = new ReviewDTO();
		reviewDTO.setMemberId(memberId);
		reviewDTO.setProNum(proNum);
		if (service.selectDetailReviewByMember(reviewDTO).isEmpty()) {
			OrderDTO orderDTO = new OrderDTO();
			orderDTO.setMemberId(memberId);
			orderDTO.setProNum(proNum);
			return ResponseEntity.ok(service.selectProductDetailByMember(orderDTO));
		} else {
			return ResponseEntity.ok(service.selectDetailReviewByMember(reviewDTO));
		}

	}

	@PostMapping("/myreview/")
	public ResponseEntity<Object> newReview(@RequestBody ReviewDTO review){
		System.out.println("newReview>"+review);
		try {
			service.insertReview(review);
			URI uri = URI.create("/api/myreview/"+review.getMemberId());
			return ResponseEntity.created(uri).body(review.getMemberId());
		}catch (DuplicateReviewException e) {
			return ResponseEntity.status(HttpStatus.CONFLICT).build();
		}
	}
}