package proj21_shop.controller.review;

import java.io.File;
import java.net.URI;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

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
		/* System.out.println("newReview>"+review); */
		try {
			service.insertReview(review);
			URI uri = URI.create("/api/myreview/"+review.getMemberId());
			return ResponseEntity.created(uri).body(review.getMemberId());
		}catch (DuplicateReviewException e) {
			return ResponseEntity.status(HttpStatus.CONFLICT).build();
		}
	}
	
	@PutMapping("/myreview/{reviewNum}")
	public ResponseEntity<Object> updateReview(@PathVariable int reviewNum, @RequestBody ReviewDTO review){
		System.out.println("updateMember>" + review);
		return ResponseEntity.ok(service.updateReview(review));
	}
	/*첨부 파일 업로드*/
	@PostMapping("/myreview/uploadImage")
	public void uploadAjaxActionPost(MultipartFile[] uploadFile, HttpServletRequest request) {
		  
		String upload = request.getSession().getServletContext().getRealPath("/");
		String imgUploadPath = upload +"resources"+ File.separator + "review" + File.separator +"images";
		System.out.println(imgUploadPath);
		
		File uploadPath = new File(imgUploadPath);
		
		//향상된 for 
		for(MultipartFile multipartFile : uploadFile) {
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);
			
			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		 
	}
	
	
	
	
}