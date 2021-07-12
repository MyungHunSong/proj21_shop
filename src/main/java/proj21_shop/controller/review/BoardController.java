package proj21_shop.controller.review;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	/* 내가 쓴 글 페이지로 이동 */
	@GetMapping("/board")
	public ModelAndView getBoard(@RequestParam(value = "memberId") String memberId) {
		ModelAndView mav = new ModelAndView("board/boardList", "memberId", memberId);
		return mav; 
	}

	/* 후기 작성 페이지로 이동 */
	@GetMapping("/detailreview")
	public ModelAndView getDetailReview(@RequestParam(value = "memberId") String memberId,
			@RequestParam(value = "proNum") int proNum) {
		ModelAndView mav = new ModelAndView("review/reviewForm", "memberId", memberId);
		mav.addObject("proNum", proNum);
		return mav;
	}

	/* qna 내용 */
	@GetMapping("/qnacontent")
	public ModelAndView getQnaContent(@RequestParam(value="qMember")String qMember, @RequestParam(value = "qIndex")int qIndex){
		ModelAndView mav = new ModelAndView( );
		mav.addObject("qIndex", qIndex);
		mav.addObject("qMember", qMember);
		mav.setViewName("qna/qna_content");
		return mav;
	}
	

}
