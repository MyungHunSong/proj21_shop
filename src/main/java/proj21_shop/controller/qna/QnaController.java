package proj21_shop.controller.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_shop.dto.qna.Criteria;
import proj21_shop.dto.qna.PageDTO;
import proj21_shop.service.qna.QnaService;

@Controller
@RequestMapping("/qna_main")
public class QnaController {
	
	@Autowired
	private QnaService service;
	
	@GetMapping
	public String form() {
		return"/qna/qna_main";
	}
	
}
