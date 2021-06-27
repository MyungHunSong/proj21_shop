package proj21_shop.controller.qna;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QnaInsertPageConroller {

	@GetMapping("/qnaInsert")
	public String insertPage() {
		return "/qnainsert/qnaInsertpage";
	}
	
	@GetMapping("/qnaModify")
	public String modifyPage() {
		return "/qnainsert/qnaModifyPage";
	}
}
