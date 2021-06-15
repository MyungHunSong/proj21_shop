package proj21_shop.controller.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import proj21_shop.dto.qna.PageDTO;
import proj21_shop.dto.qna.SearchCriteria;
import proj21_shop.service.qna.QnaService;

@Controller
public class QnaController {
		
	@Autowired
	private QnaService service;
	 	
	@GetMapping("/qna_main")
	public String listCriteria(SearchCriteria sCri, Model model) {		
		model.addAttribute("articles", service.listSearch(sCri));
		System.out.println("QnaController Cirteria =>" + service.listCriteria(sCri));
		
		return"/qna/qna_main";
	}	
	
	
	
	// @RequestParam HttpReqeust 파라메터를 받을 수 있는 어노테이션
	// 파라메터와 변수명일 일치 시킨다면 자동으로 값이 1:1 매핑된다.	
	@GetMapping("/listPaging")
	public String listPaging(Integer page
			,Integer perPageNum
			,String searchType
			,String keyword, Model model, SearchCriteria searchCriteria) {
		
	    PageDTO pageMaker = new PageDTO();
	  
	    pageMaker.setCri(searchCriteria);
	    pageMaker.setTotalCount(service.countSearchedArticles(searchCriteria));
	    
		model.addAttribute("page",page);
		
		model.addAttribute("perPageNum", searchCriteria.getPerPageNum());
		model.addAttribute("searchType", searchCriteria.getSearchType());
		model.addAttribute("keyword", searchCriteria.getKeyword());
		
		System.out.println("QNAController searchType : "+ searchCriteria);
		System.out.println(keyword);
		
		model.addAttribute("articles", service.listCriteria(searchCriteria));
	    model.addAttribute("pageMaker", pageMaker);
 
	    return "/qna/qna_main";
	}
	
}
