package proj21_shop.controller.qna;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QnaInsertPageController {

	
	  @GetMapping("/qnaInsert")
	  public String insertPage() 
	  { return
	  "/qnainsert/qnaInsertpage"; }
	 
	  // 공지사항 목록에서 -> 수정 팝업
	@GetMapping("/qnaModify")
	public String modifyPage() {
		return "/qnainsert/qnaModifyPage";
	}
	// 내가 쓴글 -> 수정 팝업
	@GetMapping("/qnaUpdate")
	public String updatePage() {
		return "/qnainsert/qnaUpdate";
	}
	@GetMapping("/qnaMyOrder")
	public String qnaMyOrderPage() {
		return "/qnainsert/qnaOrderPage";

	}
}
