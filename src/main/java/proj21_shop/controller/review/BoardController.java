package proj21_shop.controller.review;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	@GetMapping("/board")
	public ModelAndView getBoard(@RequestParam(value="memberId") String memberId) {
		ModelAndView mav = new ModelAndView("board/boardList", "memberId", memberId);
		return mav;
	}
}
