package proj21_shop.controller.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_shop.dto.qna.Criteria;
import proj21_shop.dto.qna.SearchCriteria;
import proj21_shop.service.qna.QnaService;

@RestController
@RequestMapping("/api")
public class QnaRestController {
	// 제이슨 으로 받아오는 페이지
	@Autowired
	private QnaService qnaService;
	 
	// 제이슨 으로 받아오는 페이지(데이터 넘겨주기)
	// @PathVariable => 경로를 변수화 해주는 어노테이션.
	// @PathVariable 을 사용하지 않았을 경우 도메인 /no = 1, @pathVariable을 사용할 경우 도메인 /1
	@GetMapping("/qna/{page}")
	public ResponseEntity<Object> qna(@PathVariable int page){
		System.out.println("listCriteria");
		
		SearchCriteria searchCriteria = new SearchCriteria();
		searchCriteria.setPage(page);
		
//		return ResponseEntity.ok(qnaService.listCriteria(searchCriteria)); => 검색어 수정전
		return ResponseEntity.ok(qnaService.listSearch(searchCriteria));
	}
}
