package proj21_shop.controller.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_shop.dto.qna.Criteria;
import proj21_shop.dto.qna.PageDTO;
import proj21_shop.dto.qna.SearchCriteria;
import proj21_shop.service.qna.QnaService;

@RestController
@RequestMapping("/api")
public class QnaRestController {
	
	@Autowired
	private QnaService qnaService;
	 

	// @PathVariable => 경로를 변수화 해주는 어노테이션.
	// @PathVariable 을 사용하지 않았을 경우 도메인 /no = 1, @pathVariable을 사용할 경우 도메인 /1
	@GetMapping("/qna/{page}")
	public ResponseEntity<Object> qna(@PathVariable int page){	
		SearchCriteria searchCriteria = new SearchCriteria();
		searchCriteria.setPage(page);	

		return ResponseEntity.ok(qnaService.listSearch(searchCriteria));
	}
	
	@GetMapping("/qna/{page}/{perPageNum}/{searchType}")
	public ResponseEntity<Object> qna(
			@PathVariable int page
			,@PathVariable int perPageNum
			, @PathVariable String searchType){
		
		PageDTO dto = new PageDTO();
		SearchCriteria sCri = new SearchCriteria();
		
		sCri.setPage(page);
		System.out.println("1.RestController Page => searchCriteria : " + sCri);
		sCri.setPerPageNum(perPageNum);
		System.out.println("2.RestController Page => searchCriteria : " + sCri);
		
		sCri.setSearchType(searchType);
		System.out.println("3.RestController Page => searchCriteria : " + sCri);
		dto.setCri(sCri);
		System.out.println("4.RestController Page => searchCriteria : " + sCri);
		return ResponseEntity.ok(qnaService.listSearch(sCri));
	}
	
}
