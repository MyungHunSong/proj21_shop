package proj21_shop.controller.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import proj21_shop.dto.qna.Criteria;
import proj21_shop.dto.qna.PageDTO;
import proj21_shop.service.qna.QnaService;

@Controller
public class QnaController {
		
	@Autowired
	private QnaService service;
	 
	// qna 목록.
	@GetMapping("/qna_main")
	public String listCriteria(Criteria cri, Model model) {
		
		model.addAttribute("articles", service.listCriteria(cri));
		
		return"/qna/qna_main";
	}	
	// qna 페이지 넘기기
	@GetMapping("/listPaging")
	public String listPaging(Model model, Criteria criteria) {
		
	    PageDTO pageMaker = new PageDTO();
	  
	    pageMaker.setCri(criteria);
	    pageMaker.setTotalCount(service.countArticles(criteria));

	    model.addAttribute("articles", service.listCriteria(criteria));
	    model.addAttribute("pageMaker", pageMaker);

	    return "/qna/qna_main";
	}
}
