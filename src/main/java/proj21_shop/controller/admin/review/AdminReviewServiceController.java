package proj21_shop.controller.admin.review;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_shop.service.admin.review.AdminReviewService;

@RestController
@RequestMapping("/api")
public class AdminReviewServiceController {

	@Autowired
	private AdminReviewService service;
	
	@GetMapping("/listReviews2/{section}/{pageNum}/{memberId}/{proNum}")
	public ResponseEntity<Object> listReviews(@PathVariable int section, @PathVariable int pageNum, @PathVariable String memberId, @PathVariable int proNum){
		HashMap<String, Object> pagingMap = new HashMap<String, Object>();
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("memberId", memberId);
		pagingMap.put("proNum", proNum);
		return ResponseEntity.ok(service.listReviews(pagingMap));
	}
}
