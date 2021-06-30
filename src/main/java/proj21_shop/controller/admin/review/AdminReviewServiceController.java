package proj21_shop.controller.admin.review;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
