package proj21_shop.controller.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import proj21_shop.dto.qna.Criteria;
import proj21_shop.dto.qna.PageDTO;
import proj21_shop.dto.qna.SearchCriteria;
import proj21_shop.service.qna.QnaService;

@Controller
public class QnaController {
		
	@Autowired
	private QnaService service;
	 
	// qna 목록. => 수정전 (검색어 리스트)
//	@GetMapping("/qna_main")
//	public String listCriteria(Criteria cri, Model model) {
//		
//		model.addAttribute("articles", service.listCriteria(cri));
//		
//		return"/qna/qna_main";
//	}	
	
	@GetMapping("/qna_main")
	public String listCriteria(SearchCriteria searchCriteria, Model model) {
		
		model.addAttribute("articles", service.listSearch(searchCriteria));
		
		return"/qna/qna_main";
	}	
	
	// qna 페이지 넘기기
	// @RequestParam HttpReqeust 파라메터를 받을 수 있는 어노테이션
	// 파라메터와 변수명일 일치 시킨다면 자동으로 값이 1:1 매핑된다.	
	@GetMapping("/listPaging")
	public String listPaging(/* @RequestParam(value = "page") */ Integer page , Model model, SearchCriteria searchCriteria) {
		
	    PageDTO pageMaker = new PageDTO();
	  
	    pageMaker.setCri(searchCriteria);
	    // 맞게 수정한것.
	    pageMaker.setTotalCount(service.countSearchedArticles(searchCriteria));
	    
//	    pageMaker.setTotalCount(service.countArticles(searchCriteria)); => 검색어 수정전
	     
		model.addAttribute("page",page);
		
//	    model.addAttribute("articles", service.listCriteria(searchCriteria)); => 검색어 수정전
		model.addAttribute("articles", service.listSearch(searchCriteria));
	    model.addAttribute("pageMaker", pageMaker);
 
	    return "/qna/qna_main";
	}
	
}
