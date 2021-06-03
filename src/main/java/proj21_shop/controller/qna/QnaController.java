package proj21_shop.controller.qna;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/qna_main")
public class QnaController {
	
	@GetMapping
	public String form() {
		return"/qna/qna_main";
	}
	
}
