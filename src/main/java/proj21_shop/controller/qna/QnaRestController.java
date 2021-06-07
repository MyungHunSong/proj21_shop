package proj21_shop.controller.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_shop.service.qna.QnaService;

@RestController
@RequestMapping("/api")
public class QnaRestController {
	// 제이슨 으로 받아오는 페이지
	@Autowired
	private QnaService qnaService;
	 
	// 제이슨 으로 받아오는 페이지(데이터 넘겨주기)
	@GetMapping("/qna")
	public ResponseEntity<Object> qna(){
		System.out.println("selectAllQna");
		return ResponseEntity.ok(qnaService.selectByAllQnaPage());
	}
	 
}
